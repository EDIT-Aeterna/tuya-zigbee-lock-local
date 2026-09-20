# Main-branch note

> Detailed generated build/debug evidence referenced below is preserved in the v1.2.0-alpha.1 tag/release-prep history and is intentionally not duplicated on main.

# T3-4A access policy — four-image candidate handoff

## Baseline and scope

Repository: `D:\project\tyzs5-lock-port\Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware`.
Started on clean branch `refactor/t3-3-platform-cleanup`, HEAD `559a3d9557f370effe24efbf00161ccbf96f38e3`. The supplied T3-4A taskbook reports that maintainer T3-3 hardware regression passed for both targets. Codex did not perform that hardware testing.

Dedicated branch: `feature/t3-4-access-editions`. No public release, tag, remote push, converter change, README release advertising or hardware access. Prior T3-3/release images are preserved. The current scope is firmware architecture and four candidate builds only.

## Commits

| Commit | Change |
|---|---|
| d834cc5 | Freeze T3-3 control characterization and all current test results before policy changes |
| a91ab86 | Compile-time Control/Monitor gate and edition-aware runtime identity |
| 4b49ff8 | Parameterized shared-source four-build tooling and exhaustive host tests |
| 81959e9 | Four-image ELF/config/identity verification and edition documentation |

The final evidence commit records the four outputs, checks, logs and this report. Use `git log --oneline 559a3d9..HEAD` for the complete final sequence. Build metadata records source commit 4b49ff8; subsequent commits change tests/docs/evidence only, not firmware/build inputs.

## Architecture and policy ownership

| Concept | Owner | Responsibility |
|---|---|---|
| Module Target | firmware/TYZS3, firmware/TYZS5, original Studio inputs | Radio adapter, pins, power, diagnostic base version, module identity |
| Product Binding | firmware/common/lock_product_binding.c/h | Expected PID/tested MCU metadata, PID gate, quirks, capability reference |
| Capability Profile | firmware/common/lock_capability_profile.c/h | Single authoritative product DP allowlist and feature metadata |
| Access Edition | firmware/common/tzll_access_policy.c/h | Compile-time mode and effective external DP permission |
| Runtime Product Observation | lock_product_observation_t | Existing observed PID/MCU/OTA metadata and verification path |

The access gate permits only `mode == CONTROL && binding != NULL && capability explicit allowlist contains dp`. Monitor grants nothing, including unknown IDs. It is not a blacklist and does not create product-specific monitor profiles. There is no runtime setter, DP, NVM setting or hidden switch; edition changes require reflashing. Invalid compile-time selectors are rejected. Default unspecified mode is Control for existing build compatibility; all matrix builds explicitly set it.

The gate is reached through the existing audited `kagel_control_dp_allowed()` external EF00/legacy validation path. The external temporary-password helper also delegates to access policy, covering the legacy CREATE_TEMP_PW path. No generic serial send function was changed. Atomic parsing, RAW/datatype and DP-specific validation, PID verification and pending-send cancellation remain in force.

## Exact matrix

| Module / Edition | Binding / capability | Effective external writes | Basic identity | DP204 version |
|---|---|---|---|---|
| TYZS5 Control | srptwvak / EXTENDED_V1 | 21,24,25,26,27,28,48,49,54,55 | Tuya / TY0A01-TYZS5 | 1.0.2 |
| TYZS5 Monitor | srptwvak / EXTENDED_V1 | empty | Tuya / TY0A01-TYZS5-MON | 1.0.2-MON |
| TYZS3 Control | ujcjk46o / CORE_V1 | 21,54,55 | Tuya / TY0A01-TYZS3 | T3-1 |
| TYZS3 Monitor | ujcjk46o / CORE_V1 | empty | Tuya / TY0A01-TYZS3-MON | T3-1-MON |

TYZS3 Control still requires verified expected PID; both Monitor builds reject writes regardless of PID state. Quirks remain on bindings (ujcjk46o owns the narrow DP54 stage-0 declared-7/actual-9 quirk). Timezone stays UTC+8. MCU versions remain observations/evidence, not new authorization conditions.

Control model names are actually 12 characters and Monitor names 16; historical prose counting Control as 11 was incorrect, but runtime code already computed the prefix with sizeof. Generated Basic attributes have 33 bytes, sufficient for both. The runtime writer remains edition-aware and length-prefixed. DP204 uses the existing bounded string payload (sizeof minus NUL); Monitor versions are 9/8 bytes. No new diagnostic protocol or Control-version change.

