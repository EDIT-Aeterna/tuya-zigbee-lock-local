# Phase T3-1: common residential-lock core

Latest delta: `TYZS3_PID_GATE_HOTFIX_REPORT.md` accepts measured pure JSON and JSON plus an optional 0/1 OTA byte without weakening the PID gate. It supplies the current HEX hashes; earlier build hashes in this document and the static-gate report are historical.

The static-gate delta in `T3_1_STATIC_GATE_FIX_REPORT.md` supersedes the original first-candidate details below: runtime identity is target-specific, TYZS3 requires verified PID before writes, one deferred product-info retry is implemented, TYZS3 is EM1-only and reports version T3-1. The original HEX hashes below are historical and must not be used for first flash; current hashes are in `artifacts/t3-1/build-results.json`.

Baseline: `866a7ad` (`v1.0.0-alpha.2`), converter Stable v1.2.2. The supplied taskbook identifies this as the validated TYZS5 baseline, including maintainer converter validation; this phase performs no hardware testing. Branch: `feature/tyzs3-common-core`. Existing release tags and main remain unchanged. The two untracked alpha.1 ZIPs were preserved outside the repository in `../pre-t3-release-archives/` before work began.

## Layout and ownership

```text
firmware/common/
  lock_app.c/h              application, atomic EF00 dispatch, product-info safety
  nicki_ek_lock_serial.c/h   framing, protocol helpers, exact DP report parsing
  kagel_control_gate.c/h    shared DP-specific validators
  lock_profile.c/h          PID capabilities, writable policy, timezone, quirks
firmware/TYZS5/
  efr32_app.c               hardened MG13 radio/UART adapter
  kagel_profile.h           module build safety and identity
  target_tyzs5_adapter.h    EF00 encoding / RX timeout adapter
  host_selftest.c           portable protocol regression entry point
firmware/TYZS3/
  efr32_app.c               thin reuse of the hardened adapter (no upstream logic)
studio/tyzs5-telemetry/     existing supported target build
studio/tyzs3-candidate/     experimental target build; Tuya / TY0A01-TYZS3
```

The eight portable files were moved using `git mv`. TYZS3's small adapter includes the hardened TYZS5 EFR32 adapter because measured MCU family and upstream pin/build evidence agree: EFR32MG13P732F512GM48, USART0 TX PA0/RX PA1 route location 0, 115200 8N1. Existing RX-edge wake/sleep behavior is reused, not invented. Upstream `firmware/efr32_app.c` was inspected only for this hardware reference; no upstream OTA, FC00, sequence/time workarounds or broad control policy were imported. Radio/SDK integration and build configurations derive from the hardened current target.

Module build identity (`KAGEL_PROFILE`) is distinct from lock-MCU policy (`lock_profile_t`). First candidate explicitly defines `LOCK_PROFILE_UJCJK46O=1` and requires hardened module mode. Both builds retain `KAGEL_TELEMETRY_ONLY=1` plus the reviewed narrow-control exception. The production converter is unchanged and does not match TYZS3.

## Profile policy

| Policy | srptwvak | ujcjk46o |
|---|---|---|
| Writable DP | 21,24,25,26,27,28,48,49,54,55 | 21,54,55 |
| Timezone | +28800 seconds | +28800 seconds |
| Verified PID required before lock writes | No; observed mismatch still blocks | Yes |
| DP54 malformed initial report | Disabled | Narrow stage-0 quirk |
| Credential control types | 1 password / 2 card / 3 fingerprint | Same plus observed type 4 face |
| Temp password / freeze / unfreeze | Existing zero-schedule behavior preserved | Disabled |
| DP48/49 | Existing safe provisioning/control behavior preserved | Disabled pending target-specific key lifecycle validation |
| DP39,68,69,70,200,205 and FC00 production control | Disabled | Disabled |
| OTA write/install | Disabled | Disabled |

Capabilities are per lock profile, not promises for every module or lock. Alarm and module work-mode observations remain optional. DP202 is not a lock-MCU write allowed by the shared gate; the inherited adapter's existing module-local work-mode handling is unchanged. This does not imply the stock lock supports DP202.

## Protocol corrections

