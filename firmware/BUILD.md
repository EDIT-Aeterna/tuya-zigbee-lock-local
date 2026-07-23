# Building the firmware

You only need this if you want to change the firmware. A prebuilt image, `kagel-lock.hex`, is in
this folder — flash that and skip the build.

## Source layout

The code is split so the hard part (the MCU serial protocol) is portable and host-testable, and
only the thin hardware layer needs the Silicon Labs SDK.

| File | Layer |
|---|---|
| `nicki_ek_lock_serial.c/.h` | Portable module-side MCU serial core — frame codec, datapoint parse, boot/online handshake, time sync. Pure C99, HAL-abstracted. |
| `lock_app.c/.h` | Portable application logic that ties the serial core to the radio. |
| `efr32_app.c` | EFR32MG13 hardware layer — USART, NVM3, sleeptimer, Zigbee EF00 join + telemetry. |
| `app.c` | Zigbee stack callbacks (routes incoming cluster traffic, auto-joins). |
| `host_selftest.c` | Host tests for the serial core — no hardware needed. |

## Host tests (no hardware)

```
cc -std=c99 -Wall -Wextra host_selftest.c nicki_ek_lock_serial.c -o selftest && ./selftest
```

## On-device build (Simplicity Studio 5)

The EFR32MG13 is a Series-1 part. The 2025 *Simplicity SDK* dropped Series-1 Zigbee, so install the
**Gecko SDK Suite 4.5.x** (which still has MG13 Zigbee) via *Manage SDKs*.

1. Create a **Zigbee – SoC** project for target **EFR32MG13P732F512GM48**, Custom Board.
2. Add the five `.c/.h` files above to the project. Call `kagel_app_init()` from the generated
   `app_init`, and `kagel_app_tick()` from the main loop.
3. Components to add: NVM3, IO Stream (USART), Network Steering, and the manufacturer-specific EF00
   cluster send path. On a custom board, add **IO Stream: Dummy** to satisfy the recommended-stream
   check, and set the Simple LED `LED0` port/pin directly in its generated config header.
4. Advertise the lock identity in the Basic cluster (`zcl_config.zap`): manufacturer name
   `SmartHomePlus`, model identifier `LCK-BI400`. These must match the Zigbee2MQTT converter.
5. Build. The output `kagel-lock.hex` (Intel HEX) is what the flasher and pyOCD use.

## Headless rebuild

Once the Studio project exists, `rebuild-firmware.bat` (in `../flasher/`) shows the exact
`make` invocation using the toolchain bundled with Simplicity Studio — a header-only change
rebuilds in a few seconds without opening the IDE. Adjust the paths at the top of the batch file
to match your workspace.

## Confirm the UART baud

`efr32_app.c` runs the MCU link at **9600 8N1**, confirmed on real hardware. If a unit differs,
change `LOCK_BAUD`.
