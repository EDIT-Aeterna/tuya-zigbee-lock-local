"""Offline HEX/ELF evidence; never opens a debug probe."""
from pathlib import Path
import subprocess, hashlib, json, argparse
root=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser()
parser.add_argument('--output', default='artifacts/t3-1')
args=parser.parse_args()
output=root/args.output
output.mkdir(parents=True,exist_ok=True)
tools=Path('C:/SiliconLabs/SimplicityStudio/v5/developer/toolchains/gnu_arm/12.2.rel1_2023.7/bin')
results={}
for target,folder,stem,profile in [('TYZS5','tyzs5-telemetry','kagel_tyzs5_srptwvak_clean','srptwvak'),('TYZS3','tyzs3-candidate','kagel_tyzs3_ujcjk46o','ujcjk46o')]:
    project=root/'studio'/folder
    hexpath=project/'build/debug'/(stem+'.hex')
    elf=hexpath.with_suffix('.out')
    data={};base=0;eof=False
    for line in hexpath.read_text().splitlines():
        row=bytes.fromhex(line[1:]);assert line.startswith(':') and sum(row)%256==0 and len(row)==row[0]+5
        kind=row[3];address=int.from_bytes(row[1:3],'big');value=row[4:-1]
        if kind==0:
            for offset,b in enumerate(value):
                a=base+address+offset;assert a not in data;data[a]=b
        elif kind==4:base=int.from_bytes(value,'big')<<16
        elif kind==2:base=int.from_bytes(value,'big')<<4
        elif kind==1:eof=True
        else:assert kind in (3,5)
    assert eof and min(data)==0 and max(data)<0x77000
    image=bytes(data.get(a,255) for a in range(max(data)+1))
    assert ('TY0A01-'+target).encode() in image and b'Tuya' in image
    opposite = 'TYZS3' if target == 'TYZS5' else 'TYZS5'
    assert ('TY0A01-'+opposite).encode() not in image, 'Opposite runtime model present'
    nm=subprocess.check_output([str(tools/'arm-none-eabi-nm.exe'),'-n',str(elf)],text=True)
    symbols={line.split()[-1]:line.split()[0] for line in nm.splitlines() if len(line.split())>=3}
    for forbidden in ['bootloader_writeStorage','bootloader_eraseStorageSlot','bootloader_setImageToBootload','bootloader_rebootAndInstall']:
        assert forbidden not in symbols, forbidden
    capability='TUYA_LOCK_CAP_CORE_V1' if target=='TYZS3' else 'TUYA_LOCK_CAP_EXTENDED_V1'
    for required in ['tls_send_dp','kagel_control_dp_allowed','kagel_validate_dp21','lock_app_ef00_rx','lock_binding_'+profile,capability]:assert required in symbols,required
    assert int(symbols['linker_nvm_begin'],16)==0x77000 and int(symbols['linker_nvm_end'],16)==0x80000
    defs=(project/(stem+'.project.mak')).read_text()
    assert '-DKAGEL_TELEMETRY_ONLY=1' in defs and '-DKAGEL_CONTROL_STAGE2G=1' in defs
    if target=='TYZS3':
        assert '-DLOCK_PROFILE_UJCJK46O=1' in defs
        assert '-DKAGEL_EM2_DEEPSLEEP=0' in defs
        assert b'T3-1' in image
        adapter = subprocess.check_output([str(tools/'arm-none-eabi-objdump.exe'),'-d','--disassemble=kagel_app_init',str(elf)],text=True)
        assert '<bootloader_init>' not in adapter and 'bootloader_getStorageSlotInfo' not in symbols
        # SDK sl_platform_init still initializes its mandatory read-only interface.
    else:
        assert '-DKAGEL_EM2_DEEPSLEEP=0' not in defs
        assert b'1.0.2' in image
    zap=json.loads((project/'config/zcl/zcl_config.zap').read_text())
    assert not any(c.get('enabled') and c.get('code')==25 for e in zap['endpointTypes'] for c in e['clusters'])
    sizes=subprocess.check_output([str(tools/'arm-none-eabi-size.exe'),str(elf)],text=True).strip()
    results[target]={'hex':str(hexpath.relative_to(root)).replace('\\','/'),'hex_sha256':hashlib.sha256(hexpath.read_bytes()).hexdigest(),'hex_file_bytes':hexpath.stat().st_size,'flash_data_bytes':len(data),'image_range_inclusive':[hex(min(data)),hex(max(data))],'elf_sizes':sizes,'identity':'Tuya / TY0A01-'+target,'profile':profile,'nvm3_candidate_range':'0x77000..0x7FFFF (linked candidate only, not proof of stock layout)','ota_write_install_symbols':'absent','build':'Generate + Clean + Build PASS'}
    results[target].update({'opposite_model_absent':True,'module_version':'T3-1' if target=='TYZS3' else '1.0.2','em2_enabled':target=='TYZS5','bootloader_probe_enabled':target=='TYZS5'})
    results[target].update({'product_binding':profile,'capability_profile':capability})
    (output/(target.lower()+'-symbols.txt')).write_text(nm,encoding='utf8')
out=output/'build-results.json';out.write_text(json.dumps(results,indent=2),encoding='utf8')
print(json.dumps(results,indent=2))
