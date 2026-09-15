import hashlib, pathlib, zipfile
root = pathlib.Path(__file__).resolve().parents[1]
handoff = root.parent / 'TYZS5_PROJECT_HANDOFF.md'
out = root.parent / 'TYZS5-current-project-with-handoff.zip'
files = sorted(p for p in root.rglob('*') if p.is_file() and '.git' not in p.relative_to(root).parts and '__pycache__' not in p.parts and p.suffix.lower() not in {'.o','.obj','.d','.pyc'})
with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    for p in files: z.write(p, p.relative_to(root).as_posix())
    z.write(handoff, 'TYZS5_PROJECT_HANDOFF.md')
with zipfile.ZipFile(out) as z: assert z.testzip() is None
print(out)
print('SHA256:', hashlib.sha256(out.read_bytes()).hexdigest().upper())
