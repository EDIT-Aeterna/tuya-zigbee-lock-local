# TZLL v1.1.0-alpha.1 validation and release handoff

Repository: `D:\project\tyzs5-lock-port\Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware`.
Branch: `feature/tyzs3-common-core`. Starting HEAD: `3ba36fe`, clean.
The exact final release HEAD and clean worktree status are recorded by `tools/prepare_t3_2_release.py` in `../TZLL-v1.1.0-alpha.1-validation.json`. No tag, remote push, GitHub Release/default-branch/visibility change or hardware access is performed in T3-2.

## Scope and actual repository differences

- Firmware source, profiles, DP layouts, UART, Zigbee transport, PID gate, EM1 policy and OTA behavior remain byte-for-byte unchanged from the maintainer-validated hotfix baseline. TYZS5 converter Stable v1.2.2 and NOTICE are unchanged.
- TYZS3 converter moves from `_candidate.js` to `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js`, version v0.1.0, initial validated integration. The old canonical duplicate is removed. All structured writers are preserved.
- The repository did not implement the taskbook's `00 00` empty-list behavior: it rejected shard zero. The only executable converter delta adds the exact two-byte empty sentinel; no other shard-zero payload is accepted. Both stale-list clearing and malformed inputs are tested. This adjustment is offline-tested, not claimed as new Codex hardware validation.
- Internal Studio path remains `studio/tyzs3-candidate` to avoid changing working build settings. Public artifact filenames no longer contain candidate. No firmware version change was needed; module diagnostics remain T3-1 / 1.0.2.
- The existing flashing page still recommended a removed one-click flasher and contained stale chip-erase language. It now documents module-specific selection, exact-device backup, reviewed page programming and rollback.
- The unchanged TYZS5 converter exposes optional DP202 while the validated firmware allowlist excludes it. Documentation now distinguishes the UI exposure from supported end-to-end firmware controls; neither implementation was changed.

## Automated / static validation

`python tools/run_t3_host_tests.py` uses GCC C99 with `-Wall -Wextra -Werror` and preserves every reviewer assertion.

| Check | Result |
|---|---|
| T3 common-core srptwvak and ujcjk46o | ALL PASS |
| Product info pure JSON / JSON+00 / JSON+01 / bad trailer | PASS |
| PID match/mismatch, missing/malformed/empty reply, sticky gate, deferred retry | PASS |
| ujcjk46o narrow DP54 stage-0 quirk; strict parsing elsewhere | PASS |
| DP49 13-byte parser, 27-byte extended schedule, DP54/55 structures | PASS |
| Stage 1.1 UTC+8, Stage 2B adapter, Stage 2D atomic EF00 | PASS |
| Stage 2F-R and Stage 2G EF00/legacy control gate | PASS |
| host_selftest | PASS |
| fixtures | 35 passed / 0 failed / 0 awaiting hardware |
| TYZS5 production bitmap/captured vectors and write invariance | PASS |
| TYZS3 canonical converter: fingerprint, vectors, empty sentinel, same writers | ALL PASS |
| node --check on both canonical converters | PASS |
| Both original Generate + Clean + Build paths | PASS |
| HEX identities, checksum syntax/ranges, required/forbidden ELF symbols | PASS |
| HEX equality to hardware-validated hotfix baseline | PASS for both modules |

The aggregate runner exits 1 because four obsolete earlier-stage tests still conflict with the present reviewed policy. Their results match `artifacts/t3-1/host/baseline-conflicts.json`:

| Historical reviewer | Current conflict | Result |
|---|---|---|
| stage2dr_control_gate_test | Requires only DP21 | assertion abort, 3221226505 |
| stage2ea_ef00_integration_test | Requires DP49 forbidden | 1 failure, exit 1 |
| stage2eb_ef00_integration_test | Rejects the later-reviewed DP49 method | 1 failure, exit 1 |
| stage2f_ef00_integration_test | Old DP39 permission / DP26 layout | 2 failures, exit 1 |

They are neither removed nor rewritten for a cosmetic all-green result. No new failures. Individual logs and results remain under `artifacts/t3-1/host/`; preparation build logs are under `artifacts/t3-2/`. Final-commit rebuild logs are outside the minimal release payload in `../TZLL-v1.1.0-alpha.1-build-evidence/` and identify the exact release commit. Generation's whitespace/blank-line and comment-only Studio metadata churn is restored after checking it contains no code/configuration delta.

`tools/verify_t3_builds.py` checks that each HEX contains its own Tuya/model identity and no opposite model, that OTA write/erase/install symbols are absent, and that TYZS3 EM2 remains disabled. Existing SDK HA-doorlock compliance warnings remain; this is not certification. Read-only SDK bootloader-interface initialization is distinct from prohibited OTA write/install operations. No new bootloader layout claim is made.

## Firmware release assets

| Module | Release HEX (relative to staging) | File bytes | SHA256 |
|---|---|---:|---|
| TYZS5 | firmware/TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex | 469018 | e46e3dc9efa07119d30d677c091dc3a217d3db577fcc6c6d473c35babfd82183 |
| TYZS3 | firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex | 467758 | a10da2b79daf8378f60893ed4b2fb68cc586d162b8d4ec86e9acef2fa31ba268 |

