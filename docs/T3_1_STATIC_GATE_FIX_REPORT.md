# T3-1 static-gate fixes

Historical static-gate build: its HEX hashes are superseded by `TYZS3_PID_GATE_HOTFIX_REPORT.md`. Use the hotfix images for subsequent validation; the earlier TYZS3 image incorrectly rejects pure-JSON product info.

Baseline: `5f41ef2287c624c43c24a5d34adb958489773a72`, branch `feature/tyzs3-common-core`. This delta fixes first-flash gates only. No production converter change, new writable DP, hardware write or release publication.

## Runtime identity and version

The explicit module-profile header selects `KAGEL_BASIC_MODEL`, manufacturer and diagnostic firmware version. Runtime Basic writes still run, using correctly length-prefixed strings derived from the selected literal (11 model characters); ZAP defaults are not relied upon. TYZS5 retains `Tuya / TY0A01-TYZS5` and DP204 `1.0.2`; TYZS3 uses `Tuya / TY0A01-TYZS3` and `T3-1`. MCU version remains separately stored product-info data.

The offline verifier now fails if the opposite model occurs anywhere in the HEX image, as well as checking the desired model. Both images pass. The previous TYZS3 HEX `57e611a3...` is superseded and must not be used for first flash.

## Product-info state and retry

Boot still sends Cmd01. `core_on_frame` only records complete MCU-frame arrival; it never sends the retry. After `tls_rx_feed` returns, the application sends at most one retry if boot querying has started, an MCU frame was seen, and no valid product info arrived. Tests prove reply-before-retry ordering, no retry on partial frames, only one retry after an unrelated frame and cancellation by a real product-info response.

`pid_verified` is separate from sticky `pid_mismatch`. Matching PID verifies only if no earlier mismatch occurred. Wrong PID, missing `p`, malformed JSON and an empty Cmd01 response latch mismatch, clear verification and cancel pending UART control. A later matching reply cannot clear the latch; reboot/reinitialization is required. No response alone is not a mismatch. Telemetry continues in every identity state.

`require_pid_match_for_writes=false` for srptwvak preserves its no-reply control policy. The flag is true for ujcjk46o, so all writable lock commands require a matching observed PID. The common identity check applies to EF00, the retained app legacy entry and the internal temporary-password entry. Writable sets are unchanged: srptwvak 21,24,25,26,27,28,48,49,54,55; ujcjk46o 21,54,55.

## Power and bootloader probe

`KAGEL_EM2_DEEPSLEEP` is now overridable, with default 1 unchanged for TYZS5. The TYZS3 project explicitly defines 0; the EM1 requirement remains held and the deep-sleep release call is compiled out. UART wake code is retained for future reviewed power testing.

TYZS3 disables the adapter's bootloader initialization/storage-slot probe. ELF inspection confirms no adapter call to `bootloader_init` and no `bootloader_getStorageSlotInfo` symbol. SDK `sl_platform_init` still calls its required read-only `bootloader_init`; removing that SDK component is deferred to avoid unrelated churn. OTA write/erase/install symbols remain absent in both targets. TYZS5's original probe is unchanged.

## Diagnostic converter

`zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_candidate.js` is standalone and explicitly experimental. It matches only Tuya / TY0A01-TYZS3. Reviewed DP21 staging and structured DP54/55 builders/handlers are reused, with observed face type 4 added to credential selection. There is no generic writable datapoint converter. No DP24–28,39,48/49,68–70,200,202,205, OTA or FC00 writer is exposed.

Read reports include known unlock actions, credential IDs, battery, optional alarm, DP204 module version and DP58/59/60/93 lists using verified one-based shards. DP93 is marked as an observed extension. `node --check` and stubbed module-load/report/writer tests pass. Full live Zigbee2MQTT loading and hardware control are not claimed tested.

## Validation and artifacts

| Artifact | SHA-256 |
|---|---|
| TYZS5 regression HEX | `6a0dd59386aaf115e0f7d2a81b94418f97cf6324985eb2ec713092abb2de502a` |
| TYZS3 candidate HEX | `8fb7367a45891a3d99b1b1cb794148e054a830f04fcc916bbf89305841e2ca8d` |
| TYZS3 diagnostic converter | `4dfdd0f44876fd183b4fb5fcf188e324eeea439831759a4323f0dc4867c15a50` |

Both targets pass Generate -> Clean -> Build. Exact current HEX sizes, ranges and SHA-256 are in `artifacts/t3-1/build-results.json` and the review bundle's per-target build reports. Both current-profile C suites, Stage 1.1 UTC+8, Stage 2B adapter, Stage 2D atomic EF00, Stage 2F-R, Stage 2G EF00/legacy gate, host selftest, 35 fixtures, production bitmap regressions and candidate-converter tests pass. Four previously documented stale stage tests remain baseline-identical failures, not new regressions; their assertions were not rewritten. The aggregate runner consequently reports those failures explicitly.

The inherited ZAP HA-doorlock standard-cluster compliance warnings remain and are not a claim of Zigbee certification. Generated/copied text and log trailing whitespace is normalized before committing; executable content is unaffected. The review bundle includes source snapshot, diff, converter, both HEX images, build logs, hashes and the updated first-flash plan.

## Remaining human gates

1. Flash/test the new TYZS5 regression image on known TYZS5 hardware; Codex has not performed or passed this hardware gate.
2. Obtain two matching 524288-byte stock reads of the exact TYZS3 module, preserve USERDATA/tokens, and review the original backup and address layout. Rollback policy is unchanged.
3. Review/install the TYZS3 diagnostic converter in the controlled test environment and explicitly approve the first TYZS3 flash only after the preceding gates pass.

Ready for maintainer TYZS5 regression test and stock-layout review; TYZS3 flash not yet approved.