## Automated results

| Gate | Result |
|---|---|
| Exhaustive access API 0..65535, both bindings in Monitor | All denied, PASS |
| Exhaustive Control allowlists 0..65535, both bindings | Exact baseline sets, PASS |
| EF00 and legacy external entry, DP21/54/55 and all 8-bit IDs | Monitor no UART control/wake side effect or pending application command, PASS |
| External temp-password helper and legacy CREATE_TEMP_PW | Monitor denied without UART side effect, PASS |
| Unverified/matching/wrong/missing/malformed/sticky PID states | Expected Control semantics; Monitor remains denied, PASS |
| Product Info pure JSON / JSON+00 / JSON+01, observation and one deferred retry | PASS |
| Time response UTC/local, report ACK, network notification, local telemetry/lists | Preserved in both editions, including Monitor mismatched-PID state, PASS |
| DP54 quirk, DP49 13-byte parser, 27-byte extended schedule | PASS |
| Current Stage 1.1 UTC+8, Stage 2B adapter, Stage 2D atomic EF00, Stage 2F-R, Stage 2G EF00/legacy, host_selftest | PASS |
| Bitmap one-based shards / DP93 and both unchanged converter tests | PASS |
| Fixtures | 35 passed / 0 failed / 0 awaiting hardware |
| Four SLC + ZAP Generate / Clean / Build flows | PASS |
| Four HEX/config/ELF runtime identity + access checks | ALL PASS |

Control public UART/report characterization exactly matches T3-3:

| Binding | Before / Control after |
|---|---|
| srptwvak | 4a39cb8b / 4a39cb8b |
| ujcjk46o | 27085207 / 27085207 |

Separate protocol-only traces are identical between editions:

| Binding | Control / Monitor |
|---|---|
| srptwvak | 5ebdfa03 / 5ebdfa03 |
| ujcjk46o | bd64382a / bd64382a |

These are host characterization/test evidence, not a claim that new binaries have passed hardware validation. The test source verifies complete absence of external UART side effects in Monitor while confirming that required internal traffic still transmits.

Four pre-existing historical reviewer conflicts remain exactly as before: Stage 2D only-DP21 assertion (exit 3221226505), Stage 2E-A DP49-forbidden rule (exit 1), Stage 2E-B old DP49-method expectation (exit 1), Stage 2F old DP39 permission/DP26 layout (exit 1). Therefore the full legacy aggregate runner returns 1. No historical assertion was changed or suppressed, and no new failures remain. The four-edition access suite and final audit pass; this is not a claim that the historical aggregate is all-green.

Reproduce:

```text
python tools/run_t3_host_tests.py --output artifacts/t3-4a/control
python tools/test_access_editions.py
tools/build_all_editions.ps1
python tools/verify_access_editions.py
```

Pre-change logs: `artifacts/t3-4a/before/`; final Control logs: `control/`; access suite: `access-tests/`; final build/config/ELF evidence: `builds/`; summary: `four-build-results.json`.

## Build design and static proof

`tools/build_tzll.ps1 -Module TYZS5|TYZS3 -Edition Control|Monitor` calls `build_access_variant.py`. It derives isolated generated Studio metadata from the original two project inputs, inserts the edition define, and changes only the generated Basic model default. Common firmware source remains shared through relative references. `tools/build_all_editions.ps1` builds all four sequentially. Original build scripts remain intact and default to Control with the added access-policy source unit.

Generated directories `studio/tzll-*-generated` are ignored by Git. They contain derived configuration/build products, not maintained source forks. Original tracked ZAP/defaults and prior original Studio binary outputs are not overwritten. Final edition artifacts reside in the explicit paths below; use these instead of older images under original Studio build folders.

Verification combines:

- Intel HEX checksums/record lengths, address ranges and flash byte counts.
- Complete model token scanning (Control is a prefix of Monitor), ZCL length-prefixed identity, and absence of all wrong module/edition model tokens.
- Actual runtime selector preprocessing and ELF attribute-writer presence, plus generated 33-byte model storage checks.
- Module and edition defines, binding/capability ELF symbols, expected diagnostic string at the compiled DP204 symbol.
- ARM disassembly: tzll_access_mode returns constant 0/1; the effective permission function calls it and takes the deny return for non-Control. The actual audited control gate calls access policy.
- No bootloader_writeStorage, bootloader_eraseStorageSlot, bootloader_setImageToBootload or bootloader_rebootAndInstall symbols; OTA cluster disabled.

