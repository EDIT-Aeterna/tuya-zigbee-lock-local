# TZLL v1.1.0-alpha.1

First TZLL release preparation with hardware-validated TYZS3 support. Prerelease assets are ready for maintainer review; no tag or GitHub Release is created automatically.

## TYZS5

- Existing validated support retained on the common core; maintainer hardware regression PASS.
- Production converter Stable v1.2.2 unchanged.
- Identity Tuya / TY0A01-TYZS5; tested product binding srptwvak.

## TYZS3

- Initial validated integration, converter v0.1.0.
- Identity Tuya / TY0A01-TYZS3.
- Tested product binding ujcjk46o / MCU 1.0.0; module diagnostics remain T3-1.
- Local unlock events and battery.
- Fingerprint/password/card/face credential lists; observed DP93 face-sync extension.
- DP21 remote password unlock, DP54 enrollment, DP55 deletion, all behind firmware PID verification.
- Pure-JSON product info and JSON plus 0/1 OTA capability trailer are accepted. OTA remains disabled.
- Narrow product-specific malformed DP54 stage-0 report compatibility retained.
- Exact `00 00` means empty credential list/count zero; other shard-zero inputs are still rejected.

## Install / upgrade

The ZIP contains one HEX and one canonical converter per module. Verify SHA256SUMS and select the correct target. TYZS3 uses `tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex`; TYZS5 uses `tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex`.

Firmware bytes remain identical to the maintainer-validated T3 PID-hotfix images; a device already running that exact image does not need reflashing solely for the release filename. A v1.0.x TYZS5 installation is an older firmware baseline; do not assume it has the common-core image.

Remove the former TYZS3 candidate converter before installing the canonical `tuya_ty0a01_tyzs3.js`. Do not load duplicate fingerprints. Legacy SmartHomePlus / LCK-BI400 converters are not installation fallbacks. Converter dispatch diagnostics do not prove MCU execution.

Before any first flash, keep matching full exact-device stock backups and review stock layout/rollback. No mass erase, standalone bootloader installation or legacy flashing executable is included. See repository `docs/FLASHING.md`, `docs/tyzs3-guide.md` and `docs/tyzs3-guide.zh-CN.md`.

## Known TYZS3 limitations

- Periodic temporary-password management not exposed: stock transport was observed, but stored passwords did not unlock the tested lock.
- One-time temporary password and freeze/unfreeze not exposed; tested stock DP27 produced no MCU reply.
- Dynamic password unavailable after TZLL flash: proprietary Tuya SecKey validation is not implemented.
- DP48/49 not exposed in initial support.
- No DP24–28,39,48/49,68–70,200,202,205/OTA or FC00 writes.
- EM2 disabled; conservative EM1 policy retained. No mature battery-life claim.
- OTA disabled; Tuya Cloud/App compatibility is not retained.

## Compatibility and evidence

A matching TYZS3/TYZS5 module does not guarantee identical lock-MCU features. PID is a Tuya product-definition binding, not a module or protocol-family identifier. Alarm, power/work mode and sensing capabilities vary by lock MCU. DP93 is an observed/validated Zigbee face-list extension, not claimed as an assignment in the older public household-lock table.

Maintainer hardware results cover TYZS5 common-core regression and TYZS3 boot/pairing/product info/actions/battery/lists/DP21/54/55. Codex performed automated build/static tests only. The canonical TYZS3 converter's empty-list adjustment is additionally tested offline; a final packaged smoke check remains a maintainer option. Four obsolete earlier-stage tests still conflict with current policy; their unchanged failures are documented in the validation report.

The unchanged TYZS5 converter exposes optional DP202, but current firmware does not allow it as an outbound control. This release does not claim DP202 end-to-end support.

## Licensing

Upstream-derived code license status remains as documented in NOTICE and repository licensing guidance. Original attribution/history are retained; no new blanket MIT/GPL/Apache license is granted.
