# TYZS3 initial support: tested product binding ujcjk46o

Tuya Product ID `ujcjk46o`, lock MCU `1.0.0`, module TYZS3 / EFR32MG13P732F512GM48. Zigbee identity: `Tuya / TY0A01-TYZS3`. PID identifies a product definition, not a module/protocol family. Internal `lock_profile_ujcjk46o` naming is retained without an architectural refactor.

## Validated surface

DP21 remote password unlock, DP54 credential enrollment and DP55 deletion are the only writable controls. Fingerprint/password/card/face events, battery and credential lists are maintainer-validated. Alarm and other optional lock reports are usable only if the lock MCU implements them. A matching module alone does not guarantee matching features.

Firmware requires a valid matching PID before any lock-control write. Unknown/unverified PID allows reads/reports but denies writes. Wrong/missing/malformed PID information latches rejection until reboot; a subsequent matching reply cannot clear it. Product info accepts pure JSON and JSON followed immediately by a 0x00/0x01 OTA capability byte. The existing one deferred retry after complete MCU activity is retained. Capability reporting does not enable OTA.

## Narrow DP54 compatibility quirk

For this binding only, the observed initial Cmd05 stage-0 report has outer data length 13, DP54 declared length 7, actual payload length 9. Only the specific known structure is normalized. Other reports retain strict complete-payload parsing; this is not a global parser relaxation.

## Credential lists

One-based bitmap shards use `ID = (shard - 1) * 8 + bit`.

| Report | Bytes | IDs |
|---|---|---|
| TYZS5 DP58 reference | 01 0A 03 02 | 1, 3, 17 |
| TYZS3 DP58 fingerprint | 01 04 02 6C | 2, 10, 11, 13, 14 |
| TYZS3 DP59 password | 01 01 02 80 | 0, 15 |
| TYZS3 DP60 card | 02 10 03 01 | 12, 16 |
| TYZS3 DP93 face | 02 40 | 14 |
| TYZS3 empty list | 00 00 | empty / count 0 |

DP93 is an observed/validated Zigbee extension for face credential ID synchronization. We do not claim the older public household-lock DP table explicitly assigns numeric DP93. The exact `00 00` sentinel is accepted; other shard-zero data remains invalid.

## Known stock behavior and unsupported TZLL features

- Periodic temporary passwords: stock DP24/26 transport accepted and DP25 format/result observed, but the stored periodic password did not unlock the tested lock. Not exposed by TZLL initial TYZS3 support.
- Freeze/unfreeze: stock DP27 reaches the MCU without a response on the tested device. Neither DP27 nor DP28 is exposed.
- One-time temporary password: not exposed by the original Tuya App for this product; not exposed by TZLL.
- Dynamic password: works in stock firmware through Cmd07. Unsupported after TZLL flash because the proprietary Tuya SecKey validation mechanism is unavailable. This is a missing proprietary capability, not a common-layer regression. No algorithm is guessed.
- DP49 stock request layout is observed, but DP48/49 remain disabled in initial support.
- No writes for DP24–28, DP39, DP48/49, DP68–70, DP200, DP202, DP205/OTA or FC00.
- Alarm, work/power mode, door sensing and inside-handle sensing depend on the lock MCU; none is promised universally.
- EM2 remains disabled, retaining the validated conservative EM1 policy. Battery-life behavior is not declared mature. OTA and standalone bootloader installation are unsupported. Tuya Cloud/App integration is not retained.

See [known-good baseline](../TYZS3_KNOWN_GOOD_BASELINE.md) and [user guide](../tyzs3-guide.md).
