"""Stage only the two reviewed HEX/converter pairs, notices and relative checksums.

Never publishes, tags, connects to hardware or includes source/private backups.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[1]
NAME = 'TZLL-v1.1.0-alpha.1'
FILES = {
    'firmware/TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex': 'studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex',
    'firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex': 'studio/tyzs3-candidate/build/debug/kagel_tyzs3_ujcjk46o.hex',
    'zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js': 'zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js',
    'zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js': 'zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js',
    'NOTICE.md': 'NOTICE.md',
    'RELEASE_NOTES.md': 'RELEASE_NOTES.md',
}
VALIDATED_HEX = {
    'TYZS5': 'e46e3dc9efa07119d30d677c091dc3a217d3db577fcc6c6d473c35babfd82183',
    'TYZS3': 'a10da2b79daf8378f60893ed4b2fb68cc586d162b8d4ec86e9acef2fa31ba268',
}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT).decode().strip()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--verify', action='store_true', help='Verify existing staging and ZIP without overwriting')
    args = parser.parse_args()
    out = ROOT.parent / NAME
    archive = ROOT.parent / (NAME + '.zip')
    assert not git('status', '--porcelain'), 'Commit reviewed changes and finish build cleanup first'
    subprocess.run(['git', 'diff', '--exit-code', '3ba36fe', '--', 'firmware',
                    'zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js', 'NOTICE.md'], cwd=ROOT, check=True)
    payloads = {name: (ROOT / source).read_bytes() for name, source in FILES.items()}
    for target, expected in VALIDATED_HEX.items():
        name = next(name for name in FILES if name.startswith('firmware/' + target + '/'))
        assert digest(payloads[name]) == expected, 'Firmware differs from maintainer-validated hotfix: ' + target
    for name in FILES:
        if name.endswith('.js'):
            subprocess.run(['node', '--check', str(ROOT / FILES[name])], check=True)
    manifest = ''.join(digest(data) + '  ' + name + '\n' for name, data in sorted(payloads.items()))
    payloads['SHA256SUMS.txt'] = manifest.encode('ascii')
    if not args.verify:
        assert not out.exists() and not archive.exists(), 'Preserve existing output; use --verify instead'
        out.mkdir()
        for name, data in payloads.items():
            path = out / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
        with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as z:
            for name in sorted(payloads):
                z.write(out / name, NAME + '/' + name)
    assert {p.relative_to(out).as_posix() for p in out.rglob('*') if p.is_file()} == set(payloads)
    for name, data in payloads.items():
        assert (out / name).read_bytes() == data, name
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None
        assert set(z.namelist()) == {NAME + '/' + name for name in payloads}
        for name, data in payloads.items():
            assert z.read(NAME + '/' + name) == data, name
        for line in z.read(NAME + '/SHA256SUMS.txt').decode().splitlines():
            expected, name = line.split('  ', 1)
            assert digest(z.read(NAME + '/' + name)) == expected, name
    result = {
        'branch': git('branch', '--show-current'), 'release_commit': git('rev-parse', 'HEAD'),
        'worktree': 'clean', 'staging': str(out), 'archive': str(archive),
        'archive_sha256': digest(archive.read_bytes()), 'checksum_verification': 'ALL PASS (6 payloads)',
        'exact_archive_inventory': 'PASS (7 files; no source, backups, legacy/OTA/bootloader or ELF)',
        'payloads': {name: {'bytes': len(data), 'sha256': digest(data)} for name, data in payloads.items() if name != 'SHA256SUMS.txt'},
        'publication': 'not performed', 'hardware': 'not accessed',
    }
    if not args.verify:
        (ROOT.parent / (NAME + '-validation.json')).write_text(json.dumps(result, indent=2) + '\n', encoding='utf8')
        archive.with_suffix('.zip.sha256').write_text(result['archive_sha256'] + '  ' + archive.name + '\n', encoding='ascii')
    else:
        previous = json.loads((ROOT.parent / (NAME + '-validation.json')).read_text(encoding='utf8'))
        assert previous == result, 'Release provenance changed'
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
