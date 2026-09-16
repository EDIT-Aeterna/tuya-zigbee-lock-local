# TZLL v1.0.0-alpha.2

Converter-only correctness prerelease: Stable v1.2.2 for the validated TYZS5 / EFR32MG13P732F512GM48 / PID srptwvak target, identity `Tuya / TY0A01-TYZS5`.

## Fixed

- DP58/59/60 bitmap shards are 1-based: `(fragment - 1) * 8 + bit`. TYZS5 DP58 `01 0A 03 02` now gives IDs `1, 3, 17`, not `9, 11, 25`.
- DP93 now reports `face_id_list` / `face_id_count`, using the same parser. Legacy raw `update_all_face` is migrated once and cleared; fresh reports take precedence.
- Reject fragment 0 and malformed payloads, sort IDs and remove duplicates. UI descriptions now use hardware credential IDs consistent with observed local unlock and DP54/55 IDs.

## Validation and upgrade

Production-code regression passes supplied TYZS5 and stock TYZS3 captures, input variants, malformed data, duplicate shards and state migration. Stock TYZS3 captures are protocol evidence only, not support for TYZS3 firmware. DP93 is an observed report-only extension, not guaranteed on every lock.

The v1.2.1 baseline passed maintainer real-device regression. A new v1.2.2 real-device smoke test remains pending. Replace the external converter and restart Zigbee2MQTT. Wait for fresh credential sync to replace any already-decoded stale v1.2.1 lists. Confirm DP58 `010a0302` displays `1, 3, 17`; check other lists only where implemented.

No firmware reflash is required. The included HEX is byte-identical to alpha.1 (SHA-256 `9ce1fed4754caba18dc8ea3ffbd3bc7e2bca462c5a73f3214a6ea1678e73a6b6`). Firmware version and all control payloads/writable-DP policies are unchanged. DP39, DP68/69/70, DP205/OTA, FC00 production control and DP200 writer remain disabled.

Alarm and DP202 remain optional lock-MCU capabilities; an unsupported command may receive no response. Tuya Cloud/App compatibility is not retained. TYZS3 support is not included. Upstream-derived licensing remains unresolved; see NOTICE.md. SHA256SUMS.txt covers all packaged payload files.
