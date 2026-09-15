#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Reviewer-supplied Stage 2F audit.
Do not modify to obtain PASS.

Allowed control DPs:
21,24,25,26,27,28,39,48,49

Required new API:
bool kagel_validate_temp_password_dp(uint8_t dp, const uint8_t *value, size_t len);

Evidence:
- DP24 TARGET_SRPTWVAK: 27-byte RAW, target verified.
- DP25/27/28/39: generic Tuya 6-byte reference request only.
- DP26: generic Tuya 21-byte create/update layout only; TARGET UNVERIFIED.

Usage:
python stage2f_temp_password_audit.py --repo . --project studio/tyzs5-telemetry
"""

from __future__ import annotations
import argparse, os, shutil, subprocess, tempfile
from pathlib import Path

ALLOWED = {21,24,25,26,27,28,39,48,49}
OTA = {
    "bootloader_writeStorage",
    "bootloader_eraseStorageSlot",
    "bootloader_setImageToBootload",
    "bootloader_rebootAndInstall",
}

def find_elf(project: Path):
    items=[]
    for ext in ("*.out","*.elf","*.axf"):
        items += [p for p in project.rglob(ext) if p.is_file()]
    items.sort(key=lambda p:p.stat().st_mtime, reverse=True)
    return items[0] if items else None

def nm_defined(elf: Path, nm: str):
    cp=subprocess.run([nm,"-g","--defined-only",str(elf)],capture_output=True,text=True)
    if cp.returncode:
        raise RuntimeError(cp.stdout+cp.stderr)
    return {ln.split()[-1] for ln in cp.stdout.splitlines() if ln.split()}

def compile_gate(repo: Path, cc: str):
    c=repo/"firmware/kagel_control_gate.c"
    h=repo/"firmware/kagel_control_gate.h"
    if not (c.is_file() and h.is_file()):
        return False,"missing kagel_control_gate.c/.h"
    harness=r"""
#include "kagel_control_gate.h"
#include <stdint.h>
#include <stdio.h>

static int bad(const char*m){fprintf(stderr,"FAIL %s\n",m);return 1;}

int main(void){
  for(int dp=0;dp<=255;dp++){
    int a=kagel_control_dp_allowed((uint8_t)dp)?1:0;
    int e=(dp==21||dp==24||dp==25||dp==26||dp==27||dp==28||dp==39||dp==48||dp==49);
    if(a!=e){fprintf(stderr,"FAIL allowlist dp=%d\n",dp);return 1;}
  }

  const uint8_t dp24[]={
    0x03,0xE3,0x00,0x01,0x00,0x00,
    0x6A,0x9F,0xDA,0x3F,0x6A,0xA1,0x2B,0xBF,
    0,0,0,0,0,0,1,'5','8','1','9','9','3'
  };
  if(!kagel_validate_temp_password_dp(24,dp24,sizeof dp24)) return bad("target DP24");
  if(kagel_validate_temp_password_dp(24,dp24,26)) return bad("DP24 wrong length");

  const uint8_t ref6[]={0x03,0xE3,0x00,0x01,0x00,0x00};
  const uint8_t refs[]={25,27,28,39};
  for(unsigned i=0;i<sizeof refs;i++){
    if(!kagel_validate_temp_password_dp(refs[i],ref6,6)) return bad("generic ref rejected");
    if(kagel_validate_temp_password_dp(refs[i],ref6,5)) return bad("generic ref bad length");
  }

  const uint8_t dp26[]={
    0x03,0xE3,0x00,0x01,0x00,0x00,
    0x6A,0x9F,0xDA,0x3F,0x6A,0xA1,0x2B,0xBF,
    1,'5','8','1','9','9','3'
  };
  if(!kagel_validate_temp_password_dp(26,dp26,sizeof dp26)) return bad("generic DP26");
  if(kagel_validate_temp_password_dp(26,dp26,20)) return bad("DP26 bad length");
  if(kagel_validate_temp_password_dp(30,ref6,6)) return bad("unrelated dp accepted");

  puts("PASS Stage 2F gate/validators");
  return 0;
}
"""
    with tempfile.TemporaryDirectory() as td:
        td=Path(td); src=td/"t.c"; exe=td/("t.exe" if os.name=="nt" else "t")
        src.write_text(harness,encoding="utf-8")
        cp=subprocess.run([cc,"-std=c99","-Wall","-Wextra","-Werror",
                           "-I",str(repo/"firmware"),str(src),str(c),"-o",str(exe)],
                          capture_output=True,text=True)
        if cp.returncode: return False,cp.stdout+cp.stderr
        rp=subprocess.run([str(exe)],capture_output=True,text=True)
        return rp.returncode==0,(rp.stdout+rp.stderr).strip()

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--repo",type=Path,default=Path("."))
    ap.add_argument("--project",type=Path,required=True)
    ap.add_argument("--cc",default="gcc")
    ap.add_argument("--nm",default="nm")
    a=ap.parse_args()

    repo=a.repo.resolve()
    project=a.project if a.project.is_absolute() else (repo/a.project).resolve()
    failures=0

    print("== Portable gate ==")
    ok,msg=compile_gate(repo,shutil.which(a.cc) or a.cc)
    print(msg)
    if not ok: failures+=1

    print("\n== Source integration ==")
    joined="\n".join(p.read_text(encoding="utf-8",errors="replace")
                     for root in (repo/"firmware",project) if root.is_dir()
                     for p in root.rglob("*.c"))
    for sym in ("kagel_control_dp_allowed","kagel_validate_dp21","kagel_validate_dp48",
                "kagel_validate_dp49","kagel_validate_temp_password_dp","tls_send_dp"):
        if sym in joined: print("PASS",sym)
        else: print("FAIL missing",sym); failures+=1

    print("\n== Linked binary ==")
    elf=find_elf(project)
    if not elf:
        print("FAIL no ELF/OUT/AXF"); failures+=1
    else:
        try:
            syms=nm_defined(elf,shutil.which(a.nm) or a.nm)
            for sym in ("kagel_control_dp_allowed","kagel_validate_temp_password_dp","tls_send_dp"):
                if sym in syms: print("PASS linked",sym)
                else: print("FAIL not linked",sym); failures+=1
            for sym in OTA:
                if sym in syms: print("FAIL dangerous OTA linked",sym); failures+=1
                else: print("PASS OTA absent",sym)
        except Exception as e:
            print("FAIL nm",e); failures+=1

    print("\nEVIDENCE:")
    print("TARGET_VERIFIED: DP24 27-byte srptwvak layout")
    print("GENERIC_ONLY: DP25/27/28/39 6-byte reference request")
    print("GENERIC_ONLY: DP26 21-byte create/update layout")
    print("DP39 is destructive clear-all and requires explicit UI confirmation.")
    print(f"\nAUDIT RESULT: {failures} failure(s)")
    return 1 if failures else 0

if __name__=="__main__":
    raise SystemExit(main())
