# Changelog

## [1.2.0-alpha.1] - 2026-09-20

Prepared for maintainer review and manual publication.

- Added TYZS5 and TYZS3 Monitor Edition, with independent hardware-validated read-only Zigbee2MQTT definitions.
- Added compile-time CONTROL / MONITOR policy; Monitor has an empty external writable-DP surface.
- Preserved Control behavior and exact validated write policies.
- Separated Product Binding from neutral Capability Profile and added orthogonal Access Edition.
- Added four-variant shared-source builds, edition documentation and tests.
- Maintainer real-device validation passed for both Control targets and both Monitor firmware/converter combinations. Release preparation checks byte identity against those artifacts.
- Monitor is recommended for status/events-only use; capabilities remain lock-dependent. Dynamic password/SecKey unsupported; OTA disabled; this remains alpha.

## [1.1.0-alpha.1] - 2026-09-17

Prepared for maintainer review; not automatically tagged or published.

### Added

- Initial hardware-validated TYZS3 support: Tuya / TY0A01-TYZS3, tested product binding ujcjk46o / MCU 1.0.0.
- TYZS3 converter v0.1.0 with only structured DP21/54/55 writes; canonical non-candidate filename.
- Shared firmware core and dual-target builds, verified-PID write gate, narrow ujcjk46o DP54 stage-0 malformed-length compatibility and observed DP93 face credential sync.
- Bilingual TYZS3 guides, known-good baseline, profile limitations and release validation evidence.

### Fixed / changed

- Common product info accepts pure JSON and JSON plus a final 0x00/0x01 OTA byte, retaining fail-closed PID verification.
- One-based credential shards remain unchanged. TYZS3 converter accepts the exact `00 00` empty-list sentinel; other shard-zero data stays invalid.
- Maintainer-validated firmware and TYZS5 Stable v1.2.2 converter behavior are preserved during T3-2. No new write controls, power changes or OTA enabled.

### Known limitations

TYZS3 initial support does not expose periodic/one-time temporary passwords, freeze/unfreeze or DP48/49. Stock dynamic passwords are unavailable after TZLL flash without proprietary SecKey validation. Optional alarm/sensor/mode capabilities remain lock-MCU dependent. EM2 remains disabled. No OTA, Tuya Cloud/App or universal TYZS3 compatibility claim. Historical stale reviewer conflicts are recorded, not rewritten.

## [1.0.0-alpha.2] - 2026-09-16

Converter Stable v1.2.2; converter-only correctness patch, firmware unchanged.

### Fixed

- Corrected DP58/59/60 bitmap indexing to verified one-based shards; IDs are `(fragment - 1) * 8 + bit`.
- Added read-only DP93 face list/count, one-time raw-cache migration and duplicate-ID removal.
- Reject fragment zero; remove misleading separate +8-shifted ID-space descriptions.

### Validation

- Production parser and decoder tested with real TYZS5 DP58 and stock TYZS3 DP58/59/60/93 capture vectors, malformed inputs, duplicate shards and migration precedence.
- Write-control paths and firmware unchanged. TYZS3 captures are protocol evidence, not TYZS3 firmware support.
- New v1.2.2 real-device smoke test remains pending; this release is a prerelease.

## [1.0.0-alpha.1] - 2026-09-15

First public TZLL TYZS5 release with validated firmware, production converter v1.2.1 and local Home Assistant/Zigbee2MQTT integration. Stable v1.2.1 real-device regression passed for the tested TYZS5 target. Canonical identity is `Tuya / TY0A01-TYZS5`. DP39, DP68/69/70 and OTA remain disabled; TYZS3 is not included. Licensing of upstream-derived code is still being clarified.

### Compatibility

- Lock-MCU feature availability varies by lock model even when the Zigbee module is compatible.
- Alarm and DP202 power/work-mode controls are optional and are not guaranteed on all supported locks.
- This documents observed compatibility differences, not a firmware regression; executable behavior is unchanged.

## Stable converter v1.2.1 integration

- Add reviewer candidate unchanged as `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`.
- Restrict fingerprint to Tuya / TY0A01-TYZS5.
- Use reviewer's removal of FC00 claim/auth, auth mappings 226/227/230 and stale DP200 writer.
- Preserve structured DP21,24-28,48/49,54/55,202 behavior; DP58/59/60 remain read-only; DP39,68-70,205/OTA remain disabled.
- Move the former converter to legacy/reference and update installation guidance.
- No firmware or payload changes. Stable v1.2.1 real-device regression passed for the tested TYZS5 target; TYZS3 and untested lock models are not covered.

## Repository migration

- Reorganized as TZLL.
- Preserved reviewed TYZS5 srptwvak Stage 2G-R2 firmware and Basic Identity Migration.
