# Access Editions — Control and Monitor

The compile-time access policy is independent of module target, product binding and capability profile. The maintainer has validated all four firmware variants, including both Monitor converters in Zigbee2MQTT/Home Assistant. v1.2.0-alpha.1 is prepared for manual release review. Monitor is recommended for status/events-only use; Control is for intentional remote lock control.

## Control Edition / 可控制版

Control retains the validated product-binding control surface and existing PID checks. No intentional user-visible or wire-protocol behavior change from T3-3.

| Module | Product / capability | Effective external writable DPs | Basic manufacturer / model | DP204 |
|---|---|---|---|---|
| TYZS5 Control | srptwvak / EXTENDED_V1 | 21,24,25,26,27,28,48,49,54,55 | Tuya / TY0A01-TYZS5 | 1.0.2 |
| TYZS3 Control | ujcjk46o / CORE_V1 | 21,54,55 | Tuya / TY0A01-TYZS3 | T3-1 |
| TYZS5 Monitor | srptwvak / EXTENDED_V1 | empty | Tuya / TY0A01-TYZS5-MON | 1.0.2-MON |
| TYZS3 Monitor | ujcjk46o / CORE_V1 | empty | Tuya / TY0A01-TYZS3-MON | T3-1-MON |

## Monitor Edition / 只读监控版

Monitor Edition is read-only from the Home Assistant / Zigbee2MQTT control perspective. The module still performs required internal MCU protocol traffic such as wake, time synchronization and acknowledgements.

Monitor 只在固件的外部锁控制入口拒绝写入，并非禁止所有 UART 发送。Product Info 查询与重试、网络状态、时间同步回复、MCU 上报 ACK、本地开锁事件、电池和凭证列表上报仍正常执行。PID 不匹配时仍保留既有遥测行为，Monitor 不因 PID 已验证而开放控制。

The deny rule is positive: only compiled Control mode can grant the capability profile's existing allowlist. Monitor denies every external DP, including unknown/future IDs. It is not a blacklist. No new monitor-specific product/capability profiles exist.

The access edition cannot be changed by Zigbee, MQTT, HA, DP, NVM or a hidden runtime setting. Switching requires reflashing another image. There is no setter or persistent mode variable. Default compilation without a selector remains Control for compatibility; the matrix builder explicitly sets 0 or 1, and invalid values are compile errors.

## Enforcement and protocol boundary

`firmware/common/tzll_access_policy.c/h` owns the compile-time mode and access decision. `kagel_control_dp_allowed()` delegates through it, preserving the audited real EF00/legacy external-control path and shared validators. The external temporary-password helper also uses it, so the legacy CREATE_TEMP_PW path cannot bypass Monitor. No gate was added to generic `tls_send_*` functions or report forwarding.

PID verification, atomic one-DP EF00 parsing, payload validators, quirk handling, UTC+8, SecKey-unsupported dynamic-password behavior and read parsers remain unchanged. DP8 is diagnostic/non-reliable; alarm, DP93 and other reports remain lock-MCU dependent. Monitor is not an implementation of proprietary dynamic passwords.

## Identity and diagnostics

The runtime Basic writer still derives the ZCL length prefix from `sizeof KAGEL_BASIC_MODEL - 1`. Model selection is centralized in `firmware/TYZS5/kagel_profile.h` using module target plus access edition; isolated ZAP generation uses the same edition identity. Control model names have 12 characters, Monitor 16. Both fit the existing 33-byte Basic char-string attribute (length byte plus 32 characters). Earlier historical documents counted the Control literal as 11; the actual string/runtime size is 12 and the code already computed it correctly.

The existing DP204 string report uses `sizeof s_fwver - 1`, so suffixes 1.0.2-MON (9 bytes) and T3-1-MON (8 bytes) fit without a new protocol. Control diagnostic versions and unrelated numeric diagnostic metadata are unchanged. Both final image tokens and compiled runtime selection are verified; the Control name is a prefix of Monitor, so the verifier compares complete model tokens rather than rejecting substrings.

## Builds from shared source

```powershell
tools/build_tzll.ps1 -Module TYZS5 -Edition Control
tools/build_tzll.ps1 -Module TYZS5 -Edition Monitor
tools/build_tzll.ps1 -Module TYZS3 -Edition Control
tools/build_tzll.ps1 -Module TYZS3 -Edition Monitor
# Or build all four:
tools/build_all_editions.ps1
```

Existing `build_stage2br.ps1` and `build_tyzs3.ps1` still build Control by default; their source lists now include the access-policy unit. The matrix builder derives isolated `studio/tzll-<module>-<edition>-generated` metadata from the original project inputs, sets the edition define and the Basic model default, then runs the same SLC, ZAP, Clean and Make flow. Shared firmware sources are referenced directly; there are no four independent firmware source trees. Generated directories are ignored by Git, and output evidence is kept under `artifacts/t3-4a/builds/`.

Normal original Studio inputs are not temporarily rewritten. Matrix outputs do not overwrite the previous T3-3 Studio HEX files or release package. Use the explicitly named T3-4 artifacts, not an older canonical build left in a different directory. See [four-build report](T3_4A_ACCESS_POLICY_REPORT.md) for exact paths and hashes.

## Matching converters and security scope

Monitor Edition removes the normal integration-layer lock-control writers and firmware-side externally-originated lock-control permissions, reducing the remote-control attack surface.

只读监控版同时移除 Zigbee2MQTT 控制写入入口，并在固件层拒绝外部发起的门锁控制写入，从而缩小远程控制攻击面。

Use `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5_monitor.js` or `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_monitor.js`. Both are validated v0.1.0 definitions with empty toZigbee and read-only exposes. Never reuse Control definitions for Monitor. Switching requires reflashing; the changed modelIdentifier may require re-interview or deleting/re-pairing in Zigbee2MQTT.

No claim of being unhackable, certified or guaranteed secure is made. Physical access, implementation defects and other system threats remain outside the narrow firmware access-policy claim. OTA stays disabled in all four. TYZS3 retains EM1/EM2-disabled operation; TYZS5 retains its existing power policy.

Maintainer hardware validation is reported in the release taskbook. Automated tests independently check external denial and preserved internal traces; Codex performed no hardware testing. Do not confuse an ACK/time frame with a forbidden DP command. Use DHO924 where helpful. No test sender is installed automatically; coordinator-level test tools must be explicitly operated by the maintainer.
