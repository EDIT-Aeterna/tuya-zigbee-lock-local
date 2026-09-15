"""Package offline review deliverable, excluding Git and intermediate objects."""
import hashlib
import pathlib
import zipfile

root = pathlib.Path(__file__).resolve().parents[1]
out = root.parent / 'TYZS5-lock-port-stage2br-telemetry.zip'
paths = sorted(p for p in root.rglob('*') if p.is_file()
    and '.git' not in p.relative_to(root).parts
    and '__pycache__' not in p.parts
    and p.suffix.lower() not in {'.o','.obj','.d','.pyc'})
with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    for p in paths:
        z.write(p, p.relative_to(root).as_posix())
with zipfile.ZipFile(out) as z:
    assert z.testzip() is None
    assert 'tests/stage11_lock_app_time_integration_test.c' in z.namelist()
    assert not any(n.endswith(('.o','.obj')) for n in z.namelist())
print(out)
print('Bytes:', out.stat().st_size)
print('SHA256:', hashlib.sha256(out.read_bytes()).hexdigest().upper())
