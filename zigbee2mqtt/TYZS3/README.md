# TYZS3 Zigbee2MQTT converters

Validated Product Binding: `ujcjk46o / MCU 1.0.0`.

| Edition | Canonical file | Fingerprint | Write surface |
|---|---|---|---|
| Control | `tuya_ty0a01_tyzs3.js` | Tuya / TY0A01-TYZS3 | DP21/54/55 after firmware PID verification |
| Monitor | `tuya_ty0a01_tyzs3_monitor.js` | Tuya / TY0A01-TYZS3-MON | none |

Monitor v0.1.0 exposes passive/report-only information and has no lock-control `toZigbee` writer. Control v0.1.0 retains the validated structured writers. Credential IDs use `(shard - 1) * 8 + bit`; exact `00 00` is the empty-list sentinel.

TYZS3 Control does not expose DP24–28, DP48/49, DP39, DP68–70, DP200/202/205, OTA or FC00 writes. Dynamic password/SecKey is unsupported.

Install using the [TYZS3 guide](../../docs/tyzs3-guide.md) and [Access Editions](../../docs/ACCESS_EDITIONS.md).
