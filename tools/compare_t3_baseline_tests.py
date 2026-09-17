"""Prove historic reviewer conflicts also fail on unmodified alpha.2 baseline."""
import subprocess, tempfile, os, json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
os.chdir(root)
env=os.environ.copy();env['PATH']=r'C:\msys64\ucrt64\bin'+os.pathsep+env['PATH']
out=root/'artifacts/t3-1/host';out.mkdir(parents=True,exist_ok=True)
results={}
with tempfile.TemporaryDirectory(prefix='tzll-baseline-') as tmp:
    tmp=Path(tmp)
    names=['lock_app.c','lock_app.h','nicki_ek_lock_serial.c','nicki_ek_lock_serial.h','kagel_control_gate.c','kagel_control_gate.h']
    for name in names:
        (tmp/name).write_bytes(subprocess.check_output(['git','show',f'866a7ad:firmware/TYZS5/{name}']))
    for name in ['stage2dr_control_gate_test','stage2ea_ef00_integration_test','stage2eb_ef00_integration_test','stage2f_ef00_integration_test']:
        exe=tmp/(name+'.exe')
        cmd=[r'C:\msys64\ucrt64\bin\gcc.exe','-std=c99','-Wall','-Wextra','-Werror',str(root/'tests'/(name+'.c')),*[str(tmp/n) for n in names if n.endswith('.c')],'-I',str(tmp),'-o',str(exe)]
        c=subprocess.run(cmd,env=env,capture_output=True,text=True,errors='replace')
        r=subprocess.run([str(exe)],env=env,capture_output=True,text=True,errors='replace') if c.returncode==0 else c
        results[name]={'compile':c.returncode,'test':r.returncode}
        (out/(name+'-baseline.log')).write_text(c.stdout+c.stderr+r.stdout+r.stderr,encoding='utf8')
        print(name,results[name])
(out/'baseline-conflicts.json').write_text(json.dumps(results,indent=2),encoding='utf8')
