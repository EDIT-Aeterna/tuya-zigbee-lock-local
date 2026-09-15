# Remote unlock protocol profiles

## Stage 2E-B DP49 password-free unlock

The explicit narrow control mode permits DP21, DP48, and DP49 only. DP49 is
one 13-byte RAW unit: state=1, key_id=1, eight ASCII digits, method=0x0001.
The complete EF00 payload is atomically validated before exactly one MCU
command. No key is generated, stored, printed, cached, retried, or resent.

## Password mode (Stage 2D-R)

Only `DP21` is accepted from Zigbee control. The value is exactly six ASCII
digits. The firmware forwards one RAW DP21 application command to the lock MCU.
The `0x04` response is a transport acceptance ACK only. Final business result is
reported by `DP22=true` or `DP22=false`; `DP41` remains an audit record.

## Password-free mode (disabled)

Target `DP48` is a 21-byte key-provisioning profile:
`enable(1), key_id(2), valid_from(4), valid_to(4), use_count(2), key(8)`.
Target `DP49` is a 13-byte request:
`state(1), key_id(2), key(8), method(2)`; response is 3 bytes.
These profiles remain documentation only. DP48 and DP49 are rejected by the
Stage 2D-R control gate. Stage 2E-A now permits the separate narrow DP48
provisioning profile below; DP49 remains disabled.

## Stage 2E-A DP48 provisioning

DP48 is one 21-byte RAW unit: `enable=1`, `key_id=1`, `valid_from < valid_to`,
`use_count=0xFFFF`, and an 8-byte ASCII digit key. The bridge validates this
shape and forwards it once; it does not generate, print, cache, or persist the
key. A same-key-id request may replace the active key in the lock MCU. DP48
result reports remain telemetry; the command ACK is not business success.
