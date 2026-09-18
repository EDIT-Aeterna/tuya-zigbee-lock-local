# T3-3 platform cleanup — verification and handoff

## Baseline and scope

Started on clean `main` at `3e7fbed58aa2f1fe6859e37a8fddbca4d3b54a4a`, tag `v1.1.0-alpha.1`. Work branch: `refactor/t3-3-platform-cleanup`. Origin and upstream are unchanged. This is a local behavior-preserving architecture refactor, not a new release. No converter modification, hardware operation, tag, remote push or GitHub publication.

## Reviewable commits

| Commit | Change |
|---|---|
| ae60974 | Characterize current binding behavior before policy edits; retain pre-refactor logs |
| e5fe857 | Introduce neutral capability profiles and explicit DP arrays |
| de457ad | Introduce static product bindings and runtime observation model |
| a502a3d | Route common policy to bindings; remove old lock_profile policy; update Studio source lists |
| bd99654 | Architecture/roadmap and independent module-binding checks |
| bda6c03 | Preserve existing audited gate entry on the actual control path |

The final evidence commit records this report, generated build integration, both rebuilt images and test logs. `git log --oneline 3e7fbed..HEAD` lists the complete final commit sequence.

## Architecture and exact policies

| Owner | Responsibility |
|---|---|
| Module target | Basic model, hardware adapter, pins/peripherals, power, diagnostic version, Studio/flashing target |
| Product binding | Expected PID, tested MCU metadata, product quirks, PID verification policy, capability reference, unchanged UTC+8 metadata |
| Capability profile | Neutral feature flags plus explicit writable-DP list; flags never grant permission |
| Runtime observation | Received/latest-valid flags, observed PID/MCU, original PID length, OTA trailer presence/value |

| Binding | Capability | Exact writable DPs | PID requirement | Quirk |
|---|---|---|---|---|
| srptwvak | TUYA_LOCK_CAP_EXTENDED_V1 | 21,24,25,26,27,28,48,49,54,55 | Preserved: no reply alone does not block, but invalid/wrong reply latches rejection | none |
| ujcjk46o | TUYA_LOCK_CAP_CORE_V1 | 21,54,55 | Matching expected PID required before writes | DP54 stage-0 declared 7 / actual 9, observed on MCU 1.0.0 |

The quirk belongs only to the ujcjk46o product binding, not CORE_V1. Tested MCU versions (srptwvak 1.0.8, ujcjk46o 1.0.0) remain evidence metadata, not new version gates. Multiple future PIDs can share a profile, but automatic binding lookup and generic unknown-product fallback are not implemented. Raw PID matching is isolated in lock_product_binding.c. Old lock_profile.c/h are removed; there is no competing policy system.

Current production builds still explicitly select TYZS5+srptwvak and TYZS3+ujcjk46o. Historical `LOCK_PROFILE_UJCJK46O` spelling remains a compile-time binding selector. Module identity depends only on the module selector; the module header's PID-specific assertion was removed. Four host matrix combinations demonstrate independent identity and expected-PID selection; cross-combinations are tests, not newly supported products.

The existing `kagel_control_dp_allowed()` delegates to the selected binding's capability allowlist and remains called by the real control path. An initial build showed it was garbage-collected when the app bypassed the wrapper; the final implementation restores that call, without adding a second policy. Both final ELFs define the audited gate and serial send symbols.

## Behavior preservation

No intentional user-visible or wire-protocol behavior change.

Pre-refactor public-path characterization was committed and passed before any policy implementation changed. The same test source still produces the same UART/report stream digests after refactoring:

| Binding | Before | After |
|---|---|---|
| srptwvak | 4a39cb8b | 4a39cb8b |
| ujcjk46o | 27085207 | 27085207 |

These digests and assertions cover both no-response policies, matching/wrong/missing/malformed/empty Product Info, all three measured trailer forms, DP21 wake/send, reporting under blocked identity, DP54 quirk dispatch, time replies and sticky rejection. They are characterization evidence, not proof of every possible hardware timing condition.

The existing strict JSON grammar was moved without expansion. Full pure JSON is preserved; only a `}` followed by 0x00/0x01 is split as an OTA trailer. Presence and capability are now separate runtime metadata. Latest invalid observations mark valid=false while preserving last parsed identity strings; these internal diagnostics are not new wire reports. Original PID length prevents truncated data from matching. Sticky PID mismatch, pending-write cancellation, telemetry and one post-MCU-activity retry remain unchanged.

Timezone is still 28800 seconds. A TODO explicitly reserves deployment/site timezone configuration for later. UART framing/retry, payload validators, DP layouts, Zigbee transport, pins, NVM3, power and OTA logic were not redesigned. No SecKey algorithm, new controls or converter commonization.

## Tests

Commands:

```text
python tools/run_t3_host_tests.py --output artifacts/t3-3/before  (before refactor)
python tools/run_t3_host_tests.py --output artifacts/t3-3/after   (final code)
python tools/check_t3_3.py
python tools/verify_t3_builds.py --output artifacts/t3-3
```

