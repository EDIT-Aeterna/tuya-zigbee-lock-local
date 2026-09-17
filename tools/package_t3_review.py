"""Package the committed T3-1 candidate and evidence, not a public release."""
from pathlib import Path
import hashlib, json, shutil, subprocess, zipfile, argparse
root=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser()
parser.add_argument('--baseline',default='866a7ad')
parser.add_argument('--output-name',default='TZLL-T3-1-review')
args=parser.parse_args()
baseline=args.baseline
assert Path(args.output_name).name==args.output_name and args.output_name.startswith('TZLL-')
out=root.parent/args.output_name
if out.exists(): raise SystemExit('Review folder exists; preserve it and choose a fresh output')
out.mkdir()
def git(*args):return subprocess.check_output(['git',*args],cwd=root)
def copy(src,dst):
    dest=out/dst;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(root/src,dest)
head=git('rev-parse','HEAD').decode().strip()
commits=git('log','--reverse','--format=%h %s',baseline+'..HEAD').decode()
(out/'COMMITS.txt').write_text(f'Baseline: {baseline}\nFinal commit: {head}\nBranch: feature/tyzs3-common-core\n\n'+commits,encoding='utf8')
(out/'common-core.diff').write_bytes(git('diff','--binary','--find-renames',baseline,'HEAD','--','firmware','tests','tools','studio/tyzs5-telemetry/kagel_tyzs5_srptwvak_clean.slcp','studio/tyzs3-candidate/kagel_tyzs3_ujcjk46o.slcp'))
copy('docs/TYZS3_TYZS5_COMMON_CORE.md','COMMON_CORE_REPORT.md')
copy('docs/TYZS3_FIRST_FLASH_PLAN.md','FIRST_FLASH_PLAN.md')
if (root/'docs/TYZS3_PID_GATE_HOTFIX_REPORT.md').exists():
    copy('docs/TYZS3_PID_GATE_HOTFIX_REPORT.md','PID_GATE_HOTFIX_REPORT.md')
if (root/'docs/T3_1_STATIC_GATE_FIX_REPORT.md').exists():
    copy('docs/T3_1_STATIC_GATE_FIX_REPORT.md','STATIC_GATE_FIX_REPORT.md')
    converter = 'tuya_ty0a01_tyzs3.js' if (root/'zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js').exists() else 'tuya_ty0a01_tyzs3_candidate.js'
    copy('zigbee2mqtt/TYZS3/'+converter,'zigbee2mqtt/'+converter)
    copy('zigbee2mqtt/TYZS3/README.md','zigbee2mqtt/README.md')
    (out/'static-gate.diff').write_bytes(git('diff','--binary',baseline,'HEAD','--','firmware','tests','tools','docs','zigbee2mqtt/TYZS3','studio/tyzs3-candidate/kagel_tyzs3_ujcjk46o.slcp'))
report=(root/'docs/TYZS3_TYZS5_COMMON_CORE.md').read_text(encoding='utf8')
policy=report.split('## Profile policy\n',1)[1].split('## Protocol corrections',1)[0]
(out/'PROFILE_POLICY.md').write_text('# Profile policy\n'+policy,encoding='utf8')
results=json.loads((root/'artifacts/t3-1/build-results.json').read_text())
for target,r in results.items():
    label='TYZS3-T3-1-CANDIDATE.hex' if target=='TYZS3' else 'TYZS5-T3-1-REGRESSION.hex'
    copy(r['hex'],'firmware/'+label)
    rows='\n'.join(f'- {k}: `{v}`' for k,v in r.items() if k!='elf_sizes')
    (out/(target+'_BUILD_RESULT.md')).write_text(f'# {target} build result\n\n{rows}\n\n```text\n{r["elf_sizes"]}\n```\n\nNo hardware verification in this phase.\n',encoding='utf8')
shutil.copytree(root/'artifacts/t3-1',out/'evidence')
subprocess.run(['git','archive','--format=zip','--prefix=TZLL-source/','--output='+str(out/'source.zip'),'HEAD'],cwd=root,check=True)
manifest=[]
for f in sorted(out.rglob('*')):
    if f.is_file():manifest.append(hashlib.sha256(f.read_bytes()).hexdigest()+'  '+f.relative_to(out).as_posix())
(out/'SHA256SUMS.txt').write_text('\n'.join(manifest)+'\n',encoding='utf8')
archive=out.with_suffix('.zip')
if archive.exists():raise SystemExit('Archive exists; refusing overwrite')
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
    for f in out.rglob('*'):
        if f.is_file():z.write(f,Path(out.name)/f.relative_to(out))
with zipfile.ZipFile(archive) as z:
    assert z.testzip() is None
    for line in manifest:
        expected,name=line.split('  ',1)
        assert hashlib.sha256(z.read(out.name+'/'+name)).hexdigest()==expected,name
digest=hashlib.sha256(archive.read_bytes()).hexdigest()
archive.with_suffix('.zip.sha256').write_text(digest+'  '+archive.name+'\n',encoding='ascii')
print(archive);print(digest);print('ZIP manifest: ALL PASS')
