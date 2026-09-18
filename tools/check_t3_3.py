"""Compare characterization evidence and verify module/binding independence."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile

root=Path(__file__).resolve().parents[1]
out=root/'artifacts/t3-3'
before=json.loads((out/'before/results.json').read_text())
after=json.loads((out/'after/results.json').read_text())
assert all(after[k]==v for k,v in before.items()), 'Characterized test outcomes changed'
for name in set(after)-set(before):
    assert all(v==0 for v in after[name].values()), name
for binding in ('srptwvak','ujcjk46o'):
    name='platform_characterization_test-'+binding+'.log'
    assert (out/'before'/name).read_bytes()==(out/'after'/name).read_bytes(), name
subprocess.run(['git','diff','--exit-code','3e7fbed','--','zigbee2mqtt'],cwd=root,check=True)
hashes={}
for target in ('TYZS3','TYZS5'):
    p=root/'zigbee2mqtt'/target/('tuya_ty0a01_'+target.lower()+'.js')
    subprocess.run(['node','--check',str(p)],check=True)
    hashes[target]=hashlib.sha256(p.read_bytes()).hexdigest()

env=os.environ.copy()
env['PATH']=r'C:\msys64\ucrt64\bin'+os.pathsep+env['PATH']
gcc=r'C:\msys64\ucrt64\bin\gcc.exe'
matrix=[]
with tempfile.TemporaryDirectory(prefix='tzll-module-binding-') as tmp:
    for target,number in [('TYZS5',1),('TYZS3',2)]:
        for binding,select in [('srptwvak',0),('ujcjk46o',1)]:
            code=('#include "kagel_profile.h"\n#include "lock_product_binding.h"\n'
                  '#include <assert.h>\n#include <string.h>\nint main(void){'
                  f'assert(strcmp(KAGEL_BASIC_MODEL,"TY0A01-{target}")==0);'
                  f'assert(strcmp(lock_binding_default()->pid,"{binding}")==0);'
                  'assert(lock_binding_default()->timezone_offset_seconds==28800);return 0;}')
            c=Path(tmp)/'matrix.c';exe=Path(tmp)/'matrix.exe';c.write_text(code)
            cmd=[gcc,'-std=c99','-Wall','-Wextra','-Werror',str(c),
                 str(root/'firmware/common/lock_product_binding.c'),
                 str(root/'firmware/common/lock_capability_profile.c'),
                 '-I'+str(root/'firmware/common'),'-I'+str(root/'firmware/TYZS5'),
                 '-DKAGEL_PROFILE='+str(number),'-DKAGEL_TELEMETRY_ONLY=1',
                 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1','-DLOCK_PROFILE_UJCJK46O='+str(select),'-o',str(exe)]
            if target=='TYZS3':cmd+=['-DKAGEL_REQUIRE_TYZS3_PROFILE=1']
            subprocess.run(cmd,env=env,check=True,capture_output=True)
            subprocess.run([str(exe)],env=env,check=True,capture_output=True)
            matrix.append(target+' + '+binding+': PASS (host independence test only)')
result={'baseline':'3e7fbed','characterization':'identical pre/post UART/report trace digests',
        'existing_test_outcomes':'unchanged, including 4 documented stale conflicts',
        'new_tests':'PASS','converter_sha256':hashes,'module_binding_matrix':matrix,
        'hardware':'not tested; maintainer regression required','publication':'not performed'}
(out/'platform-checks.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
