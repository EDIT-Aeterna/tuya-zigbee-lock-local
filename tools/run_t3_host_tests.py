"""Run all available C host tests against the shared core; retain every result."""
import os
from pathlib import Path
import subprocess
import tempfile
import json
import argparse
root = Path(__file__).resolve().parents[1]
os.chdir(root)
env = os.environ.copy()
env['PATH'] = r'C:\msys64\ucrt64\bin' + os.pathsep + env['PATH']
gcc = r'C:\msys64\ucrt64\bin\gcc.exe'
parser = argparse.ArgumentParser()
parser.add_argument('--output', default='artifacts/t3-1/host')
args = parser.parse_args()
out = root / args.output
out.mkdir(parents=True, exist_ok=True)
core = list((root / 'firmware/common').glob('*.c'))
results = {}
with tempfile.TemporaryDirectory(prefix='tzll-t3-tests-') as temporary:
    tests = list((root/'tests').glob('*.c')) + [root/'firmware/TYZS5/host_selftest.c']
    for test in tests:
        for profile in (['srptwvak', 'ujcjk46o'] if test.stem in ('t3_common_core_test', 'platform_characterization_test', 'platform_binding_test') else ['srptwvak']):
            name = test.stem + '-' + profile
            exe = Path(temporary) / (name + '.exe')
            cmd = [gcc, '-std=c99', '-Wall', '-Wextra', '-Werror', str(test), *map(str,core), '-I', 'firmware/common', '-I', 'firmware/TYZS5', '-o', str(exe)]
            if profile == 'ujcjk46o': cmd += ['-DLOCK_PROFILE_UJCJK46O=1']
            build = subprocess.run(cmd, env=env, capture_output=True, text=True, errors='replace')
            run = subprocess.run([str(exe)],env=env,capture_output=True,text=True,errors='replace') if build.returncode == 0 else build
            results[name] = {'compile': build.returncode, 'test': run.returncode}
            (out/(name+'.log')).write_text(build.stdout+build.stderr+run.stdout+run.stderr, encoding='utf8')
            print(name, results[name], flush=True)
for name, cmd in [('fixtures',['python','tests/run_fixtures.py']), ('bitmap',['node','tests/credential_bitmap_test.js']), ('bitmap_reference',['node','tests/credential_bitmap_regression.js']), ('tyzs3_converter',['node','tests/tyzs3_converter_test.js'])]:
    r = subprocess.run(cmd,env=env,capture_output=True,text=True,errors='replace')
    results[name] = {'test':r.returncode}
    (out/(name+'.log')).write_text(r.stdout+r.stderr,encoding='utf8')
    print(name,results[name],flush=True)
(out/'results.json').write_text(json.dumps(results,indent=2),encoding='utf8')
# Earlier stage tests can intentionally conflict with the reviewed Stage 2G policy.
# Report failures for review; never silently skip or rewrite reviewer assertions.
raise SystemExit(int(any(any(code for code in r.values()) for r in results.values())))
