#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Stage 2E-A reviewer audit: DP21 + DP48 only.

Reviewer-supplied. Do not modify to obtain PASS.

The production control gate must export:
    bool kagel_control_dp_allowed(uint8_t dp);
    bool kagel_validate_dp21(const uint8_t *value, size_t len);
    bool kagel_validate_dp48(const uint8_t *value, size_t len);

Stage 2E-A policy:
- DP21 allowed (existing password remote unlock)
- DP48 allowed (remote-key provisioning)
- all other DP control, including DP49, rejected
- DP48 target profile is deliberately narrow:
    enable == 1
    key_id == 1
    start_time < end_time
    use_count == 0xFFFF
    key == exactly 8 ASCII digits
- firmware does NOT generate or persist the remote key
- DP49 remains disabled

Usage:
    python stage2ea_dp48_audit.py --repo . --project studio/tyzs5-telemetry
Optional:
    --cc gcc
    --nm arm-none-eabi-nm
'''

from __future__ import annotations
import argparse, os, shutil, subprocess, tempfile
from pathlib import Path

GOLDENS = {
    'dp48_request_first':
        '55 AA 03 00 4D 04 00 19 30 00 00 15 '
        '01 00 01 6A A1 7C 6E 72 BC 9B 7F FF FF '
        '34 31 30 30 31 35 34 33 80',
    'dp48_result_first':
        '55 AA 03 00 4D 05 00 07 30 00 00 03 00 00 01 8F',
    'dp48_request_rotation':
        '55 AA 03 00 4E 04 00 19 30 00 00 15 '
        '01 00 01 6A A1 7C 6F 72 BC 9B 7F FF FF '
        '33 33 30 38 37 38 38 32 97',
    'dp48_cmd_ack_rotation':
        '55 AA 03 00 4E 04 00 01 00 55',
}

DANGEROUS_OTA = (
    'bootloader_writeStorage',
    'bootloader_eraseStorageSlot',
    'bootloader_setImageToBootload',
    'bootloader_rebootAndInstall',
)

def parse_frame(text):
    raw = bytes.fromhex(text)
    assert len(raw) >= 9 and raw[:2] == b'\x55\xaa'
    n = int.from_bytes(raw[6:8], 'big')
    assert len(raw) == 9 + n
    assert (sum(raw[:-1]) & 0xff) == raw[-1]
    return {'seq': int.from_bytes(raw[3:5], 'big'),
            'cmd': raw[5], 'data': raw[8:-1]}

def parse_dp(data):
    assert len(data) >= 4
    n = int.from_bytes(data[2:4], 'big')
    assert len(data) == 4 + n
    return data[0], data[1], data[4:]

def validate_target_dp48_value(v):
    assert len(v) == 21
    assert v[0] == 1
    assert int.from_bytes(v[1:3], 'big') == 1
    start = int.from_bytes(v[3:7], 'big')
    end = int.from_bytes(v[7:11], 'big')
    assert start < end
    assert v[11:13] == b'\xff\xff'
    assert all(0x30 <= x <= 0x39 for x in v[13:21])
    return {
        'start': start,
        'end': end,
        'key': v[13:21].decode('ascii'),
    }

def compile_gate(repo, cc):
    c = repo/'firmware/kagel_control_gate.c'
    h = repo/'firmware/kagel_control_gate.h'
    if not (c.is_file() and h.is_file()):
        return False, 'FAIL missing firmware/kagel_control_gate.c/.h'

    harness = r'''
#include "kagel_control_gate.h"
#include <stdint.h>
#include <stdio.h>

static int fail(const char *m){fprintf(stderr,"FAIL: %s\n",m);return 1;}

