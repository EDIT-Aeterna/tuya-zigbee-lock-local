# TYZS5 Lock Port - Phase 1 Protocol Report

Date: 2026-09-09 (Asia/Shanghai)

Status: Stage 1.1 target evidence closure complete; Stage 2 has not started.

Evidence profiles are explicit: `GENERIC_TUYA` is the general protocol
reference, `TARGET_SRPTWVAK` is the DHO924 target lock truth for compatibility,
and `REFERENCE_2EQDQLQ2` is reference SDK/Debug JSON evidence only. The
`2eqdqlq2` PID and product-specific fields are not silently applied to
`srptwvak`.

## 1. Scope and evidence rule

This phase is limited to offline protocol analysis, portable parser changes,
fixtures, and host tests. No hardware was connected, erased, flashed, or
written. No EFR32 GPIO, RF, sleep, Zigbee application, flasher, binary, OTA,
bootloader, or linker layout was changed.

Evidence is applied with an explicit conflict rule:

1. For `srptwvak` target-specific behavior, the captured DHO924
   `TARGET_SRPTWVAK` evidence is the compatibility truth. This includes the
   target DP24/DP49 layouts, DP54 report sequence, product-info response, time
   offset, and same-sequence `0x06/0x10` handling.
2. For framing and fields that are not contradicted by target evidence,
   Tuya's official generic MCU docking protocol remains primary.
3. The official Zigbee residential-lock DP reference defines the application
   DP meaning where applicable.
4. `REFERENCE_2EQDQLQ2` SDK/debug material is reference evidence only; its
   PID-specific behavior is not promoted to `srptwvak`.
5. Existing upstream source is used only where it does not conflict with the
   stronger evidence above.

