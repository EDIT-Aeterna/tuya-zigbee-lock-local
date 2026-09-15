# Changelog

## [1.0.0-alpha.1] - 2026-09-15

First public TZLL TYZS5 release with validated firmware, production converter v1.2.1 and local Home Assistant/Zigbee2MQTT integration. Stable v1.2.1 real-device regression passed for the tested TYZS5 target. Canonical identity is `Tuya / TY0A01-TYZS5`. DP39, DP68/69/70 and OTA remain disabled; TYZS3 is not included. Licensing of upstream-derived code is still being clarified.

### Compatibility

- Lock-MCU feature availability varies by lock model even when the Zigbee module is compatible.
- Alarm and DP202 power/work-mode controls are optional and are not guaranteed on all supported locks.
- This documents observed compatibility differences, not a firmware regression; executable behavior is unchanged.

## Stable converter v1.2.1 candidate integration

- Add reviewer candidate unchanged as `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`.
- Restrict fingerprint to Tuya / TY0A01-TYZS5.
- Use reviewer's removal of FC00 claim/auth, auth mappings 226/227/230 and stale DP200 writer.
- Preserve structured DP21,24-28,48/49,54/55,202 behavior; DP58/59/60 remain read-only; DP39,68-70,205/OTA remain disabled.
- Move the former converter to legacy/reference and update installation guidance.
- No firmware or payload changes. Stable v1.2.1 real-device regression passed for the tested TYZS5 target; TYZS3 and untested lock models are not covered.

## Repository migration

- Reorganized as TZLL.
- Preserved reviewed TYZS5 srptwvak Stage 2G-R2 firmware and Basic Identity Migration.
