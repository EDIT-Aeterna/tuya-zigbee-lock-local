# Flashing and rollback

Select the exact module image from the v1.1.0-alpha.1 release ZIP and verify SHA256SUMS:

| Target | Release image | Canonical Studio build |
|---|---|---|
| TYZS5 / srptwvak | firmware/TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex | studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex |
| TYZS3 / ujcjk46o | firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex | studio/tyzs3-candidate/build/debug/kagel_tyzs3_ujcjk46o.hex |

Both tested targets use EFR32MG13P732F512GM48. Do not select by SoC alone; confirm module, board wiring and tested product binding. See [TYZS3 guide](tyzs3-guide.md) / [中文](tyzs3-guide.zh-CN.md) and [hardware wiring](HARDWARE.md).

## Before writing

Keep two matching full-main-flash backups from this exact module (524288 bytes, 0x00000000 through 0x0007FFFF), with SHA256 and offline copies. Preserve board-specific USERDATA/manufacturing tokens separately using the established read-only backup process. Never use another lock's dump. Do not erase a read-protected device to obtain access.

Review the stock layout and rollback plan. These images start at address zero; candidate NVM3 is linked at 0x77000..0x7FFFF. Neither proves compatibility with an untested stock bootloader/NVM layout. Writing may replace stock code/NVM pages. No guarantee is made that existing network state survives.

Keep the door open and a physical fallback available. Do not use legacy flasher executables, chip/mass erase, force/noverify options or standalone bootloader writes. OTA is disabled.

## Manual installation after backup/layout review

Use the maintainer's verified Simplicity Commander setup, selecting the reviewed module HEX, device EFR32MG13P732F512GM48 and the correct probe. Use normal page programming with verification; do not request whole-chip erase. The reviewed command form is:

```powershell
commander flash "<path-to-selected-release.hex>" --device EFR32MG13P732F512GM48 --serialno <probe-serial>
```

This is a template, not an automatic script. Check the selected file and probe before execution. Install the module-specific external converter, enable joining on your coordinator, then use the lock's established pairing procedure. Confirm Basic identity and product info before testing controls.

## Rollback

Stop testing on unexpected behavior and preserve logs. Confirm that the saved stock backup belongs to the exact module and its checksum is unchanged. Restore that verified full main-flash binary at address 0x00000000 using the maintainer's established programmer procedure with verification. Preserve USERDATA; do not improvise bootloader/NVM offsets or erase the chip to fix a failed restore.

Restoring module flash does not restore lock-MCU credentials changed during tests. Keep all original backups permanently. Tuya Cloud/App and stock dynamic-password functionality are not retained while running TZLL.
