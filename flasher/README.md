# Kagel Lock Flasher

A one-click Windows tool that flashes the firmware onto a TYZS3 module over SWD, using a Raspberry
Pi Debug Probe and pyOCD. It runs the exact chip-erase → program → verify → reset sequence, so you
don't touch the command line.

Wire the module first — see [`../docs/HARDWARE.md`](../docs/HARDWARE.md).

## Files

| File | Purpose |
|---|---|
| `KagelLockFlasher.exe` | The tool. Double-click to run — no install. |
| `kagel_flasher.py` | Its source (Python + tkinter), if you'd rather run or edit it directly. |
| `kagel-lock.hex` | The firmware image the tool flashes by default. |
| `Manual.html` | Illustrated step-by-step manual — open in any browser. |
| `flash.bat` | Command-line flash (chip-erase + program + verify + reset) for the same result without the GUI. |
| `rebuild-firmware.bat` | Rebuilds `kagel-lock.hex` from source via the Simplicity Studio toolchain (edit the paths for your machine). |

## Using the tool

1. Connect the Raspberry Pi Debug Probe to the PC and wire it to the module (SWD), with the module
   powered at 3.3 V.
2. Run **KagelLockFlasher.exe**. The top indicator shows **Debug Probe: connected** once it sees
   the probe.
3. It loads `kagel-lock.hex` from beside itself by default; use **Load firmware** to pick a
   different `.hex` / `.s37` / `.bin`. Its size and checksum are shown so you know what you're about
   to write.
4. Press **FLASH**. The log shows erase, program, verify, and reset.
5. Or tick **Auto-flash** for production: place a board, it flashes automatically and re-arms when
   you remove it — flash a batch back to back.

The full walkthrough with pictures is in **Manual.html**.

## Running the source directly

```
pip install pyocd
py kagel_flasher.py
```

If the probe doesn't appear, check the wiring and power in [`../docs/HARDWARE.md`](../docs/HARDWARE.md);
the [FLASHING.md](../docs/FLASHING.md) page has the raw pyOCD commands for troubleshooting.
