# Changelog

## Stable converter v1.2.1 candidate integration

- Add reviewer candidate unchanged as `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`.
- Restrict fingerprint to Tuya / TY0A01-TYZS5.
- Use reviewer's removal of FC00 claim/auth, auth mappings 226/227/230 and stale DP200 writer.
- Preserve structured DP21,24-28,48/49,54/55,202 behavior; DP58/59/60 remain read-only; DP39,68-70,205/OTA remain disabled.
- Move the former converter to legacy/reference and update installation guidance.
- No firmware or payload changes. Candidate runtime/device regression remains pending.

## Repository migration

- Reorganized as TZLL.
- Preserved reviewed TYZS5 srptwvak Stage 2G-R2 firmware and Basic Identity Migration.