- DP24/26 extended parser/builder represents reference6 + start4 + end4 + named schedule6 + one_time1 + password6 (27 bytes). Weekly fixture: type 2, weekdays 0x1F, 00:00–23:00. Existing srptwvak builder still emits zero schedule bytes, and its validators still reject nonzero schedule controls. The 21-byte `tls_parse_temp_password_create` API remains a separately documented legacy/public schema.
- DP49 helper now reads the measured 13-byte layout with a 16-bit method. The old host test's 15-byte synthetic expectation was corrected to match this evidence; production DP49 writer/validator was already 13-byte and is unchanged.
- Cmd07 permits six ASCII admin digits plus one/two trailing NUL bytes in a 7/8-byte group. Embedded NUL/non-digit padding fails. Valid requests still return 0x02 (SecKey unavailable); malformed requests return 0x03. No SecKey algorithm is implemented.
- Exact parsing stays the default. The quirk fallback requires Cmd05, outer length 13, DP54 RAW, declared length 7, exactly nine actual bytes, stage 0, output capacity >=1 and the explicit profile flag. It exposes one 9-byte DP without rewriting the buffer. Other malformed/trailing reports fail; timestamped Cmd23 never takes this fallback.

## Product information and fail-closed behavior

The application stores bounded PID/version strings and the observed OTA flag without allocation. A strict bounded flat string-JSON parser rejects malformed/duplicate identity keys without crashing. Unknown string fields are tolerated; unsupported JSON value shapes fail closed for writes. A mismatch or invalid product-info response latches the write block until reboot and cancels queued UART control, even if a later matching reply arrives. Missing product info alone does not prevent boot/telemetry or the existing expected-profile policy. Read reports continue. An observed OTA flag cannot enable OTA. Neither EF00 nor the retained legacy app entry point can bypass the shared DP-specific validation.

## Verification

See `artifacts/t3-1/build-results.json` for exact hashes, HEX sizes, image ranges, ELF sizes and identities; full Generate/Clean/Build logs accompany it. Both candidate HEX hashes are expected to differ from alpha.2 due to profile/product-info code and shared source changes, not just source paths. Neither is represented as hardware-validated firmware.

`tools/run_t3_host_tests.py` compiles every repository C host test with `-std=c99 -Wall -Wextra -Werror`, including both profiles, then fixtures and bitmap regressions. UTC+8, Stage 2B adapter, Stage 2D atomic EF00, Stage 2F-R, Stage 2G, host selftest, both new profile tests, fixtures and bitmap tests pass. Four historic stage tests fail identically on untouched `866a7ad`: Stage 2D-only allowlist, Stage 2E-A DP49-disabled expectation, Stage 2E-B's old method mutation, and Stage 2F's DP39/old DP26 expectations. `tools/compare_t3_baseline_tests.py` records this baseline comparison. Reviewer tests were not rewritten. The aggregate runner intentionally returns nonzero for these known conflicts, so this is not claimed as an unqualified all-tests-green result.

The reviewer-supplied Stage 2G legacy-entry validator-bypass test was also retained and passed. Both builds retain inherited ZAP HA-doorlock compliance warnings (missing standard Door Lock/Groups/Identify/Scenes clusters): this EF00-based candidate is not claimed to be Zigbee-certified. These warnings do not stop generation or compilation and are not silently resolved by adding clusters in this phase. Build-log trailing spaces and newly copied generated-file whitespace were normalized for `git diff --check`; no binary was changed by this formatting.

| Artifact | HEX file bytes | Programmed data bytes | SHA-256 |
|---|---:|---:|---|
| TYZS5 | 468568 | 166572 | `0d91e775ecdc2c068c87f1a40146efd76e3404944c1678c0b5a44ce92102de13` |
| TYZS3 candidate | 468576 | 166576 | `57e611a3ccf8bd571e7aa1615f13f6138366baf4a6bce3b1237ca5a175e2067e` |

The first-flash procedure and rollback gates are in `TYZS3_FIRST_FLASH_PLAN.md`. No verified stock TYZS3 backup is bundled. Do not flash before the maintainer checks stock layout compatibility and approves the candidate.

New regression vectors contain synthetic credentials only. Production bitmap tests remain unchanged. No hardware connection, flashing, main merge or release publication is part of T3-1.

Status: Ready for maintainer TYZS5 regression test and stock-layout review; TYZS3 flash not yet approved.
