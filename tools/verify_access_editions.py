"""Four-image static/config/ELF access and identity audit; no hardware operations."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess
root=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser()
p.add_argument('--output',default='artifacts/t3-4a')
a=p.parse_args()
out=root/a.output
tool=Path('C:/SiliconLabs/SimplicityStudio/v5/developer/toolchains/gnu_arm/12.2.rel1_2023.7/bin')
results={}
before=json.loads((root/'artifacts/t3-4a/before/results.json').read_text())
after=json.loads((out/'control/results.json').read_text())
assert all(after[k]==v for k,v in before.items()),'Control test outcomes changed'
for k in after.keys()-before.keys():assert all(v==0 for v in after[k].values()),k
for binding in ('srptwvak','ujcjk46o'):
    name='platform_characterization_test-'+binding+'.log'
    assert (root/'artifacts/t3-4a/before'/name).read_text()==(out/'control'/name).read_text()
# Release preparation permits docs/new Monitor definitions, not validated inputs.
subprocess.run(['git','diff','--exit-code','65417b2','--','firmware','studio/tyzs3-candidate','studio/tyzs5-telemetry',
                'zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js','zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js'],cwd=root,check=True)
for module in ('TYZS5','TYZS3'):
    for edition in ('CONTROL','MONITOR'):
        key=module+'-'+edition;folder=out/'builds'/key
        metadata=json.loads((folder/'build.json').read_text())
        hexpath=root/metadata['hex'];elf=hexpath.with_suffix('.out')
        raw=hexpath.read_bytes();assert hashlib.sha256(raw).hexdigest()==metadata['hex_sha256']
        data={};base=0;eof=False
        for line in raw.decode().splitlines():
            assert line.startswith(':');row=bytes.fromhex(line[1:]);assert sum(row)%256==0 and len(row)==row[0]+5
            kind=row[3];addr=int.from_bytes(row[1:3],'big');val=row[4:-1]
            if kind==0:
                for i,b in enumerate(val):
                    assert base+addr+i not in data;data[base+addr+i]=b
            elif kind==4:base=int.from_bytes(val,'big')<<16
            elif kind==2:base=int.from_bytes(val,'big')<<4
            elif kind==1:eof=True
            else:assert kind in (3,5)
        assert eof and min(data)==0 and max(data)<0x77000
        image=bytes(data.get(i,255) for i in range(max(data)+1))
        monitor=edition=='MONITOR';mode=int(monitor)
        model='TY0A01-'+module+('-MON' if monitor else '')
        # Full tokens, not substring rejection: the Control name is a prefix of Monitor.
        models=set(m.decode() for m in re.findall(rb'TY0A01-TYZS[35](?:-MON)?',image))
        assert models=={model},models
        assert bytes([len(model)])+model.encode() in image,'Missing ZCL length-prefixed identity'
        assert b'Tuya' in image
        version=('1.0.2' if module=='TYZS5' else 'T3-1')+('-MON' if monitor else '')
        nm=subprocess.check_output([str(tool/'arm-none-eabi-nm.exe'),'-n',str(elf)],text=True)
        symbols={line.split()[-1]:int(line.split()[0],16) for line in nm.splitlines() if len(line.split())>=3 and re.fullmatch('[0-9a-fA-F]+',line.split()[0])}
        binding='srptwvak' if module=='TYZS5' else 'ujcjk46o'
        capability='TUYA_LOCK_CAP_EXTENDED_V1' if module=='TYZS5' else 'TUYA_LOCK_CAP_CORE_V1'
        for name in ['tzll_access_mode','tzll_access_external_dp_writable','kagel_control_dp_allowed','lock_app_ef00_rx','lock_binding_'+binding,capability]:assert name in symbols,name
        for name in ['bootloader_writeStorage','bootloader_eraseStorageSlot','bootloader_setImageToBootload','bootloader_rebootAndInstall']:assert name not in symbols,name
        assert symbols['linker_nvm_begin']==0x77000 and symbols['linker_nvm_end']==0x80000
        def dis(name):return subprocess.check_output([str(tool/'arm-none-eabi-objdump.exe'),'-d','--disassemble='+name,str(elf)],text=True)
        mode_dis=dis('tzll_access_mode')
        assert re.search(r'movs\s+r0, #'+str(mode)+r'\b',mode_dis) and re.search(r'bx\s+lr',mode_dis)
        gate=dis('tzll_access_external_dp_writable')
        assert '<tzll_access_mode>' in gate and re.search(r'cbnz\s+r0',gate) and re.search(r'movs\s+r0, #0',gate)
        assert '<tzll_access_external_dp_writable>' in dis('kagel_control_dp_allowed')
        runtime=dis('kagel_app_init');assert 'emberAfWriteServerAttribute' in runtime
        # DP204 points to the exact bounded runtime version string, not only a debug literal.
        versions=[addr for name,addr in symbols.items() if name.startswith('s_fwver.')];assert versions
        assert any(image[addr:addr+len(version)+1]==version.encode()+b'\0' for addr in versions)
        defines=(folder/(metadata['stem']+'.project.mak')).read_text()
        assert '-DTZLL_ACCESS_EDITION='+str(mode) in defines
        assert '-DKAGEL_TELEMETRY_ONLY=1' in defines and '-DKAGEL_CONTROL_STAGE2G=1' in defines
        assert '-DKAGEL_PROFILE='+('KAGEL_PROFILE_TYZS5_SRPTWVAK' if module=='TYZS5' else 'KAGEL_PROFILE_TYZS3_HARDENED') in defines
        if module=='TYZS3':assert '-DKAGEL_EM2_DEEPSLEEP=0' in defines and '-DLOCK_PROFILE_UJCJK46O=1' in defines
        else:assert '-DKAGEL_EM2_DEEPSLEEP=0' not in defines
        config=(folder/'zap-config.h').read_text()
        assert re.search(r'0x0005, ZCL_CHAR_STRING_ATTRIBUTE_TYPE, 33,',config)
        assert len(model)<=32
        zap=json.loads((folder/'zcl_config.zap').read_text())
        assert not any(c.get('enabled') and c.get('code')==25 for e in zap['endpointTypes'] for c in e['clusters'])
        # Independently preprocess the actual runtime identity selector with this build's selectors.
        gcc=tool/'arm-none-eabi-gcc.exe'
        flags=['-DKAGEL_PROFILE='+('1' if module=='TYZS5' else '2'),'-DKAGEL_TELEMETRY_ONLY=1','-DTZLL_ACCESS_EDITION='+str(mode)]
        macros=subprocess.check_output([str(gcc),'-E','-dM','-x','c','-I'+str(root/'firmware/common'),'-I'+str(root/'firmware/TYZS5'),*flags,'-include','kagel_profile.h','-'],input='',text=True)
        assert '#define KAGEL_BASIC_MODEL "'+model+'"' in macros
        (folder/'access-disassembly.txt').write_text(mode_dis+gate+dis('kagel_control_dp_allowed')+runtime)
        results[key]={'hex':metadata['hex'],'hex_file_bytes':len(raw),'flash_bytes':len(data),'sha256':metadata['hex_sha256'],
                      'identity':'Tuya / '+model,'module':module,'product_binding':binding,'capability_profile':capability,'edition':edition,
                      'diagnostic_version':version,'ota':'disabled; write/install symbols absent','em2':module=='TYZS5',
                      'em_policy':'existing TYZS5 EM2 policy' if module=='TYZS5' else 'EM1 retained; EM2 disabled',
                      'elf_access_mode':mode,'runtime_identity':'preprocessor + runtime attribute writer + final image PASS','build':'PASS'}
(out/'four-build-results.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results,indent=2));print('FOUR-EDITION AUDIT: ALL PASS')
