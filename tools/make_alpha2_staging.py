from hashlib import sha256
from pathlib import Path
import shutil

root = Path(__file__).resolve().parents[1]
out = root / "release" / "TZLL-v1.0.0-alpha.2"
if out.exists():
    raise SystemExit('Staging already exists; inspect it before rebuilding')
files = [
    (root / "studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex", Path("firmware/kagel_tyzs5_srptwvak_clean.hex")),
    (root / "zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js", Path("zigbee2mqtt/tuya_ty0a01_tyzs5.js")),
    (root / "RELEASE_NOTES.md", Path("RELEASE_NOTES.md")),
    (root / "NOTICE.md", Path("NOTICE.md")),
]
lines = []
for source, relative in files:
    target = out / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, target)
    lines.append(f"{sha256(target.read_bytes()).hexdigest()}  {relative.as_posix()}")
(out / "SHA256SUMS.txt").write_text("\n".join(lines) + "\n", encoding="utf-8")