int main(void){
  for(int dp=0;dp<=255;dp++){
    int a=kagel_control_dp_allowed((uint8_t)dp)?1:0;
    if(dp==21 || dp==48){
      if(!a){fprintf(stderr,"FAIL expected allowed DP=%d\n",dp);return 1;}
    } else if(a) {
      fprintf(stderr,"FAIL unexpected allowed DP=%d\n",dp);return 1;
    }
  }

  const uint8_t dp21_ok[]={'5','7','5','7','5','7'};
  if(!kagel_validate_dp21(dp21_ok,sizeof dp21_ok))
    return fail("existing valid DP21 rejected");

  const uint8_t dp48_ok[] = {
    0x01,0x00,0x01,
    0x6A,0xA1,0x7C,0x6E,
    0x72,0xBC,0x9B,0x7F,
    0xFF,0xFF,
    '4','1','0','0','1','5','4','3'
  };
  if(!kagel_validate_dp48(dp48_ok,sizeof dp48_ok))
    return fail("captured valid DP48 rejected");

  uint8_t x[21];

  for(size_t i=0;i<21;i++) x[i]=dp48_ok[i];
  x[0]=0;
  if(kagel_validate_dp48(x,sizeof x))
    return fail("DP48 disable form accepted in Stage 2E-A");

  for(size_t i=0;i<21;i++) x[i]=dp48_ok[i];
  x[2]=2;
  if(kagel_validate_dp48(x,sizeof x))
    return fail("DP48 key_id other than 1 accepted");

  for(size_t i=0;i<21;i++) x[i]=dp48_ok[i];
  x[11]=0; x[12]=1;
  if(kagel_validate_dp48(x,sizeof x))
    return fail("DP48 use_count other than FFFF accepted");

  for(size_t i=0;i<21;i++) x[i]=dp48_ok[i];
  x[13]='A';
  if(kagel_validate_dp48(x,sizeof x))
    return fail("DP48 non-digit key accepted");

  for(size_t i=0;i<21;i++) x[i]=dp48_ok[i];
  x[7]=x[3]; x[8]=x[4]; x[9]=x[5]; x[10]=x[6];
  if(kagel_validate_dp48(x,sizeof x))
    return fail("DP48 start>=end accepted");

  if(kagel_validate_dp48(dp48_ok,20))
    return fail("DP48 short length accepted");
  if(kagel_validate_dp48(NULL,21))
    return fail("NULL DP48 accepted");

  puts("PASS DP21+DP48 narrow control gate");
  return 0;
}
'''
    with tempfile.TemporaryDirectory() as td:
        td=Path(td)
        src=td/'gate_test.c'
        exe=td/('gate_test.exe' if os.name=='nt' else 'gate_test')
        src.write_text(harness,encoding='utf-8')
        cp=subprocess.run(
            [cc,'-std=c99','-Wall','-Wextra','-Werror',
             '-I',str(repo/'firmware'),str(src),str(c),'-o',str(exe)],
            capture_output=True,text=True)
        if cp.returncode:
            return False, cp.stdout+cp.stderr
        rp=subprocess.run([str(exe)],capture_output=True,text=True)
        return rp.returncode==0,(rp.stdout+rp.stderr).strip()

def find_elf(project):
    candidates=[]
    for ext in ('*.out','*.elf','*.axf'):
        candidates += [p for p in project.rglob(ext) if p.is_file()]
    candidates.sort(key=lambda p:p.stat().st_mtime, reverse=True)
    return candidates[0] if candidates else None

def defined_symbols(elf, nm):
    cp=subprocess.run([nm,'-g','--defined-only',str(elf)],
                      capture_output=True,text=True)
    if cp.returncode:
        raise RuntimeError(cp.stdout+cp.stderr)
    return {line.split()[-1] for line in cp.stdout.splitlines() if line.split()}

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--repo',type=Path,default=Path('.'))
    ap.add_argument('--project',type=Path,required=True)
    ap.add_argument('--cc',default='gcc')
    ap.add_argument('--nm',default='nm')
    a=ap.parse_args()

    repo=a.repo.resolve()
    project=a.project if a.project.is_absolute() else (repo/a.project).resolve()
    failures=0

    print('== TARGET_SRPTWVAK DP48 goldens ==')
    decoded={}
    for name,text in GOLDENS.items():
        try:
            decoded[name]=parse_frame(text)
            print('PASS',name)
        except Exception as e:
            print('FAIL',name,e); failures+=1

    print('\n== DP48 target semantics ==')
    for name in ('dp48_request_first','dp48_request_rotation'):
        try:
            dp,typ,v=parse_dp(decoded[name]['data'])
            assert dp==48 and typ==0 and len(v)==21
            info=validate_target_dp48_value(v)
            print(f"PASS {name}: key_id=1 key={info['key']} start={info['start']} end={info['end']}")
        except Exception as e:
            print('FAIL',name,e); failures+=1

    try:
        dp,typ,v=parse_dp(decoded['dp48_result_first']['data'])
        assert dp==48 and typ==0 and v==b'\x00\x00\x01'
        print('PASS DP48 result: status=0, key_id=1')
    except Exception as e:
        print('FAIL DP48 result semantics',e); failures+=1

    print('\n== Portable production gate ==')
    cc=shutil.which(a.cc) or a.cc
    ok,msg=compile_gate(repo,cc); print(msg)
    if not ok: failures+=1

    print('\n== Source integration ==')
    sources=[]
    for root in (repo/'firmware', project):
        if root.is_dir(): sources += list(root.rglob('*.c'))
    joined='\n'.join(p.read_text(encoding='utf-8',errors='replace') for p in sources)
    for sym in ('kagel_control_dp_allowed','kagel_validate_dp21',
                'kagel_validate_dp48','tls_send_dp'):
        if sym in joined: print('PASS source references',sym)
        else: print('FAIL source missing',sym); failures+=1

    print('\n== Final linked binary ==')
    elf=find_elf(project)
    if not elf:
        print('FAIL no ELF/OUT/AXF found'); failures+=1
    else:
        nm=shutil.which(a.nm) or a.nm
        try:
            syms=defined_symbols(elf,nm)
            print('ELF',elf)
            for sym in ('kagel_control_dp_allowed','kagel_validate_dp21',
                        'kagel_validate_dp48','tls_send_dp'):
                if sym in syms: print('PASS linked',sym)
                else: print('FAIL not linked',sym); failures+=1
            for sym in DANGEROUS_OTA:
                if sym in syms:
                    print('FAIL dangerous OTA linked',sym); failures+=1
                else:
                    print('PASS dangerous OTA absent',sym)
        except Exception as e:
            print('FAIL nm audit',e); failures+=1

    print('\n== Reviewer interpretation ==')
    print('INFO Stage 2E-A allows DP21 and DP48 only.')
    print('INFO DP49 remains disabled.')
    print('INFO firmware must not generate, persist, print, or log the 8-digit remote key.')
    print('INFO captured second DP48 reuses key_id=1 with a new key; later successful DP49 uses the newer key.')
    print('INFO Stage 2E-A does not implement DP48 disable/revoke semantics.')

    print(f'\nAUDIT RESULT: {failures} failure(s)')
    return 1 if failures else 0

if __name__=='__main__':
    raise SystemExit(main())
