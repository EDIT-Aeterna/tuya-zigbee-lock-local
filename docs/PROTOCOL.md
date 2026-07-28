# MCU Serial Protocol

This is the UART protocol spoken between the lock's **MCU** (motor, keypad, fingerprint) and the
**Zigbee module** that sits on top of it. It's the standard vendor-style module↔MCU serial protocol
(spec version `20260408`) that these modules use out of the box.

This firmware implements the **module side** of it — `firmware/nicki_ek_lock_serial.c` is that
implementation. It keeps this exchange byte-for-byte identical to what the stock module did, so the
lock MCU behaves exactly as before, while the radio side is re-pointed at zigbee2mqtt instead of a
cloud gateway.

A lock only uses a small subset of the protocol — the setup, network-status, datapoint and
time-sync commands. The rest (GPIO, weather, scenes, production test) is documented here for
completeness but isn't exercised by a lock. Commands the firmware actually uses are marked **★**.

Throughout: **M** = MCU→module, **Z** = module→MCU. All multi-byte fields are **big-endian**
unless noted.

---

## 1. Physical layer

| Parameter | Value |
|---|---|
| Baud | **9600** or **115200** (auto-adapted at first boot, then fixed) |
| Format | 8 data bits, no parity, 1 stop bit |
| Voltage | 3.3 V |
| Wiring | TX + RX (standard power). Low-power parts add two wake pins. |

The module cycles 9600/115200 while sending the power-on product-info query (`0x01`); whichever rate
the MCU answers on is saved permanently. On the **TYZS3** module the UART is on **PA0 (TX) / PA1 (RX)**.
This firmware runs the link at **9600 8N1**, confirmed on hardware.

---

## 2. Frame format

```
55 AA | 02 | SEQ(2) | CMD | LEN(2) | DATA(LEN) | CHK
```

| Field | Offset | Width | Value |
|---|---|---|---|
| Header | 0 | 2 | `0x55 0xAA` (fixed) |
| Version | 2 | 1 | `0x02` |
| SEQ | 3 | 2 | sequence, increments |
| Command | 5 | 1 | command byte (§4) |
| Length | 6 | 2 | length `N` of DATA |
| Data | 8 | N | payload — **omitted entirely when N = 0** |
| Checksum | 8+N | 1 | see below |

**Checksum** = sum of every byte from the header up to and including the last data byte, mod 256:

```
chk = (0x55 + 0xAA + 0x02 + SEQ_hi + SEQ_lo + CMD + LEN_hi + LEN_lo + Σ DATA) & 0xFF
```

**Payload size:** 62 bytes max without sub-packeting; with sub-packeting, up to 120 received / 246 sent.

---

## 3. Datapoints (DP)

Application state travels as **datapoints**. A single DP message (the payload of `0x04`/`0x05`/`0x06`/
`0x2C`/`0x27`/`0x2A`) is one or more DP entries concatenated:

```
DP-ID(1) | TYPE(1) | LEN(2) | VALUE(LEN)   [ | next DP entry … ]
```

| Type | Name | Value width | Encoding |
|---|---|---|---|
| `0x00` | Raw | custom | raw bytes, per-DP meaning |
| `0x01` | Bool | 1 | `0x00` / `0x01` |
| `0x02` | Value | 4 | signed int, **4 bytes big-endian** |
| `0x03` | String | custom | text |
| `0x04` | Enum | 1 | `0x00`–`0xFF` |
| `0x05` | Bitmap | 1 / 2 / 4 | bit flags (fault codes etc.) |

A message may carry several entries, but **at most one Raw entry**, and a Raw entry can't be mixed
with others.

**Example** — DP 3, Bool, value 1:
`55 AA 02 xx xx 04 00 05 03 01 00 01 01 xx`

> **The lock's behaviour lives entirely in DPs.** Unlock events, battery, door state, alarms,
> temp-code create/delete, remote-unlock keys — all are product-specific DP IDs (defined on the
> vendor IoT platform for that lock model), carried as ordinary DP messages. The serial protocol itself
> has **no** lock-specific commands.

---

## 4. Command reference

### 4.1 Setup & identity

**★ `0x01` — Query product information (Z→M).** Sent by the module on every power-on; the MCU must
reply before anything else, and the reply also fixes the baud rate.
- Query: `55 AA 02 xx xx 01 00 00 xx`
- Reply DATA = product-info JSON, e.g. `{"p":"<pid>","v":"1.0.0","g":1,"s":1,"lp":1}`
  - `p` product ID · `v` MCU firmware `x.y.z` · `g:1` route group/multicast DPs via `0x2A` · `s:1` scenes · `lp:1` low-power.

**`0x07` — Query module information (M→Z).** DATA = one or more info IDs: `0x01` firmware version,
`0x02` authorization, `0x03` MAC (reply 8 bytes).

### 4.2 Network & pairing

**★ `0x02` — Network-status notification (Z→M).** DATA = 1 byte; MCU replies empty.

| Value | Meaning |
|---|---|
| `0x00` | not connected (fresh, failed pairing, or removed) |
| `0x01` | connected (joined a network) |
| `0x02` | network error (module never got product info from MCU) |
| `0x03` | pairing in progress |

> This is the key signal for a lock: the MCU only streams its unlock DPs once it believes it's
> **connected**. The firmware asserts connected state so the lock reports locally, with no cloud.

**★ `0x03` — Network config / reset (M→Z).** DATA = 1 byte: `0x00` module soft reset, `0x01` start
pairing. Module replies empty.

**★ `0x00` — Unbind & clear (Z→M).** After the device is removed in the app, module → MCU with DATA
`0x01`; MCU factory-resets its local data and echoes the frame.