TYZS5 source output: `studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex`; Basic identity Tuya / TY0A01-TYZS5; module version 1.0.2; tested binding srptwvak; converter Stable v1.2.2. TYZS3 source output: `studio/tyzs3-candidate/build/debug/kagel_tyzs3_ujcjk46o.hex`; Basic identity Tuya / TY0A01-TYZS3; module version T3-1; expected product binding ujcjk46o / MCU 1.0.0; writable DPs exactly 21/54/55 after PID verification; EM2 disabled; OTA disabled.

The release build reproduces the hardware-validated firmware bytes. Flash data spans 0..0x28B4B (TYZS5) and 0..0x2898B (TYZS3). NVM3 remains linked at 0x77000..0x7FFFF; these are candidate layout facts, not proof of compatibility with unknown stock layouts.

## Converters

| Module | Repository / staged path | Version | SHA256 | Syntax |
|---|---|---|---|---|
| TYZS5 | zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js | Stable v1.2.2 | e35cc2dc0262a353ca17181eb633dd0ba5b355b4a17a268838295d388c8a6e91 | PASS |
| TYZS3 | zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js | v0.1.0 | 115a87e05bfa501325d6552ad8195ae7ca9578122fff74860d40678d71fb1dd9 | PASS |

Each matches only manufacturer Tuya / model TY0A01 plus its module suffix. TYZS3 has exactly two registered structured writers covering DP21/54/55, with no generic/raw writer or OTA. Dispatch diagnostics are not execution acknowledgements. The exact canonical `.js` files are delivered inside the ZIP, not as loose attachments.

## Prior maintainer hardware validation

Source: the supplied T3-2 taskbook, which records prior maintainer tests. Codex performed no hardware tests.

- TYZS5 common-core regression: PASS.
- TYZS3 first boot, pair/rejoin, Basic identity: PASS.
- TYZS3 product-info ujcjk46o / MCU 1.0.0, PID verification and UTC/local time: PASS.
- TYZS3 fingerprint/password/card/face actions, battery, DP58/59/60/93 lists: PASS.
- TYZS3 DP21, DP54, DP55 and narrow malformed initial DP54 report handling: PASS.

Only the tested product binding is covered. No unprovided brand/model or new hardware outcomes are invented. Final canonical-converter smoke testing is a maintainer option, particularly empty-list display after a fresh sync.

## Release staging and checksums

Output: `D:\project\tyzs5-lock-port\TZLL-v1.1.0-alpha.1` and the sibling `.zip`.

```text
TZLL-v1.1.0-alpha.1/
  firmware/
    TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex
    TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex
  zigbee2mqtt/
    TYZS5/tuya_ty0a01_tyzs5.js
    TYZS3/tuya_ty0a01_tyzs3.js
  NOTICE.md
  RELEASE_NOTES.md
  SHA256SUMS.txt
```

`python tools/prepare_t3_2_release.py` requires a clean committed tree, refuses overwrite, checks validated firmware hashes and source preservation, stages exactly these seven files, verifies all six relative payload checksums and all ZIP bytes against source. `--verify` rechecks existing output and commit provenance. No legacy converters, ELF/OUT, OTA/bootloader, IDE files, stock backup, USERDATA, raw capture or private credential material is included. Source archives remain GitHub-provided. NOTICE and upstream attribution are preserved without a new blanket license.

## Documentation inventory

- Updated: README.md, README.zh-CN.md, CHANGELOG.md, RELEASE_NOTES.md.
- Added: docs/TYZS3_KNOWN_GOOD_BASELINE.md, docs/lock-profiles/ujcjk46o.md, docs/tyzs3-guide.md, docs/tyzs3-guide.zh-CN.md, this validation/handoff report.
- Updated: docs/supported-locks.md, docs/FLASHING.md, docs/zigbee2mqtt-guide.md, docs/ROADMAP.md.
- Historical status clarified: docs/TYZS3_FIRST_FLASH_PLAN.md, docs/TYZS3_PID_GATE_HOTFIX_REPORT.md.
- Added module selector: zigbee2mqtt/README.md. Updated TYZS3/README.md and TYZS5/legacy/README.md.

## Limits and remaining human actions

TYZS3 does not expose periodic/one-time temporary passwords, freeze/unfreeze, DP48/49 or the other forbidden controls listed in the profile. Proprietary dynamic-password validation is unsupported after flashing. Alarm/sensors/modes depend on the lock MCU. EM1 remains conservative; no OTA, Tuya Cloud/App, universal compatibility or mature battery-life claim. Unknown stock layouts require exact-device backup/review.

Review the local commits/diff and staging; optionally smoke-test the final canonical converter. Local changes are committed; remote push/merge, tag creation and GitHub prerelease creation/upload remain maintainer actions after review. Version rationale: v1.0.x covers initial TYZS5 support; v1.1.x introduces initial TYZS3 support.

Status: Ready for maintainer final release review and publication of TZLL v1.1.0-alpha.1. Not automatically published.
