import hashlib
import pathlib
import zipfile

root = pathlib.Path(__file__).resolve().parents[1]
out = root.parent / 'TYZS5-lock-port-stage2g-credential-management-R.zip'
files = sorted(p for p in root.rglob('*') if p.is_file()
               and '.git' not in p.relative_to(root).parts
               and '__pycache__' not in p.parts
               and p.suffix.lower() not in {'.o', '.obj', '.d', '.pyc'})
with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    for p in files:
        z.write(p, p.relative_to(root).as_posix())
with zipfile.ZipFile(out) as z:
    assert z.testzip() is None
    names = set(z.namelist())
    for required in ('firmware/kagel_control_gate.c',
                     'firmware/kagel_control_gate.h',
                     'docs/CREDENTIAL_MANAGEMENT_PROTOCOL.md',
                     'docs/PHASE2G_CREDENTIAL_MANAGEMENT_REPORT.md',
                     'studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex'):
        assert required in names, required
print(out)
print('SHA256:', hashlib.sha256(out.read_bytes()).hexdigest().upper())