- Both public-path characterization builds: PASS; exact allowlists and pre/post trace digests unchanged.
- New platform_binding_test on both selections: PASS. Exhaustive 16-bit DP membership, flags without permissions, explicit permission without flags, two same-CORE bindings with different quirk behavior, OTA flag presence/value, static metadata vs observed version, no auto-rebinding and sticky safety are checked.
- Both existing t3_common_core_test builds: ALL PASS. Test accessors were mechanically adapted to new structures, not weakened. Includes malformed/wrong/missing/empty product info, retry, DP54 quirk, DP49 13-byte parser, 27-byte extended temporary schedule and credential structures.
- Stage 1.1 UTC+8, Stage 2B adapter, Stage 2D atomic EF00, Stage 2F-R, Stage 2G EF00 and legacy validator, host_selftest: PASS.
- Fixtures: 35 passed / 0 failed / 0 awaiting hardware.
- TYZS5 bitmap/captured-vector tests and TYZS3 converter tests: PASS; canonical JS syntax checks PASS.
- Module/binding independence: four host combinations PASS, with no hardware compatibility claim for untested combinations.
- Four historical reviewer tests retain the identical pre-existing failures: Stage 2D only-DP21 assertion (3221226505), Stage 2E-A DP49-forbidden expectation (exit 1), Stage 2E-B old DP49-method expectation (exit 1), Stage 2F old DP39 permission/DP26 layout (exit 1). Thus the aggregate runner still exits 1; no assertions were rewritten to hide these conflicts. The comparison script asserts all existing result codes match the pre-refactor run and all new tests pass.

Evidence is under `artifacts/t3-3/before`, `after`, `platform-checks.json`, `build-results.json`, both build logs and symbol lists. Original historical logs remain available.

## Builds and images

Original flows `tools/build_stage2br.ps1` and `tools/build_tyzs3.ps1`: Generate + Clean + Build PASS. Final source implementation: bda6c03. SDK/toolchain unchanged. Generated project source lists include the new capability/binding units and remove lock_profile.c. Whitespace-only generated C/header churn was restored after verifying no content changes. Generated build outputs and dependency records reflect the final source list.

| Target | Canonical Studio HEX | HEX file bytes | Flash bytes | SHA256 |
|---|---|---:|---:|---|
| TYZS5 | studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex | 469783 | 167004 | 97b998853292fb3194f31bea33b42c578af69fd6840efbb9b9c5122c96e844f7 |
| TYZS3 | studio/tyzs3-candidate/build/debug/kagel_tyzs3_ujcjk46o.hex | 468388 | 166508 | 3a5a92b246883fdf323cdc20afe5c330e5e64962d42494cdd247967bd5c9edde |

Convenience copies, identical to these outputs:

```text
D:\project\tyzs5-lock-port\hex\TYZS5-T3-3-REGRESSION.hex
D:\project\tyzs5-lock-port\hex\TYZS3-T3-3-REGRESSION.hex
```

Each has an adjacent `.hex.sha256`. These are hardware-regression images, not a new public release. Prior release/hotfix copies remain untouched.

TYZS5 identity remains Tuya / TY0A01-TYZS5, binding srptwvak, EXTENDED_V1, version 1.0.2. TYZS3 remains Tuya / TY0A01-TYZS3, binding ujcjk46o, CORE_V1, version T3-1, EM1 retained and EM2 disabled. OTA write/install remains disabled for both; the verifier confirms forbidden symbols absent and identities not interchanged. NVM3 boundaries remain 0x77000..0x7FFFF. Existing SDK HA-doorlock compliance warnings remain; this is not certification or a new stock-layout compatibility claim.

HEX hashes changed from the prior validated images due to the C refactor. Flash data grows by 272 bytes (TYZS5) and 224 bytes (TYZS3); BSS grows by 8 bytes each. Hardware regression is still required.

## Converter preservation

`git diff 3e7fbed -- zigbee2mqtt` is empty. TYZS5 Stable v1.2.2 and TYZS3 v0.1.0 fingerprints, entities, writers and all source content remain unchanged. Current checkout SHA256 values:

- TYZS5: e35cc2dc0262a353ca17181eb633dd0ba5b355b4a17a268838295d388c8a6e91
- TYZS3: 46d34703c7b49cd497b4a2843530ea975686485b0ab668e96739decc6aa64779

TYZS3 checkout uses Git's CRLF conversion, unlike the prior release's LF copy (115a87e0...). Its normalized Git blob is unchanged (`2b09583dd82ea92447e4b28eaec50744c8992ebf`); T3-3 made no converter edit and does not repackage it.

## Maintainer regression and stop condition

Keep existing exact-device backups/layout/rollback requirements and use the correct module image. Codex did not connect to or flash hardware.

TYZS5 minimum: boot/pair, local unlock event, DP21, one temporary-password operation, DP54, DP55 and credential-list synchronization.

TYZS3 minimum: boot/pair, PID verification, local unlock event, DP21, DP54, DP55 and credential-list synchronization. Do not add new feature tests or enable forbidden controls for this review.

No tag/release is prepared. Status: **Ready for maintainer dual-target hardware regression review.**
