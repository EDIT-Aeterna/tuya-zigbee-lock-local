# Tuya Zigbee Lock Local (TZLL) v1.1.0-alpha.1

<img width="1308" height="1912" alt="image" src="https://github.com/user-attachments/assets/fe1053bc-1a1d-4df8-a24a-b884bb38ef6c" />
<img width="1307" height="1223" alt="image" src="https://github.com/user-attachments/assets/bc33dd89-441c-4b3f-b9e4-af53920a4189" />

**English** | [简体中文](README.zh-CN.md)

Local firmware and Zigbee2MQTT integration for tested TYZS5 and TYZS3 locks using EFR32MG13P732F512GM48. This prerelease introduces initial hardware-validated TYZS3 support on the shared core. Tuya Cloud and Tuya App compatibility are intentionally not retained.

| Module | Status | Tested binding / notes |
|---|---|---|
| TYZS5 | Validated / stable target | srptwvak; current mature target |
| TYZS3 | Initial hardware-validated support | ujcjk46o / lock MCU 1.0.0; conservative control surface |

PID means Tuya Product ID / tested product-definition binding, not module type or protocol family. A matching module does not guarantee identical lock-MCU features. Alarm, door sensing and work/power mode remain lock-dependent. See the [supported-lock matrix](docs/supported-locks.md).

## Select your converter

| Module | Canonical converter | Version / exact fingerprint |
|---|---|---|
| TYZS5 | [tuya_ty0a01_tyzs5.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js) | Stable v1.2.2; Tuya / TY0A01-TYZS5 |
| TYZS3 | [tuya_ty0a01_tyzs3.js](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js) | v0.1.0 initial validated integration; Tuya / TY0A01-TYZS3 |

Use the [TYZS5 converter guide](docs/zigbee2mqtt-guide.md) or [TYZS3 guide](docs/tyzs3-guide.md). Remove the old TYZS3 candidate definition before installing its canonical replacement. Legacy SmartHomePlus / LCK-BI400 converters are reference only, not a fallback for current TZLL firmware. Do not load duplicate definitions.

TYZS5 firmware control policy is unchanged: DP21,24–28,48,49,54,55. Its unchanged converter also exposes optional DP202, which is not in the firmware control allowlist and is not a supported end-to-end control in this release. TYZS3 supports only structured DP21 remote unlock and DP54/55 enrollment/deletion after verified PID. Read-only events, battery and credential lists depend on the lock MCU.

## Firmware and first installation

Shared source: [firmware/common](firmware/common/). Adapters: [TYZS5](firmware/TYZS5/) / [TYZS3](firmware/TYZS3/). Build entry points: `tools/build_stage2br.ps1` and `tools/build_tyzs3.ps1`. The internal TYZS3 Studio directory remains `studio/tyzs3-candidate`; release filenames no longer use candidate naming.

The release ZIP contains separate `firmware/TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex` and `firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex`. Never interchange module images. Check SHA256SUMS before installation.

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

Maintainer hardware validation passed on the tested bindings, including TYZS5 common-core regression and TYZS3 DP21/54/55. Automated release checks are recorded separately; they do not claim universal lock compatibility.

Original upstream code and history are preserved. © 2026 Nicki Eftekhari; original rights notices remain applicable. No new blanket license is assigned to upstream-derived code.
