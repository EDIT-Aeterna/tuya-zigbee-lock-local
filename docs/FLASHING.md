# Flashing and rollback

Select the exact module AND edition from the v1.2.0-alpha.1 release ZIP and verify SHA256SUMS.txt. Monitor is recommended for status/events-only use; Control is for intentional remote control.

| Target / edition | Release image | Basic model |
|---|---|---|
| TYZS5 Control / srptwvak | firmware/TYZS5/tzll_tyzs5_control_v1.2.0-alpha.1.hex | TY0A01-TYZS5 |
| TYZS5 Monitor / srptwvak | firmware/TYZS5/tzll_tyzs5_monitor_v1.2.0-alpha.1.hex | TY0A01-TYZS5-MON |
| TYZS3 Control / ujcjk46o | firmware/TYZS3/tzll_tyzs3_control_v1.2.0-alpha.1.hex | TY0A01-TYZS3 |
| TYZS3 Monitor / ujcjk46o | firmware/TYZS3/tzll_tyzs3_monitor_v1.2.0-alpha.1.hex | TY0A01-TYZS3-MON |

All manufacturers are Tuya. These are exact copies of audited isolated matrix outputs, not older original Studio build folders. Choose the converter matching module and edition. Changing editions requires reflashing and may require Zigbee2MQTT re-interview or deleting/re-pairing to refresh cached model/HA entities. Do not reuse a Control converter for Monitor.

Both tested targets use EFR32MG13P732F512GM48. Do not select by SoC alone; confirm module, actual board wiring and tested product binding using the maintainer-verified setup. Historical upstream hardware/flasher instructions are not this release's flashing procedure.

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
