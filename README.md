# Tuya Zigbee Lock Local (TZLL) v1.2.0-alpha.1

**English** | [简体中文](README.zh-CN.md)

Local firmware and Zigbee2MQTT integration for tested TYZS5 and TYZS3 locks using EFR32MG13P732F512GM48. This alpha adds Control and Monitor editions on the shared core. Prepared for maintainer review and manual publication. Tuya Cloud and Tuya App compatibility are intentionally not retained.

| Module | Status | Tested binding / notes |
|---|---|---|
| TYZS5 | Validated / stable target | srptwvak; current mature target |
| TYZS3 | Initial hardware-validated support | ujcjk46o / lock MCU 1.0.0; conservative control surface |

PID means Tuya Product ID / tested product-definition binding, not module type or protocol family. A matching module does not guarantee identical lock-MCU features. Alarm, door sensing and work/power mode remain lock-dependent. See the [supported-lock matrix](docs/supported-locks.md).

## Choose your edition

Monitor Edition is the recommended default if you only need Home Assistant lock status/events. Control Edition is for users who explicitly need remote lock-control functions.

| Edition | Reporting | Remote unlock | Credential writes | Temp password |
|---|---|---|---|---|
| Monitor / 只读监控版 | MCU-dependent | No | No | No |
| Control / 可控制版 | MCU-dependent | Profile-based | Profile-based | Profile-based |

Monitor Edition removes the normal integration-layer lock-control writers and firmware-side externally-originated lock-control permissions, reducing the remote-control attack surface. It is not a security certification or a guarantee against all risks. Required internal wake, time, network state and ACK traffic remain active.

Available control capabilities depend on the module target, Product Binding, Capability Profile and the actual lock MCU. Both Monitor editions have an empty external writable-DP set. See [Access Editions](docs/ACCESS_EDITIONS.md).

## Select your converter

| Module | Canonical converter | Version / exact fingerprint |
|---|---|---|
| TYZS5 | [tuya_ty0a01_tyzs5.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js) | Stable v1.2.2; Tuya / TY0A01-TYZS5 |
| TYZS3 | [tuya_ty0a01_tyzs3.js](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js) | v0.1.0 initial validated integration; Tuya / TY0A01-TYZS3 |
| TYZS5 Monitor | [tuya_ty0a01_tyzs5_monitor.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5_monitor.js) | v0.1.0 read-only; Tuya / TY0A01-TYZS5-MON |
| TYZS3 Monitor | [tuya_ty0a01_tyzs3_monitor.js](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_monitor.js) | v0.1.0 read-only; Tuya / TY0A01-TYZS3-MON |

Use the [TYZS5 converter guide](docs/zigbee2mqtt-guide.md) or [TYZS3 guide](docs/tyzs3-guide.md). Remove the old TYZS3 candidate definition before installing its canonical replacement. Legacy SmartHomePlus / LCK-BI400 converters are reference only, not a fallback for current TZLL firmware. Do not load duplicate definitions.

TYZS5 firmware control policy is unchanged: DP21,24–28,48,49,54,55. Its unchanged converter also exposes optional DP202, which is not in the firmware control allowlist and is not a supported end-to-end control in this release. TYZS3 supports only structured DP21 remote unlock and DP54/55 enrollment/deletion after verified PID. Read-only events, battery and credential lists depend on the lock MCU.

## Firmware and first installation

Shared source: [firmware/common](firmware/common/). Adapters: [TYZS5](firmware/TYZS5/) / [TYZS3](firmware/TYZS3/). Build all four with `tools/build_all_editions.ps1`. Reproduce the audited package with `python tools/package_v1_2_release.py`; see [release preparation](docs/RELEASE_PREPARATION_v1.2.0-alpha.1.md).

1. Identify your module: TYZS3 or TYZS5 and its tested binding/wiring.
2. Choose Monitor (recommended for read-only use) or Control.
3. Verify SHA256SUMS.txt and flash the matching HEX after backup/layout review.
4. Install the matching converter.
5. Pair/re-interview and verify Basic identity.

The release ZIP contains four versioned HEX files such as `firmware/TYZS5/tzll_tyzs5_monitor_v1.2.0-alpha.1.hex`, with matching versioned converter copies. See [release notes](RELEASE_NOTES_v1.2.0-alpha.1_zh-en.md) for all filenames. Never interchange module images or use a Control converter for Monitor. Switching editions requires reflashing and changes modelIdentifier; Zigbee2MQTT may require deleting/re-pairing or re-interviewing to refresh identity and HA entities.

Read [flashing and backup requirements](docs/FLASHING.md) first. Keep a verified full backup of the exact module and a rollback path. No mass erase, legacy one-click flasher, OTA or standalone bootloader installation is part of the supported procedure. Stock layout compatibility must be reviewed for each untested target.

TYZS3 initial support does not expose periodic/one-time temporary passwords, freeze/unfreeze or DP48/49. Stock dynamic passwords stop working after TZLL flash because proprietary SecKey validation is unavailable. TYZS3 retains conservative EM1 operation with EM2 disabled; it is not yet a fully mature low-power target.

## Evidence and documentation

- [TYZS3 known-good baseline](docs/TYZS3_KNOWN_GOOD_BASELINE.md)
- [Tested product binding and limitations](docs/lock-profiles/ujcjk46o.md)
- [Release validation](docs/TYZS3_VALIDATION_v1.1.0-alpha.1.md)
- [Release notes](RELEASE_NOTES.md)
- [Home Assistant guide](docs/home-assistant-guide.md)
- [Compatibility report template](docs/compatibility-report-template.md)
- [Original attribution](NOTICE.md) / [license status](docs/LICENSE_RECOMMENDATION.md)

Maintainer hardware validation passed for both Control targets and both Monitor firmware + converter combinations in Zigbee2MQTT/Home Assistant. Automated checks are recorded separately; Codex did not perform hardware tests. DP8 is diagnostic, not a reliable independent physical door-contact sensor. Dynamic password/SecKey remains unsupported; OTA and unresolved bootloader/layout work remain outside this release.

Original upstream code and history are preserved. © 2026 Nicki Eftekhari; original rights notices remain applicable. No new blanket license is assigned to upstream-derived code.
