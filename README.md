# Tuya Zigbee Lock Local (TZLL)

Target: TYZS5 / EFR32MG13P732F512GM48 / PID `srptwvak` / Stage 2G-R2.
This repository is the local Tuya Zigbee lock firmware and integration project.
The canonical flash image is `studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex`.

Replacement firmware for the **TYZS5** (Silicon Labs **EFR32MG13P732**) Zigbee module used in
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

The MCU-side serial exchange is documented in full in [`docs/PROTOCOL.md`](docs/PROTOCOL.md).

## Repository layout

| Path | What |
|---|---|
| [`firmware/`](firmware/) | Module firmware: portable C core + the EFR32 application layer, a prebuilt image (`kagel-lock.hex`), and build notes. |
| [`flasher/`](flasher/) | One-click Windows flashing tool (SWD via a Raspberry Pi Debug Probe / pyOCD), with an illustrated manual. |
| [`zigbee2mqtt/`](zigbee2mqtt/) | The external converter that makes Zigbee2MQTT recognise the lock, plus install steps. |
| [`docs/`](docs/) | Hardware wiring (SWD pinout), the manual pyOCD flashing procedure, the [MCU serial protocol reference](docs/PROTOCOL.md), and the [over-the-air update guide](docs/OTA.md). |

## Quick start

1. **Wire** the module to a Raspberry Pi Debug Probe over SWD — see [`docs/HARDWARE.md`](docs/HARDWARE.md).
2. **Flash only** the canonical Stage 2G Studio HEX named above, following
   [`docs/FLASHING.md`](docs/FLASHING.md).
3. Install the separately maintained reviewer-approved converter; the bundled converter is reference/legacy only.
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

## Over-the-air updates (OTA disabled)

OTA/bootloader layout remains unresolved and disabled in this release. The firmware does not ship a usable
No OTA path is enabled.

- no usable OTA Upgrade cluster client in this release, and
- a **Gecko bootloader** (`firmware/kagel-lock-bootloader.s37`) that validates and flashes
  the new image on reboot.

The legacy OTA documentation is reference-only; the client does not download images into the
bootloader slot and reboots into it. A bad or interrupted image is rejected and the lock stays
on its current firmware, so an update can't brick it. Wrap a compressed image into a `.ota` with
`firmware/make-ota.js`. Full write-up — how it works end to end, the apply detail, and how to cut
a release — in [`docs/OTA.md`](docs/OTA.md).

---

© 2026 Nicki Eftekhari. All rights reserved.