The DP reference supplied for this phase is the official Tuya page:
[Zigbee residential-lock DP reference](https://developer.tuya.com/cn/docs/iot/zigbee-doorlock-dp?id=K9fembhbeab0p).

Local reference hashes are recorded in `docs/REFERENCE_MATERIAL.md` and the
original image hashes are recorded in `docs/BACKUP_MANIFEST.md`.

## 2. Frame format

The verified frame is:

```text
55 AA | version | sequence(2, big endian) | command | data length(2, big endian) | data | checksum
```

- Header: `0x55 0xAA`.
- Current official protocol version: `0x03`.
- Sequence, length, timestamps, and other multi-byte values are big endian.
- Data length is `0..256` in this portable core.
- Total frame length is `9 + data_length`.
- Checksum is the sum of every byte from `0x55` through the final data byte,
  reduced modulo 256.
- A wake transaction has seven `0x00` bytes before the frame. Those bytes are
  a wake preamble, not part of the frame checksum or data length.

`tls_decode_frame()` now rejects unsupported versions, truncated frames,
length mismatches, checksum errors, and trailing bytes. The stream decoder
recovers after noise, corrupt frames, partial frames, and concatenated frames.

## 3. Sequence and wake behavior

Normal replies preserve the sequence from the MCU request. This is required for
the official command replies and is tested for network status, time, configure,
DP report, and record commands.

The generic wake examples use fixed sequences:

- module to MCU wake: sequence `0x55AA`, command `0x00`, empty data;
- MCU to module wake: sequence `0x0000`, command `0x00`, empty data;
- the response echoes the same fixed sequence.

The SDK contains an older active-wake path using `0x9999`; this conflicts with
the current generic protocol example. The portable core follows the generic
protocol value `0x0000` for an MCU-initiated wake and does not treat the
module's `0x55AA` response as a new wake request.

The official timing rules say a wake ACK is expected within 20 ms and a
command exchange normally has a 500 ms response window, with two retries after
the initial transmission. The current core proves the seven-byte preamble and
the three-write retry count, but its application tick timing and pending queue
policy are not release evidence. Timing cleanup is listed as a proposed Phase 2
change.

## 4. Command map

| Command | Direction / use | Phase 1 conclusion |
|---|---|---|
| `0x00` | wake | fixed-sequence wake handshake; seven-byte zero preamble |
| `0x01` | product information | request is empty; reply contains product JSON and OTA flag |
| `0x02` | network status query | reply uses command `0x02`, same sequence, one status byte |
| `0x03` | reset, pairing, factory-reset notification | reply uses same command and sequence, one result byte |
| `0x04` | module to MCU DP command | DP units are carried in the data field |
| `0x05` | MCU to module DP report | ACK uses same command and sequence; `0x10` is transfer success |
| `0x06` | module network status notification | status table includes `0x00..0x05`; official examples use one data byte |
| `0x07` | dynamic password verification | GMT timestamp, eight-digit password, admin groups |
| `0x08` | offline password verification | GMT timestamp followed by a 7..10 digit password |
| `0x20` | legacy/query network path in supplied SDK | retained as an identified command; target use needs capture |
| `0x23` | timestamped DP record | five-byte time prefix followed by DP units |
| `0x24` | time synchronization | MCU request is empty; module returns standard and local timestamps |
| `0x25` | gateway-status query in supplied source | sequence-preserving result path retained; target use needs capture |
| `0x26` | network-configuration notification | result path retained; target use needs capture |
| `0x2B` | wake-wait configuration | result path retained; target use needs capture |

The current source's `0x06` comment records an ambiguity between the generic
protocol's proactive notification and the older MCU source's use of the same
command. No new Zigbee behavior was added to resolve it.

## 5. DP units and relevant DP schemas

Each DP unit is:

```text
dp_id(1) | type(1) | value_length(2, big endian) | value(value_length)
```

The strict parser requires complete units and rejects a truncated unit or
trailing bytes. Important official mappings used in this phase are:

| DP | Type / command | Confirmed schema |
|---|---|---|
| 1..7 | value, record `0x23`, 4 bytes | unlock method and key/fingerprint/face values |
| 8 | bool, record `0x23`, 1 byte | door opening/closing event |
| 21 | raw, command `0x04`, 6 bytes | legacy six-digit password remote unlock |
| 24 | raw, command `0x04` / report `0x05` | temporary-password create, 21-byte request and 7-byte result |
| 25 | raw, command `0x04` / report `0x05` | temporary-password delete, 6-byte request and 7-byte result |
| 26 | raw, command `0x04` / report `0x05` | temporary-password update; create layout |
| 27/28 | raw, command `0x04` / report `0x05` | freeze/unfreeze; reference layout |
| 39 | raw, `0x04` / `0x05` / record `0x23` | clear temporary passwords; reference/result layout |
| 48 | raw, command `0x04` / report `0x05` | password-free key set, 21-byte request and 3-byte result |
| 49 | raw, command `0x04` / report `0x05` | password-free unlock command, 15-byte request and 3-byte result |
| 54 | raw, command `0x04` / report `0x05` | add unlocking method |
| 55 | raw, command `0x04` / report `0x05` | delete unlocking method |
| 61 | bool | single-use-password cloud feature flag |

The web reference describes DP values and command direction. It does not prove
that the target TYZS5 firmware implements every listed DP.

## 6. Temporary password fields

### TARGET_SRPTWVAK profile

DHO924 target captures establish a 27-byte DP24 value:

```text
prefix(6) | start timestamp(4) | end timestamp(4) |
unknown/reserved target field(6) | one-time(1) | password(6 ASCII digits)
```

The six-byte field remains intentionally unnamed. The production
`tls_build_temp_pw()` emits this target order and is tested byte-for-byte.
The generic 21-byte layout below remains a separate evidence profile.

### GENERIC_TUYA profile

The official generic DP24 create/update value is exactly 21 bytes:

```text
Tuya sequence(2) | server sequence(2) | manufacturer ID(2) |
start standard timestamp(4) | end standard timestamp(4) |
one-time flag(1) | password, six ASCII digits(6)
```

DP25, DP27, DP28, and DP39 reference requests are six bytes:

```text
Tuya sequence(2) | server sequence(2) | manufacturer ID(2)
```

The common report is seven bytes: the six-byte reference followed by a result
byte. DP24 result values are documented as failure, success, duplicate, and
full (`0..3`); the other DP-specific result meanings remain attached to the DP
reference.

The generic layout remains available for reference parsing and is not used as
the `srptwvak` production encoder.

## 7. Password-free key fields

The official DP48 request is 21 bytes:

```text
enabled(1) | key ID(2) | start timestamp(4) | end timestamp(4) |
use count(2) | key content(8)
```

The `GENERIC_TUYA` DP49 request is 15 bytes:

```text
open/closed state(1) | key ID(2) | key content(8) | unlock method(4)
```

The documented DP49 method values are remote, mobile phone, voice, and
geofencing (`0..3`). The documented MCU result is three bytes: status plus the
two-byte key ID. The parser validates the structural length and method range;
it does not claim that the target's key storage or comparison algorithm is
implemented.

The `TARGET_SRPTWVAK` DP49 request is 13 bytes. Its observed value is
`01 00 01`, eight ASCII digits, and a two-byte trailing field whose meaning is
opaque. The target response value is three bytes `00 00 01`. The generic
15-byte parser remains a separate profile and does not silently accept both
lengths.

## 8. DP54 and DP55 credential fields

The target DP54 request matches the generic seven-byte schema. Target reports
show stages `00 -> FC -> FF`, hardware ID `0x0010`, and report byte zero `0x03`
for an operation explicitly started as an APP long-term ordinary-password
enrollment. That byte remains raw and semantically unresolved; it is not
relabelled as fingerprint.

DP54 add request values are seven bytes:

```text
type(1) | enrollment stage(1) | administrator flag(1) |
member ID(2) | hardware ID(2)
```

DP54 MCU reports add two bytes to that layout: enrollment index and result.
The documented enrollment stages include start (`0x00`), cancel (`0xFE`),
failure (`0xFD`), in progress (`0xFC`), and complete (`0xFF`).

DP55 delete request values are eight bytes:

```text
type(1) | stage(1) | administrator flag(1) | member ID(2) |
hardware ID(2) | delete method(1)
```

DP55 reports add one result byte. The delete method is all methods (`0x00`) or
one method (`0x01`); documented report values include failure (`0x00`),
success (`0xFF`), ID absent (`0x01`), and ID not deletable (`0x02`).

The current parser is structural and preserves all fields. It does not start a
credential operation or synthesize a report in the application layer.

## 9. Dynamic password

The official `0x07` request starts with a four-byte GMT timestamp and an
eight-byte ASCII password. It then contains an admin count followed by
length-prefixed ASCII admin passwords. The generic protocol requires a request
of at least 15 bytes and allows up to ten admin groups. The parser validates
the lengths, digit contents, group count, and exact end of the payload.

No SecKey algorithm is implemented in this phase. A structurally valid request
therefore remains a `no SecKey` result path; malformed data returns the
documented length-error path. This is protocol validation, not a claim that a
dynamic password can unlock the target.

## 10. Record and time synchronization

The official record `0x23` prefix is always five bytes:

```text
time source flag(1) | timestamp(4, big endian) | DP units...
```

Flag `0` means use gateway time and flag `1` means use MCU time. The timestamp
is present in both cases. The current parser now follows this fixed offset and
ACKs a valid report with `0x10` using the request sequence.

The official `0x24` reply is eight bytes:

```text
standard GMT timestamp(4) | local timestamp(4)
```

The portable core computes local time as GMT plus the supplied timezone/DST
offset. The target exchange proves `local - GMT = 28800` seconds, so the
application provider is configured for mainland China UTC+8 with no DST. The
target product-info response uses sequence `0x3377` for a request at `0x0002`;
this command-specific rule does not change same-sequence ACK handling.

## 11. Target srptwvak deviations from generic Tuya protocol

| Area | GENERIC_TUYA | TARGET_SRPTWVAK | Decision |
|---|---|---|---|
| DP24 | 21-byte RAW | 27-byte RAW | target-specific production builder; generic parser retained |
| DP49 | 15-byte RAW | 13-byte RAW request, 3-byte response | distinct target profile; trailing bytes opaque |
| DP54 report byte 0 | generic type mapping | observed `0x03` for ordinary-password enrollment | preserve raw; unresolved semantic |
| Product-info sequence | examples may echo request | response `0x3377` for request `0x0002` | command-specific rule |
| Time sync | supplied offset | local = GMT + 28800 | target provider uses UTC+8 |
| 0x06 ACK | generic table ambiguity | same-sequence `0x06/0x10` | consume silently |

`REFERENCE_2EQDQLQ2` remains reference evidence only and does not override
these target deviations.

## 12. Conflicts and limits

The following conflicts remain explicit and were not hidden by the Phase 1
changes:

1. `docs/PROTOCOL.md` retains stale version `0x02` and 9600-baud text, while
   the official current generic protocol, supplied SDK, and current serial
   header support version `0x03` and 115200 8N1.
2. The supplied SDK uses `0x9999` in one active wake path; the current generic
   wake example uses `0x0000`. Phase 1 follows the generic example and records
   the SDK path as a conflict.
3. The generic command table has a version/length inconsistency around command
   `0x05`/`0x06`; the executable examples and SDK use version `0x03` and a
   one-byte `0x06` status, which is the basis for the portable parser.
4. The old hand-transcribed DP49 sample ending in `0x4E` is retained only as a
   historical transcription-error regression fixture; the target golden ends
   in `0x4D`.
5. The repository has no Studio project or linker output. The OTA/bootloader
   address contradiction remains release-blocking. No app base, bootloader
   model, NVM3 placement, or image layout was guessed or changed.

## 13. Required hardware captures

The three Stage 1.1 core captures are now resolved by target goldens:

- DP49 target request and response;
- first DP54 password-enrollment command and report sequence;
- complete target time-sync request and response.

Normal-password and card records are also resolved. Remaining uncertainty is
limited to explicitly opaque target fields. Offline-password cryptographic
behavior remains unvalidated; only its documented structure is tested.

## 14. Stage 1.1 implementation and tests

Changed portable protocol files:

- `firmware/nicki_ek_lock_serial.h`
- `firmware/nicki_ek_lock_serial.c`
- `firmware/lock_app.c`
- `firmware/host_selftest.c`

Added offline evidence and tests:

- this report;
- `tests/run_fixtures.py`;
- categorized files under `tests/fixtures/`, including target and generic profiles.

The host self-test covers checksum, strict frame decoding, partial and
byte-by-byte reassembly, concatenated frames, noise, bad checksum recovery,
zero wake preambles, fixed wake sequences, same-sequence ACKs, DP parsing,
DP24 generic/target schemas, DP48/49/54/55 schemas, dynamic/offline-password
structure, record timestamps, target UTC+8 time sync, silent 0x06 ACK handling,
and malformed inputs.

Commands used:

```text
gcc -std=c99 -Wall -Wextra -Werror firmware/host_selftest.c firmware/nicki_ek_lock_serial.c -o /tmp/tyzs5_selftest.exe
/tmp/tyzs5_selftest.exe
python tests/run_fixtures.py
```

Results:

```text
AUDIT RESULT: 0 failure/blocker(s)
ALL PASS (0 failures)
FIXTURES: 35 passed, 0 failed, 0 awaiting hardware
```

Fixture disposition: generic official fixtures remain under the original
category paths; target goldens are under `tests/fixtures/target_srptwvak/`.
The historical `0x4E` transcription is retained only as a malformed regression
case. Failed fixtures: none.

## 15. Proposed Phase 2 changes

These are proposals only and were not performed:

- resolve the remaining target opaque-field semantics before assigning names;
- implement SecKey/dynamic-password behavior only with approved target
  evidence and a security review;
- reconcile wake timing, retry timing, and queue semantics against a target
  capture;
- resolve the Studio/linker/bootloader/NVM3 layout from the actual project
  outputs;
- only after those approvals, evaluate target-specific EFR32 and Zigbee
  changes.

Stage 1.1 stops here and waits for review. No Phase 2 work was started.
