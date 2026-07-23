# TYZS3 → Zigbee2MQTT Lock Firmware

Replacement firmware for the **TYZS3** (Silicon Labs **EFR32MG13P732**) Zigbee module used in
residential smart locks, so the lock pairs and runs **directly on zigbee2mqtt** — fully local,
with no proprietary gateway or cloud.

Out of the box a TYZS3 module only finishes pairing against its vendor's gateway/cloud. On a
generic Zigbee coordinator it joins the radio but never streams the lock's datapoints — unlock
events, battery, door and alarm state — so the lock is effectively dead to Zigbee2MQTT. This
firmware replaces the module firmware. On the wire to the lock's own MCU it speaks the same
serial protocol the stock module did (the lock MCU is left untouched and none the wiser); on the
radio side it presents a plain Zigbee EF00 device that Zigbee2MQTT reads with a small converter.

The result: fingerprint / password / card / remote unlocks, battery, door and alarm all flow into
Zigbee2MQTT locally, and one-tap remote unlock works from your own controller.

<img src="flasher/Module.jpeg" alt="TYZS3 module with SWD leads soldered on for flashing" width="440">

*The TYZS3 module (EFR32MG13), with SWD flying leads soldered on for flashing.*

## How it works

A TYZS3-based lock is two chips talking over a UART:

- the **lock MCU** — motor, keypad, fingerprint reader; speaks a fixed MCU serial protocol,
- the **TYZS3 Zigbee module** (EFR32MG13) — stock firmware bridges that UART up to the vendor cloud.

This firmware reflashes **only the module**. It keeps the MCU-side serial exchange byte-for-byte
identical, so the lock behaves exactly as before — but it answers the MCU's "am I online?" query
itself and forwards every datapoint over Zigbee EF00 to your own coordinator. No cloud in the loop.

```
  lock MCU  <—— UART (MCU serial) ——>  TYZS3 module (this firmware)  <—— Zigbee EF00 ——>  zigbee2mqtt
```

## Repository layout

| Path | What |
|---|---|
| [`firmware/`](firmware/) | Module firmware: portable C core + the EFR32 application layer, a prebuilt image (`kagel-lock.hex`), and build notes. |
| [`flasher/`](flasher/) | One-click Windows flashing tool (SWD via a Raspberry Pi Debug Probe / pyOCD), with an illustrated manual. |
| [`zigbee2mqtt/`](zigbee2mqtt/) | The external converter that makes Zigbee2MQTT recognise the lock, plus install steps. |
| [`docs/`](docs/) | Hardware wiring (SWD pinout) and the manual pyOCD flashing procedure. |

## Quick start

1. **Wire** the module to a Raspberry Pi Debug Probe over SWD — see [`docs/HARDWARE.md`](docs/HARDWARE.md).
2. **Flash** `firmware/kagel-lock.hex` — run `flasher/KagelLockFlasher.exe`, or follow
   [`docs/FLASHING.md`](docs/FLASHING.md) for the manual pyOCD commands.
3. **Install the converter** into Zigbee2MQTT — see [`zigbee2mqtt/README.md`](zigbee2mqtt/README.md).
4. **Pair** the lock (open permit-join) — it joins as a Kagel lock and its datapoints appear in Z2M.

## What you need

- The lock's **TYZS3** module (EFR32MG13P732, 512 KB flash).
- A **Raspberry Pi Debug Probe** (RP2040 CMSIS-DAP) — or any CMSIS-DAP probe pyOCD supports.
- A **3.3 V** supply for the module while flashing (the Debug Probe's DEBUG port supplies none).
- A Windows PC with Python + pyOCD (the flasher wraps these).

## Building from source

The firmware builds as a Zigbee SoC project in Simplicity Studio 5 against the Gecko SDK. The
prebuilt `kagel-lock.hex` is included so you can flash without building — see
[`firmware/BUILD.md`](firmware/BUILD.md) if you want to build it yourself.

---

© 2026 Nicki Eftekhari. All rights reserved.
