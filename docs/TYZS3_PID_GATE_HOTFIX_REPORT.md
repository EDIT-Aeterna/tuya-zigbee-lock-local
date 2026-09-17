# TYZS3 product-info PID gate hotfix

Baseline: `639ac0d`, branch `feature/tyzs3-common-core`. Scope: the supplied `TZLL_TYZS3_PID_GATE_HOTFIX_BUNDLE.zip`. No hardware access, flashing, converter changes, new writable DP or publication was performed.

## Root cause and change

The supplied TYZS3 capture reports pure JSON `{"p":"ujcjk46o","v":"1.0.0"}`. The former shared serial dispatcher unconditionally removed the final byte, losing `}` and causing the strict product-info parser to latch PID mismatch. This blocked controls before UART transmission.

`firmware/common/nicki_ek_lock_serial.c` now defaults to the full payload and observed OTA=false. It removes exactly one byte only if length >=2, the penultimate byte is `}`, and the last byte is 0x00 or 0x01. It sets observed OTA=true only for 0x01. This implements the supplied patch's parser rule; comments are shortened. Existing strict JSON parsing, PID comparison, sticky rejection and retry behavior are unchanged. An observed capability flag does not enable OTA.

`tests/t3_common_core_test.c` covers pure JSON, JSON+0x00 and JSON+0x01 on both profiles, preserving existing malformed/wrong/missing/empty-PID tests. Additional checks prove that matching pure JSON permits a DP21 UART wake/pending send and an invalid 0x02 trailer blocks it.

## Verification

- `python tools/run_t3_host_tests.py`: both T3 profiles ALL PASS under GCC C99, -Wall -Wextra -Werror. Stage 1.1 UTC+8, Stage 2B adapter, Stage 2D atomic EF00, Stage 2F-R, Stage 2G EF00 and legacy gate, host selftest, bitmap tests and TYZS3 candidate converter all PASS. Fixtures: 35 passed / 0 failed / 0 awaiting hardware.
- The aggregate runner returns 1 because four historical tests retain incompatible earlier-stage policies: Stage 2D control gate, Stage 2E-A EF00, Stage 2E-B EF00 and Stage 2F EF00. Their compile/run exit codes match the previously recorded `artifacts/t3-1/host/baseline-conflicts.json`. They were not rewritten or suppressed; no new failures occurred.
- `tools/build_stage2br.ps1` and `tools/build_tyzs3.ps1`: Generate + Clean + Build PASS using the original SDK/toolchain. Logs: `artifacts/t3-1/tyzs5-build.log` and `tyzs3-build.log`. Existing generated HA-doorlock compliance warnings remain; this is not certification.
- `python tools/verify_t3_builds.py`: PASS. Each HEX contains its expected Tuya/model identity and no opposite model. TYZS3 remains ujcjk46o, version T3-1, EM2 disabled, verified-PID writes only DP21/54/55. TYZS5 remains srptwvak/version 1.0.2 with unchanged policy. No OTA write/erase/install symbols. Linked NVM boundaries remain unchanged and are not proof of stock-layout compatibility.
- Regenerated whitespace/blank-line differences and Studio comment metadata were removed after confirming no generated code/build-option change. Only the product-info dispatcher changes firmware behavior.

## Current HEX files

These hashes supersede the previous static-gate images. Copies in the delivery package and the external hex directory are byte-identical to the Studio build outputs.

TYZS3: `studio/tyzs3-candidate/build/debug/kagel_tyzs3_ujcjk46o.hex`

- External copy: `D:\project\tyzs5-lock-port\hex\TYZS3-T3-1-PID-HOTFIX.hex`
- File size: 467758 bytes.
- SHA256: `a10da2b79daf8378f60893ed4b2fb68cc586d162b8d4ec86e9acef2fa31ba268`

TYZS5: `studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex`

- External copy: `D:\project\tyzs5-lock-port\hex\TYZS5-T3-1-PID-HOTFIX-REGRESSION.hex`
- File size: 469018 bytes.
- SHA256: `e46e3dc9efa07119d30d677c091dc3a217d3db577fcc6c6d473c35babfd82183`

## Maintainer validation

Use the TYZS3 hotfix image for ujcjk46o only; do not interchange module images. After flashing and cold boot, capture Cmd01 and confirm pure JSON is accepted, then test DP21, DP54 and DP55 sequentially. Expected path: Z2M dispatch -> Zigbee EF00 -> verified PID -> UART wake -> Cmd04. Existing backup/layout/rollback requirements remain in `TYZS3_FIRST_FLASH_PLAN.md`. No chip erase or standalone bootloader write is part of this task.

Status: Ready for maintainer TYZS3 hotfix flash. Hardware validation remains with the maintainer.
