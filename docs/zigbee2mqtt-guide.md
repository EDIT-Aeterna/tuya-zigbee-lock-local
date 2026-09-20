# Zigbee2MQTT installation — TZLL v1.2

Use the converter that matches **both** module and Access Edition.

| Target | Canonical repository converter | Exact fingerprint |
|---|---|---|
| TYZS5 Control | `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js` | Tuya / TY0A01-TYZS5 |
| TYZS5 Monitor | `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5_monitor.js` | Tuya / TY0A01-TYZS5-MON |
| TYZS3 Control | `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js` | Tuya / TY0A01-TYZS3 |
| TYZS3 Monitor | `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_monitor.js` | Tuya / TY0A01-TYZS3-MON |

Never reuse a Control definition for Monitor and never load duplicate fingerprints.

## Install

1. Back up Zigbee2MQTT configuration and active external converters.
2. Remove any older/candidate definition matching the same identity.
3. Copy the selected converter into the deployment's external-converter directory/registration.
4. Restart Zigbee2MQTT and check converter-loading errors before testing.
5. Pair or re-interview the lock and confirm the exact Tuya model identity above.

TZLL retains the reviewed CommonJS `.js` format. Do not rename a converter to `.mjs` without testing that deployment path.

## Control vs Monitor

TYZS5 Control firmware permits DP21,24–28,48,49,54,55. TYZS3 Control permits DP21,54,55 after PID verification. Both Monitor definitions are read-only: no lock-control `toZigbee` writers and no writable lock exposes; firmware adds a second independent deny layer.

The unchanged TYZS5 Control converter still contains optional DP202 handling, but DP202 is outside the firmware allowlist and is not a supported end-to-end control.

DP58/59/60/93 credential IDs use `ID = (shard - 1) * 8 + bit`; exact `00 00` is the empty-list sentinel. DP93 is an observed report-only face-list extension.

See [Access Editions](ACCESS_EDITIONS.md), [TYZS3 guide](tyzs3-guide.md) and [supported locks](supported-locks.md).
