# TYZS3 initial-support guide — v1.1.0-alpha.1

[简体中文](tyzs3-guide.zh-CN.md)

## Identify and back up

Confirm the module marking/photo is TYZS3 and the chip is EFR32MG13P732F512GM48. The tested lock product binding is Tuya PID `ujcjk46o`, MCU `1.0.0`; PID is a product definition, not a module/protocol generation. An unknown TYZS3 lock is not automatically supported. Record original product info and board wiring before replacing firmware.

Before writing, take two identical full 524288-byte main-flash backups from the exact module, save SHA256 checksums offline and preserve USERDATA/manufacturing tokens separately. Do not share these private files in release packages. Confirm the stock layout and a rollback plan; see [flashing requirements](FLASHING.md). Never unlock a protected chip by erasing it.

## Install firmware

Select `firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex` in the release ZIP. Verify its SHA256 against the manifest. Do not use the TYZS5 image or old upstream HEX. Program and verify with the maintainer's reviewed setup after backup/layout review; do not perform mass erase, install a bootloader or use legacy one-click helpers.

The internal build remains `tools/build_tyzs3.ps1` / `studio/tyzs3-candidate`. The release filename does not change runtime behavior: module diagnostic version remains `T3-1`, EM2 disabled, EM1 retained. OTA is disabled. The new Basic identity is `Tuya / TY0A01-TYZS3`.

## Install Zigbee2MQTT integration and pair

1. Back up Zigbee2MQTT configuration and the active converter.
2. Extract `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js` from the release ZIP. It is converter v0.1.0, initial validated integration. Remove/disable the old `_candidate.js` definition and any other definition matching this fingerprint.
3. Install the file through the external-converter mechanism supported by your deployed Zigbee2MQTT version. The existing [converter installation guide](zigbee2mqtt-guide.md) documents the maintainer's setup. Retain CommonJS `.js`; do not merely rename it `.mjs`. Confirm successful loading after restart.
4. Enable permit-join on the coordinator and invoke the lock's established local pairing procedure; no universal key sequence is assumed. Check `Tuya / TY0A01-TYZS3` and complete pairing/rejoin.
5. Cold boot and capture product info to confirm `ujcjk46o / 1.0.0`. Firmware accepts pure JSON or JSON plus a final 0/1 OTA capability byte. Unknown/unverified PID permits telemetry only; malformed/wrong/missing PID blocks control until reboot. Do not bypass this gate.
6. With the door open and physical fallback available, confirm time, actions, battery and fresh lists; then explicitly test one DP21 action, a sacrificial DP54 enrollment and DP55 deletion. Do not delete existing household credentials as a test.

The original SmartHomePlus / LCK-BI400 converter is legacy/reference only, not for this firmware. Do not load multiple definitions for the same identity.

## Features and diagnostics

Supported writes are only DP21 remote password unlock, DP54 credential enrollment and DP55 deletion. Use explicit structured controls; DP21 stages exactly six ASCII digits before one execute operation. Device-side verification still applies. Never put real passwords in logs or public reports.

Tested reports include fingerprint/password/card/face actions, battery and DP58/59/60/93 lists. `00 00` means empty list/count zero. Bitmap IDs use `(shard - 1) * 8 + bit`; wait for fresh sync if cached lists are stale. DP93 is an observed/validated face-list extension. Optional alarms and other sensors depend on the lock MCU.

Converter dispatch/status fields are diagnostic. A Zigbee command dispatch does not prove lock-MCU execution; check the result and physical outcome before retrying. DP204 is module diagnostic version, not lock-MCU product-info version.

## Limitations and rollback

Periodic temporary-password management is not exposed: stock transport was observed, but stored periodic passwords did not unlock the tested device. One-time temporary passwords and freeze/unfreeze are not exposed; tested stock DP27 received no MCU response. DP48/49 are disabled despite observed stock layout. No DP24–28,39,48/49,68–70,200,202,205/OTA or FC00 writes.

Stock dynamic passwords work through proprietary SecKey validation; TZLL does not implement it, so dynamic passwords are unsupported after flashing. Tuya Cloud/App compatibility is not retained. No OTA. Initial EM1 support does not promise mature battery life or universal lock compatibility.

To roll back, stop operations, verify your exact-device stock backup checksum and restore that main-flash image with verification using the reviewed procedure in [FLASHING.md](FLASHING.md). Preserve USERDATA and original backups. Module rollback cannot undo lock-MCU credential changes.

See [binding details](lock-profiles/ujcjk46o.md), [baseline](TYZS3_KNOWN_GOOD_BASELINE.md) and [validation](TYZS3_VALIDATION_v1.1.0-alpha.1.md).
