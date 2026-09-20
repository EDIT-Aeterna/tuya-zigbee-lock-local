"""Prepare v1.2.0-alpha.1 from clean HEAD; no radio, Git mutation or publication."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
VERSION = 'v1.2.0-alpha.1'
BASELINE = '65417b2'
WORK = ROOT / 'artifacts/release-work' / VERSION
RELEASE = ROOT / 'artifacts/release' / VERSION
ARCHIVE = RELEASE.parent / ('TZLL-' + VERSION + '.zip')
FIRMWARE = {
    'TYZS5-CONTROL': '64048dc7c165a560569b956fc8e0f6ba3e7cc6aa83408089c8359b74d8d3115f',
    'TYZS5-MONITOR': '0997362f759760ffedb65107383d2e104b8904aeeff156bbe6e59a3b8fcca0c9',
    'TYZS3-CONTROL': '35b571584dbb1a1d16d0f2361b86f48e390cdeff0f7196ecc16b3895363e1b31',
    'TYZS3-MONITOR': '767dd797efbf8cef19874b6e521305f827457251e15deaa718b5b24c1ef26a14',
}
CONVERTERS = {
    'TYZS5-CONTROL': ('1.2.2', {
        'e35cc2dc0262a353ca17181eb633dd0ba5b355b4a17a268838295d388c8a6e91'}),
    'TYZS5-MONITOR': ('0.1.0', {
        'ac54219836e471583ae17da39619387a01c9a15c06b80b060e595c2f92243fa7'}),
    'TYZS3-CONTROL': ('0.1.0', {
        '46d34703c7b49cd497b4a2843530ea975686485b0ab668e96739decc6aa64779',
        '115a87e05bfa501325d6552ad8195ae7ca9578122fff74860d40678d71fb1dd9'}),
    'TYZS3-MONITOR': ('0.1.0', {
        'bacd472c32db60040cc89c9a5ec349f0dc854c1bb2a90e73735f66ec42d006f0'}),
}
DOCS = {
    'RELEASE_NOTES_' + VERSION + '_zh-en.md': 'RELEASE_NOTES_' + VERSION + '_zh-en.md',
    'NOTICE.md': 'NOTICE.md',
    'FLASHING.md': 'docs/FLASHING.md',
    'ACCESS_EDITIONS.md': 'docs/ACCESS_EDITIONS.md',
}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT, text=True).strip()


def clean():
    state = git('status', '--porcelain', '--untracked-files=all')
    if state:
        raise RuntimeError('Clean worktree required:\n' + state)


def command(name, args, expected=0):
    print('RUN:', name, flush=True)
    env = os.environ.copy()
    env['PYTHONUTF8'] = '1'
    with (WORK / (name + '.log')).open('w', encoding='utf8') as log:
        log.write('COMMAND: ' + repr(args) + '\n')
        log.flush()
        result = subprocess.run(args, cwd=ROOT, env=env, stdout=log, stderr=subprocess.STDOUT)
    if result.returncode != expected:
        raise RuntimeError(f'{name}: exit {result.returncode}; see {WORK / (name + ".log")}')


def converter_source(module, edition):
    return ROOT / 'zigbee2mqtt' / module / (
        'tuya_ty0a01_' + module.lower() + ('_monitor' if edition == 'MONITOR' else '') + '.js')


def verify_package(folder):
    lines = (folder / 'SHA256SUMS.txt').read_text(encoding='utf8').splitlines()
    names = []
    for line in lines:
        expected, name = line.split('  ', 1)
        assert len(expected) == 64 and expected == expected.lower()
        assert not Path(name).is_absolute() and '..' not in Path(name).parts
        assert digest(folder / name) == expected, name
        names.append(name)
    actual = sorted(p.relative_to(folder).as_posix() for p in folder.rglob('*') if p.is_file()
                    and p.name != 'SHA256SUMS.txt')
    assert names == sorted(set(names)) == actual
    hexes = sorted(p.relative_to(folder).as_posix() for p in folder.rglob('*.hex'))
    js = sorted(p.relative_to(folder).as_posix() for p in folder.rglob('*.js'))
    assert len(hexes) == len(js) == 4
    allowed = set()
    for key in FIRMWARE:
        module, edition = key.split('-')
        allowed.add(f'firmware/{module}/tzll_{module.lower()}_{edition.lower()}_{VERSION}.hex')
        version = CONVERTERS[key][0]
        allowed.add(f'zigbee2mqtt/{module}/tzll_{module.lower()}_{edition.lower()}_converter_v{version}.js')
    allowed.update('docs/' + name for name in DOCS)
    allowed.update(['RELEASE_MANIFEST.md', 'FINAL_AUDIT_REPORT.md'])
    assert set(actual) == allowed, 'Unexpected package content'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk', default=r'C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk')
    args = parser.parse_args()
    clean()
    if RELEASE.exists() or ARCHIVE.exists():
        raise RuntimeError('Completed output exists; move it aside before rebuilding (never overwritten).')
    commit = git('rev-parse', 'HEAD')
    branch = git('branch', '--show-current')
    WORK.mkdir(parents=True, exist_ok=True)
    frozen = ['firmware', 'studio/tyzs3-candidate', 'studio/tyzs5-telemetry',
              'zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js', 'zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js']
    command('unchanged-validated-inputs', ['git', 'diff', '--exit-code', BASELINE, '--', *frozen])
    for key, (_, accepted) in CONVERTERS.items():
        module, edition = key.split('-')
        assert digest(converter_source(module, edition)) in accepted, key + ': converter byte mismatch'
    assert git('rev-parse', 'HEAD:zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js') == '2b09583dd82ea92447e4b28eaec50744c8992ebf'

    # Original runner is intentionally nonzero for four frozen historical conflicts.
    command('host-suite', [sys.executable, 'tools/run_t3_host_tests.py', '--output',
                          (WORK / 'control').relative_to(ROOT).as_posix()], expected=1)
    old = json.loads((ROOT / 'artifacts/t3-4a/control/results.json').read_text())
    current = json.loads((WORK / 'control/results.json').read_text())
    assert current == old, 'Host results differ from validated T3-4A baseline'
    command('access-suite', [sys.executable, 'tools/test_access_editions.py', '--output',
                            (WORK / 'access-tests').relative_to(ROOT).as_posix()])
    command('monitor-converters', [sys.executable, 'tools/test_monitor_release.py'])
    for key in CONVERTERS:
        module, edition = key.split('-')
        command(key + '-syntax', ['node', '--check', str(converter_source(module, edition))])

    for key, expected in FIRMWARE.items():
        module, edition = key.split('-')
        command(key + '-generate-clean-build', [
            sys.executable, 'tools/build_access_variant.py', '--module', module,
            '--edition', edition.title(), '--sdk', args.sdk, '--output',
            (WORK / 'builds').relative_to(ROOT).as_posix()])
        metadata = json.loads((WORK / 'builds' / key / 'build.json').read_text())
        assert metadata['commit'] == commit
        actual = digest(ROOT / metadata['hex'])
        if actual != expected:
            raise RuntimeError(f'STOP: {key} rebuilt HEX differs from hardware-validated bytes: {actual} != {expected}')
        print(key, 'validated firmware SHA256 MATCH', actual, flush=True)
    command('four-build-audit', [sys.executable, 'tools/verify_access_editions.py',
                               '--output', WORK.relative_to(ROOT).as_posix()])
    evidence = json.loads((WORK / 'four-build-results.json').read_text())
    clean()
    assert git('rev-parse', 'HEAD') == commit
    RELEASE.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='tzll-release-', dir=RELEASE.parent) as temp:
        package = Path(temp)
        assets = []

        def copy_asset(src, name, purpose, module='N/A', edition='N/A', detail='Documentation; no hardware claim'):
            dest = package / name
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dest)
            assert src.read_bytes() == dest.read_bytes()
            assets.append({'filename': name, 'purpose': purpose, 'module': module, 'edition': edition,
                           'source': src.relative_to(ROOT).as_posix(), 'commit': commit,
                           'sha256': digest(dest), 'details': detail})

        for key in FIRMWARE:
            module, edition = key.split('-')
            ev = evidence[key]
            name = f'firmware/{module}/tzll_{module.lower()}_{edition.lower()}_{VERSION}.hex'
            detail = (f"Tuya / {ev['identity'].split(' / ')[1]}; binding {ev['product_binding']}; "
                      f"{ev['capability_profile']}; {edition}; DP204 {ev['diagnostic_version']}; "
                      "maintainer hardware PASS, rebuilt bytes MATCH")
            copy_asset(ROOT / ev['hex'], name, 'Application firmware', module, edition, detail)
            version = CONVERTERS[key][0]
            name = f'zigbee2mqtt/{module}/tzll_{module.lower()}_{edition.lower()}_converter_v{version}.js'
            detail = (f"{ev['identity']}; v{version}; "
                      + ('read-only' if edition == 'MONITOR' else 'Control')
                      + '; maintainer hardware PASS; validated bytes preserved')
            copy_asset(converter_source(module, edition), name, 'External converter', module, edition, detail)
        for name, source in DOCS.items():
            copy_asset(ROOT / source, 'docs/' + name, 'User documentation / provenance')

        manifest = [f'# TZLL {VERSION} release manifest', '',
                    f'Branch: {branch}', f'Source/build commit: {commit}', 'Worktree: clean before and after build.',
                    '', 'Every payload asset below is copied without rewriting bytes. Hardware statements are maintainer-reported.', '']
        for asset in assets:
            manifest += ['## ' + asset['filename'], '']
            manifest += [f'- {k}: {v}' for k, v in asset.items() if k != 'filename']
            manifest += ['']
        manifest += ['## Generated metadata', '',
                     f'RELEASE_MANIFEST.md, FINAL_AUDIT_REPORT.md and SHA256SUMS.txt are generated by tools/package_v1_2_release.py at {commit}.',
                     'They are documentation/evidence, module/edition N/A, not hardware assets.',
                     'SHA256SUMS covers all payload plus manifest/audit; excludes itself to avoid circular hashes.',
                     'The final ZIP hash is reported outside the ZIP.', '',
                     'TYZS3 Control normalized Git blob: 2b09583dd82ea92447e4b28eaec50744c8992ebf.',
                     'Accepted CRLF checkout SHA256: 46d34703c7b49cd497b4a2843530ea975686485b0ab668e96739decc6aa64779.',
                     'Prior LF release SHA256: 115a87e05bfa501325d6552ad8195ae7ca9578122fff74860d40678d71fb1dd9.',
                     'The actual packaged SHA256 is recorded above; CRLF is not claimed byte-identical to LF.', '']
        (package / 'RELEASE_MANIFEST.md').write_text('\n'.join(manifest), encoding='utf8', newline='\n')
        conflicts = {k: v for k, v in current.items() if any(v.values())}
        audit = [f'# TZLL {VERSION} final audit', '', '## Git baseline', '',
                 f'Branch: {branch}; final source/build commit: {commit}.',
                 f'Validated firmware baseline: {BASELINE}. Worktree clean before and after build.',
                 'Release-prep commits:', git('log', '--reverse', '--format=%h %s', BASELINE + '..HEAD'),
                 '', '## Release matrix and firmware identity', '',
                 '| Variant | Identity | Binding | Capability | Diagnostic version |',
                 '|---|---|---|---|---|']
        for key, ev in evidence.items():
            audit.append(f"| {key} | {ev['identity']} | {ev['product_binding']} | {ev['capability_profile']} | {ev['diagnostic_version']} |")
        audit += ['', 'Four matching converter assets: TYZS5 Control v1.2.2, TYZS3 Control v0.1.0, both Monitor v0.1.0.',
                  '', '## Write policy', '',
                  'TYZS5 Control exactly 21,24,25,26,27,28,48,49,54,55; TYZS3 Control exactly 21,54,55.',
                  'Both Monitor editions deny every DP 0..65535, exhaustively tested with both bindings.',
                  'Shared validation/PID gates preserved. Internal protocol traces match Control/Monitor.',
                  '', '## Firmware hashes', '', '| Variant | Final SHA256 | Hardware-validated SHA256 | Comparison |',
                  '|---|---|---|---|']
        for key, expected in FIRMWARE.items():
            audit.append(f"| {key} | {evidence[key]['sha256']} | {expected} | MATCH |")
        audit += ['', '## Converter hashes', '', '| Variant | Source and release SHA256 | Validated identity comparison |',
                  '|---|---|---|']
        for key, (_, accepted) in CONVERTERS.items():
            module, edition = key.split('-')
            value = digest(converter_source(module, edition))
            audit.append(f'| {key} | {value} | MATCH accepted validated bytes: ' + ', '.join(sorted(accepted)) + ' |')
        audit += ['', 'TYZS3 Control checkout CRLF and previous release LF have different SHA256 values but the same normalized Git blob 2b09583dd82ea92447e4b28eaec50744c8992ebf. The table records the bytes actually copied.',
                  'Both Monitor canonical files and release copies exactly match the two supplied validated hashes. Existing Control files have no Git content changes.',
                  '', '## Converter safety', '',
                  'PASS: Monitor toZigbee writers absent, all exposes STATE-only, no generic/raw/control setters.',
                  'PASS: all four exact fingerprints mutually exclusive; Control never matches Monitor.',
                  '', '## Tests', '',
                  'PASS: common-core/platform/binding tests, four access-mode builds, 16-bit exhaustive Monitor denial, preserved internal traffic.',
                  'PASS: current UTC+8, EF00 atomic, Stage2F-R, Stage2G credential/legacy gate and host_selftest.',
                  'PASS: Control bitmap/reference/TYZS3 tests, unchanged reviewer Monitor tests, passive decoder supplement and four JS syntax checks.',
                  'PASS: battery, local events/credential IDs, DP58/59/60/93 one-based bitmaps and 00 00 sentinel, alarm vectors, TYZS5 DP8 diagnostic wording.',
                  'Fixtures: 35 passed / 0 failed / 0 awaiting hardware.',
                  'PASS: four Generate + Clean Builds; HEX checksums/identity/config/ELF access-policy/NVM3 audit.',
                  f'Complete logs and ELF evidence: artifacts/release-work/{VERSION}/ (local, intentionally not public assets).',
                  '', '## Historical test conflicts', '',
                  'Host aggregate exits 1, exactly as the validated baseline; not an all-tests-green claim.',
                  'All compile results are zero. Four obsolete expectations are unchanged:',
                  'Stage2D DP21-only, Stage2E-A DP49 prohibition, Stage2E-B old DP49 method, Stage2F pre-2F-R DP39/DP26 policy.',
                  '```json', json.dumps(conflicts, indent=2), '```',
                  'No reviewer assertions were rewritten. Any additional/changed outcome fails packaging.',
                  'The four-build source freeze was scoped to firmware/Studio and existing Control definitions at 65417b2; README/new Monitor files are intentionally allowed for this release. All binary checks are retained.',
                  '', '## OTA', '',
                  'Disabled in all four. bootloader_writeStorage, bootloader_eraseStorageSlot, bootloader_setImageToBootload and bootloader_rebootAndInstall absent from final ELFs.',
                  'NVM3 linker bounds remain 0x77000..0x80000 exclusive end. No stock layout/bootloader uncertainty is resolved.',
                  '', '## Package hygiene', '',
                  'Exact allowlist: four HEX, four JS, four user/provenance documents, manifest, audit and checksums.',
                  'No stock backups, raw captures/secrets, OTA/bootloader images, raw test senders, old candidates, legacy converters, IDE files or private notes.',
                  'All payload bytes equal their source. SHA256SUMS recomputed; ZIP freshly extracted and rechecked before success.',
                  '', '## Hardware validation statement', '',
                  'Reported by the maintainer in the supplied release taskbook:',
                  'TYZS5 Control PASS; TYZS3 Control PASS; TYZS5 Monitor + Monitor converter PASS; TYZS3 Monitor + Monitor converter PASS.',
                  'Codex did not perform hardware testing. Final firmware/Monitor converter bytes match the hardware-validated candidates.',
                  '', '## Remaining limitations', '',
                  'Alpha, tested samples only; MCU-dependent features; TYZS3 limited Control/EM1; dynamic password/SecKey unsupported; DP8 diagnostic only; OTA disabled; edition switching may require re-pair/re-interview.',
                  'Upstream attribution preserved; no blanket license added. No Git tag/push/GitHub publication or hardware flashing occurred.',
                  '', '## Stop condition', '',
                  'Ready for maintainer review and manual GitHub v1.2.0-alpha.1 publication.', '']
        (package / 'FINAL_AUDIT_REPORT.md').write_text('\n'.join(audit), encoding='utf8', newline='\n')
        files = sorted((p for p in package.rglob('*') if p.is_file()),
                       key=lambda p: p.relative_to(package).as_posix())
        checks = ''.join(digest(p) + '  ' + p.relative_to(package).as_posix() + '\n' for p in files)
        (package / 'SHA256SUMS.txt').write_text(checks, encoding='utf8', newline='\n')
        verify_package(package)
        # Deterministic ZIP metadata; use only allowlisted public files.
        with zipfile.ZipFile(ARCHIVE, 'x', compression=zipfile.ZIP_DEFLATED) as z:
            for path in sorted(p for p in package.rglob('*') if p.is_file()):
                info = zipfile.ZipInfo(path.relative_to(package).as_posix(), (2026, 9, 20, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                z.writestr(info, path.read_bytes())
        with tempfile.TemporaryDirectory(prefix='tzll-release-verify-') as extracted:
            with zipfile.ZipFile(ARCHIVE) as z:
                assert z.testzip() is None
                z.extractall(extracted)
            verify_package(Path(extracted))
        shutil.copytree(package, RELEASE)
    clean()
    print('RELEASE AUDIT: PASS (four known historical conflicts unchanged)', flush=True)
    print('COMMIT:', commit)
    print('ZIP:', ARCHIVE)
    print('ZIP SHA256:', digest(ARCHIVE))
    print('Ready for maintainer review and manual GitHub v1.2.0-alpha.1 publication.')


if __name__ == '__main__':
    main()