The generic legacy lock_app_zb_rx function is host-tested but link-eliminated from final images because the existing production FC00 path is disabled. Its absence is not a Monitor bypass; it is not required to be linked merely for verification. EF00 and audited gate symbols remain in all four.

NVM3 remains linked at 0x77000..0x7FFFF. TYZS5 retains its existing EM2 policy; TYZS3 retains EM1 with EM2 disabled. Existing SDK HA-doorlock compliance warnings remain; no certification or stock bootloader/layout claim is added. Dynamic-password/SecKey behavior is unchanged. No low-level UART, protocol parser or converter logic edits.

## Final HEX files and checksums

Repository output root: `artifacts/t3-4a/builds/`. Each module/edition subdirectory contains its named HEX, ELF, build log and generated evidence.

| Variant / subdirectory | HEX filename | HEX bytes | Flash bytes | SHA256 |
|---|---|---:|---:|---|
| TYZS5-CONTROL | TYZS5-T3-4-CONTROL-REGRESSION.hex | 469873 | 167036 | 64048dc7c165a560569b956fc8e0f6ba3e7cc6aa83408089c8359b74d8d3115f |
| TYZS5-MONITOR | TYZS5-T3-4-MONITOR-REGRESSION.hex | 469902 | 167044 | 0997362f759760ffedb65107383d2e104b8904aeeff156bbe6e59a3b8fcca0c9 |
| TYZS3-CONTROL | TYZS3-T3-4-CONTROL-REGRESSION.hex | 468478 | 166540 | 35b571584dbb1a1d16d0f2361b86f48e390cdeff0f7196ecc16b3895363e1b31 |
| TYZS3-MONITOR | TYZS3-T3-4-MONITOR-REGRESSION.hex | 468507 | 166548 | 767dd797efbf8cef19874b6e521305f827457251e15deaa718b5b24c1ef26a14 |

Identical convenience copies and adjacent `.hex.sha256` files are in `D:\project\tyzs5-lock-port\hex\`, using the same filenames. All four are candidates, not release assets. Control HEX hashes change because the access layer is linked in; host wire behavior remains unchanged.

## Unchanged converters and release boundary

`git diff 559a3d9 -- zigbee2mqtt README.md README.zh-CN.md` is empty. TYZS5 Stable v1.2.2 and TYZS3 v0.1.0 remain the Control integrations. Checkout SHA256 values are respectively e35cc2dc0262a353ca17181eb633dd0ba5b355b4a17a268838295d388c8a6e91 and 46d34703c7b49cd497b4a2843530ea975686485b0ab668e96739decc6aa64779. Monitor does not match them, by design. A matching read-only integration remains T3-4B work; no test converter/sender was installed.

Monitor reduces the external lock-control attack surface at the firmware layer. The integration-and-firmware combined claim applies only after T3-4B adds the matching read-only converter. No unhackable/certified/guaranteed-secure claim. v1.2.0-alpha.1 is a future release line, not prepared here.

## Maintainer four-image regression

Retain exact-device stock backups, physical fallback and the established reviewed flashing/rollback procedure. Do not interchange module images or use whole-chip erase. No hardware was connected or written by Codex.

- TYZS5 Control: boot/pair, local unlock event, DP21, one temporary-password operation, DP54/55 and credential-list synchronization.
- TYZS3 Control: boot/pair, PID verification, local unlock event, DP21, DP54/55 and credential-list synchronization.
- TYZS5 Monitor: pair as TY0A01-TYZS5-MON; confirm battery, local events/credential IDs/lists, optional alarm and time sync. Intentionally attempt external DP21,24,54,55,49 and an arbitrary unsupported DP. Expect no MCU lock-control command while reporting/time/ACK remain functional.
- TYZS3 Monitor: pair as TY0A01-TYZS3-MON; confirm product-info/PID observation, battery, local events and DP58/59/60/93. Attempt DP21,54,55 and an arbitrary DP. Expect no MCU lock-control command and continued normal reporting.

Use maintainer-operated raw EF00/coordinator test tooling and DHO924 as appropriate. Current production converters deliberately will not recognize Monitor; do not alter their fingerprints to perform this test. Required internal ACK/time/wake traffic is not a forbidden user lock-control command.

Control: **No intentional user-visible or wire-protocol behavior change.**

Monitor: **Only externally-originated lock-control writes are intentionally removed. Read/report and required internal MCU protocol traffic remain.**

Status: **Ready for maintainer four-image hardware regression review.**
