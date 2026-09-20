"""Generate isolated edition metadata from existing Studio inputs; share firmware sources."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

root=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser()
p.add_argument('--module',choices=['TYZS5','TYZS3'],required=True)
p.add_argument('--edition',choices=['Control','Monitor'],required=True)
p.add_argument('--sdk',required=True)
a=p.parse_args()
folder,stem=('tyzs5-telemetry','kagel_tyzs5_srptwvak_clean') if a.module=='TYZS5' else ('tyzs3-candidate','kagel_tyzs3_ujcjk46o')
source=root/'studio'/folder
project=root/'studio'/('tzll-'+a.module.lower()+'-'+a.edition.lower()+'-generated')
project.mkdir(exist_ok=True)
# Copy only input metadata, not build/IDE products or firmware source forks.
for name in ['config','tools']:
    shutil.copytree(source/name,project/name,dirs_exist_ok=True)
for name in ['app.c','main.c','readme.html',stem+'.Makefile',stem+'.pintool']:
    if (source/name).exists():shutil.copy2(source/name,project/name)
slcp=(source/(stem+'.slcp')).read_text(encoding='utf8')
assert 'TZLL_ACCESS_EDITION' not in slcp
slcp=slcp.replace('define:\n','define:\n- {name: TZLL_ACCESS_EDITION, value: '+("'1'" if a.edition=='Monitor' else "'0'")+'}\n')
(project/(stem+'.slcp')).write_text(slcp,encoding='utf8')
zap_path=project/'config/zcl/zcl_config.zap'
zap=json.loads(zap_path.read_text())
model='TY0A01-'+a.module+('-MON' if a.edition=='Monitor' else '')
def update(node):
    if isinstance(node,dict):
        if node.get('code')==0 and 'attributes' in node:
            for attr in node['attributes']:
                if attr.get('code')==5:
                    assert attr['defaultValue']=='TY0A01-'+a.module
                    attr['defaultValue']=model
        for value in node.values():update(value)
    elif isinstance(node,list):
        for value in node:update(value)
update(zap)
zap_path.write_text(json.dumps(zap,indent=2)+'\n',encoding='utf8')
out=root/'artifacts/t3-4a/builds'/(a.module+'-'+a.edition.upper())
out.mkdir(parents=True,exist_ok=True)
env=os.environ.copy()
env['PATH']=r'C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin'+os.pathsep+env['PATH']
slc=shutil.which('slc',path=env['PATH']);assert slc
shell=shutil.which('pwsh') or 'powershell'
commands=[[slc,'generate','-p',stem+'.slcp','-s',a.sdk,'-o','makefile','--no-copy'],
          [shell,'-NoProfile','-File',str(project/'tools/generate_zap.ps1'),'-SdkRoot',a.sdk],
          ['make','-f',stem+'.Makefile','clean'],['make','-f',stem+'.Makefile','-j8']]
with (out/'build.log').open('w',encoding='utf8') as log:
    for cmd in commands:
        log.write('COMMAND: '+repr(cmd)+'\n');log.flush()
        subprocess.run(cmd,cwd=project,env=env,stdout=log,stderr=subprocess.STDOUT,check=True)
label=a.module+'-T3-4-'+a.edition.upper()+'-REGRESSION'
for suffix in ('.hex','.out'):
    shutil.copy2(project/'build/debug'/(stem+suffix),out/(label+suffix))
for path in [stem+'.slcp',stem+'.project.mak','config/zcl/zcl_config.zap','autogen/zap-config.h']:
    dest=out/Path(path).name;shutil.copy2(project/path,dest)
metadata={'module':a.module,'edition':a.edition,'stem':stem,'project':str(project.relative_to(root)),
          'hex':str((out/(label+'.hex')).relative_to(root)),
          'hex_sha256':hashlib.sha256((out/(label+'.hex')).read_bytes()).hexdigest(),
          'commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),
          'build':'Generate + Clean + Build PASS'}
(out/'build.json').write_text(json.dumps(metadata,indent=2)+'\n')
print(a.module,a.edition,metadata['build'],metadata['hex_sha256'],flush=True)
