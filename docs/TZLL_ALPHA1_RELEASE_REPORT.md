# TZLL v1.0.0-alpha.1 release preparation report

The release staging directory contains only firmware HEX, production converter, SHA256SUMS.txt and RELEASE_NOTES.md. IDE/dependency files, bootloader/OTA artifacts, legacy converter, logs and absolute paths are excluded.

Firmware canonical path: `studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex`; Generate + Clean + Build using the original script passed. SHA-256: `9CE1FED4754CABA18DC8EA3FFBD3BC7E2BCA462C5A73F3214A6EA1678E73A6B6`.

Production converter: `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`, Stable v1.2.1, SHA-256 `8DE0244E00CF66145377BD5B574B49020F41901A50B89F338A20CAE19004836F`; fingerprint only `Tuya / TY0A01-TYZS5`. Writable DP: 21,24,25,26,27,28,48,49,54,55,202. Read-only: 58,59,60. Disabled: 39,68,69,70,205/OTA. Node syntax check passed; local Z2M runtime was unavailable.

README, CHANGELOG, supported-locks, HA and Z2M guides are release-ready. NOTICE is retained; no LICENSE was added. Previously completed maintainer hardware validation remains historical evidence and was not falsely rerun.

Open follow-ups: license clarification, modern Z2M runtime loading, additional lock compatibility, TYZS3 and OTA. Maintainer must review staging, commit if needed, manually create/push tag `v1.0.0-alpha.1`, create the GitHub Release and upload assets. No tag or release was created automatically.
