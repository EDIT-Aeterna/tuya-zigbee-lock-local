# Flashing (manual pyOCD)

The [`flasher/`](../flasher/) tool does all of this with one click. This page is the manual
equivalent, for scripting or troubleshooting. Wire the module first — see [HARDWARE.md](HARDWARE.md).

Target name throughout: `efr32mg13p732f512gm48`.

## One-time setup

```bash
pip install --upgrade pyocd
pyocd pack install efr32mg13p732f512gm48
```

## Confirm the chip is reachable

```bash
pyocd cmd -t efr32mg13p732f512gm48 -f 1000000 -c "halt" -c "read32 0x0 0x8"
```

A successful halt plus a sane vector table (stack pointer in `0x2000xxxx`, reset vector in
`0x000xxxxx`) means SWD is alive. If it refuses, retry connect-under-reset with the manual
`nRST → GND` lead held low.

## Flash

```bash
pyocd flash -t efr32mg13p732f512gm48 -f 1000000 --erase chip kagel-lock.hex
```

`--erase chip` wipes the whole part first (this clears any debug lock and any stale pairing state),
then programs and verifies the image.

## Verify and reset

```bash
pyocd cmd -t efr32mg13p732f512gm48 -f 1000000 -c "reset halt" -c "read32 0x0 0x8"
```

The module now runs this firmware.

## After flashing

- A full chip-erase clears the module's Zigbee state, so the lock has to be **paired fresh**:
  open permit-join and put the lock into pairing.
- Install the [Zigbee2MQTT converter](../zigbee2mqtt/README.md) before pairing so the lock is
  recognised on first join.

## Restoring the stock firmware

If you kept a backup of the original module image (a full 512 KB read of `0x0`–`0x80000` before
you first erased), you can write it back the same way:

```bash
pyocd flash -t efr32mg13p732f512gm48 --format bin --base-address 0x0 stock-backup.bin
```

Always take that backup **before** the first erase — the stock firmware cannot be re-downloaded.
