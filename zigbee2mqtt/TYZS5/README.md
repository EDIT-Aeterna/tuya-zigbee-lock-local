# TYZS5 Zigbee2MQTT converters

Validated Product Binding: `srptwvak`.

| Edition | Canonical file | Version | Fingerprint | Write surface |
|---|---|---|---|---|
| Control | `tuya_ty0a01_tyzs5.js` | Stable v1.2.2 | Tuya / TY0A01-TYZS5 | DP21,24–28,48,49,54,55 in firmware |
| Monitor | `tuya_ty0a01_tyzs5_monitor.js` | v0.1.0 | Tuya / TY0A01-TYZS5-MON | none |

Monitor has no lock-control `toZigbee` writer. DP58/59/60/93 credential IDs use `(shard - 1) * 8 + bit`; exact `00 00` is the empty-list sentinel.

The unchanged Control converter still contains optional DP202 handling, but DP202 is outside the current firmware allowlist and is not a supported end-to-end control. DP39, DP68/69/70 and DP205/OTA remain disabled.

Use the [installation guide](../../docs/zigbee2mqtt-guide.md). The [legacy](legacy/README.md) definitions are historical/reference only.