**`0x20` — Query network status (M→Z).** Empty query; reply = 1 status byte (same table as `0x02`).

**`0x25` — Check gateway status (M→Z).** Reply: `0x00` offline · `0x01` online · `0x02` timeout.

**`0x26` — Configure network parameters (M→Z).** 14-byte payload: heartbeat interval (2), pairing
timeout (2), rejoin interval (2), poll interval (2), fast-poll (2), max poll failures (1), MCU-send-
triggers-rejoin (1), rejoin packets/round (1), TX power (1). Sentinels: 2-byte `0xFFFF` keep /
`0xFFFE` default; 1-byte `0xFF` keep / `0xFE` default. Reply `0x00` fail / `0x01` ok.

**`0x2B` — Configure wake wait time (M→Z, low-power).** 2-byte `T0` in ms (3–300, default 5).

### 4.3 Datapoints

**★ `0x04` — DP received (Z→M).** A DP arrived from the gateway/another device. MCU acks empty, acts,
and echoes the value back with `0x05`.
**`0x2A`** — same, for group control (only when `g:1` was set in `0x01`).

**★ `0x05` — DP response (M→Z).** MCU reports current DP state after a `0x04`. Reply `0x00`/`0x01`.

**★ `0x06` — DP report, may trigger linkage (M→Z).** MCU proactively reports a DP. Reply `0x00` failed /
`0x01` ok.
**★ `0x2C`** — same, but suppresses linkage/scenes. Recommended for status re-sync after power-on
(with a random 5–15 s delay).

**`0x28` — DP query (Z→M).** Gateway asks the device to report DPs; empty list = report all.

**`0x27` — Broadcast DP (M→Z).** Whole-network DP broadcast.

### 4.4 Time synchronization

**★ `0x24` — Time sync (M→Z).** The MCU asks for the time; the module answers with two 4-byte
big-endian Unix timestamps:

```
Reply DATA = STD_GMT(4) | LOCAL(4)
```

- **STD_GMT** = UTC seconds since 1970-01-01.
- **LOCAL** = local time (UTC ± timezone/DST already folded in).

There is **no separate timezone field** — only the two epoch values. Most devices use the LOCAL value
for their clock, which is why any time-windowed feature on the lock (e.g. temp-code validity) tracks
whatever the module puts in the LOCAL slot.

Example: `55 AA 02 xx xx 24 00 08 66 45 DB F0 66 46 4C 70 xx`.

### 4.5 MCU OTA

Firmware updates for the **lock MCU**, delivered through the module.

- **`0x0B` — MCU firmware version (Z→M).** Reply = 1 packed byte, bits `[7:6].[5:4].[3:0]` (e.g.
  `0x53` = 1.1.3, max 3.3.15).
- **`0x0C` — OTA notification (Z→M).** 17 bytes: PID(8) + new version(1) + size(4) + checksum(4).
- **`0x0D` — File request (M→Z).** MCU requests chunks: PID(8) + version(1) + offset(4) + size(1, ≤48).
  Reply = result(1) + PID(8) + version(1) + offset(4) + chunk.
- **`0x0E` — OTA result (M→Z).** result(1) + PID(8) + version(1). `0x00` success / `0x01` fail.

### 4.6 Other commands (not used by a lock)

Documented in the spec, present for completeness:

| Cmd | Dir | Purpose |
|---|---|---|
| `0x36`–`0x39` | M/Z | GPIO configure / read / output / interrupt |
| `0x3A` / `0x3B` | M / Z | weather query / notification (v1.2, flag byte `0x12`) |
| `0x41` `0x0A` `0x43` `0x42` | mixed | scene config / trigger, group DP / standard ZCL command |
| `0x4A` / `0x4B` | M | distributed (gateway-free) linkage control / DP config |
| `0x08` `0x29` `0x21` `0x22` | mixed | RF and dongle production testing |

---

## 5. Status & result codes

| Context | Values |
|---|---|
| Network status (`0x02`/`0x20`) | `0x00` not connected · `0x01` connected · `0x02` error · `0x03` pairing |
| Gateway status (`0x25`) | `0x00` offline · `0x01` online · `0x02` timeout |
| DP types | `0x00` Raw · `0x01` Bool · `0x02` Value(4B BE) · `0x03` String · `0x04` Enum · `0x05` Bitmap |
| Most reply results (`0x05`,`0x06`,`0x2C`,`0x27`,`0x26`,`0x2B`,`0x41`,`0x0A`) | `0x00` fail · `0x01` success |
| Distributed `0x4A`/`0x4B` results | `0x00` success · `0x01` failure *(inverted vs. the rest)* |
| OTA request/result (`0x0D`/`0x0E`) | `0x00` success · `0x01` fail |

---

## 6. Notes

- **Endianness:** every multi-byte field is big-endian — DP Value, Length, OTA offsets/size/checksum,
  timestamps, group IDs. The one documented exception is a production-test key ID (little-endian),
  which a lock never uses.
- **Firmware version is encoded two ways:** a dotted string `x.y.z` in the `0x01` product-info JSON,
  and a single packed byte in `0x0B`/OTA frames.
- **Heartbeat** isn't its own command — it's the interval configured in `0x26` (low-power parts send
  it; standard-power parts are polled by the gateway).
- **Lock features are DPs, not commands.** To read what a specific lock model exposes (unlock methods,
  temp codes, remote-unlock keys, records), you need that model's DP map, which is product-specific.
  The `zigbee2mqtt/` converter maps the DPs for this lock into Z2M.

*Reference: the standard module↔MCU serial protocol, spec version `20260408`.*
