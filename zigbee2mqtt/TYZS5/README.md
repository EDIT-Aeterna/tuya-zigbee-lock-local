# TYZS5 production converter

Canonical file: [tuya_ty0a01_tyzs5.js](tuya_ty0a01_tyzs5.js).

Reviewer Stable v1.2.1 candidate SHA-256:
`8DE0244E00CF66145377BD5B574B49020F41901A50B89F338A20CAE19004836F`

The file is copied byte-for-byte from the review bundle. Its sole fingerprint is:
`{modelID: 'TY0A01-TYZS5', manufacturerName: 'Tuya'}`.

Writes: DP21, DP24/25/26/27/28, DP48/49, DP54/55 and module-local DP202.
Read-only decoded sync: DP58/59/60.
Disabled: DP39, DP68/69/70, DP205/OTA. Removed: FC00 claim/auth, auth mappings 226/227/230 and DP200 writer.

Use the [installation guide](../../docs/zigbee2mqtt-guide.md). The old converter is retained under [legacy](legacy/README.md), not for installation. Never load both definitions simultaneously.

The converter does not intentionally persist plaintext credentials in device state; submitted values still pass through the HA/Z2M/MQTT request path. It retains the reviewer-provided CommonJS format. Syntax validation does not establish compatibility with every Zigbee2MQTT version; runtime and real-device regression remain required.
