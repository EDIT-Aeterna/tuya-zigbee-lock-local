# TYZS3 first-flash plan — candidate, manual review required

This phase only builds and statically reviews a candidate. No probe was connected and no device was flashed. Do not treat the candidate HEX as a released production image.

Static-gate delta: use the new images documented in `T3_1_STATIC_GATE_FIX_REPORT.md`, not the earlier `57e611a3...` TYZS3 image. The maintainer must first pass hardware regression with the new TYZS5 image. TYZS3 is EM1-only (`KAGEL_EM2_DEEPSLEEP=0`), reports module version `T3-1`, and rejects lock writes until a matching `ujcjk46o` PID is verified. Missing/invalid PID responses latch the control block; telemetry continues. Stock backup/layout and rollback gates below are unchanged.

## Gates before any write

1. Review the common-core diff, host logs, profile policy and both build results. Confirm expected PID `ujcjk46o`, hardware EFR32MG13P732F512GM48, UART PA0/PA1 and 115200 8N1 against the actual board.
2. Identify the exact maintainer stock TYZS3 backup and SHA-256. No verified target-specific backup was supplied for this phase. Do not substitute a TYZS5 backup, upstream HEX or another lock's dump.
3. Acquire two matching full-main-flash reads (524288 bytes each), compare hashes against each other and the known stock image; keep copies offline. Also preserve board-specific token/USERDATA material using the maintainer's established read-only backup process. Record probe serial, supply voltage, device identification and backup filenames. Never unlock a read-protected chip by erasing it.
4. Review the actual linker and stock layout. Candidate vector table is at 0x00000000; generated NVM3 region is 0x77000..0x7FFFF. These describe the candidate, NOT proven stock bootloader/NVM compatibility. Programming this image replaces pages starting at address zero, potentially stock bootloader/application pages. The exact stock-to-candidate transition and future rollback must be explicitly approved before proceeding. OTA/bootloader layout compatibility is unresolved; no standalone bootloader is included.
5. Keep the door open, retain a physical fallback and disconnect the debug setup before operational tests if required by the board. Obtain explicit maintainer first-flash approval after the above gates. Do not use the legacy flasher.

## Proposed commands after approval (not executed)

The installed Simplicity Commander `readmem --help` and `flash --help` confirm these switches. Replace `PROBE_SERIAL` and paths with the reviewed values; commands are not an automatic script.

```powershell
$commander = 'C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\commander\commander.exe'
& $commander readmem --device EFR32MG13P732F512GM48 --serialno PROBE_SERIAL --range 0x00000000:+0x80000 --outfile TYZS3-stock-A.bin
& $commander readmem --device EFR32MG13P732F512GM48 --serialno PROBE_SERIAL --range 0x00000000:+0x80000 --outfile TYZS3-stock-B.bin
Get-Item TYZS3-stock-A.bin,TYZS3-stock-B.bin | Select-Object Name,Length
Get-FileHash TYZS3-stock-A.bin,TYZS3-stock-B.bin -Algorithm SHA256
Get-FileHash .\firmware\TYZS3-T3-1-CANDIDATE.hex -Algorithm SHA256
# Only after the stock-layout and backup gates have been approved:
& $commander flash .\firmware\TYZS3-T3-1-CANDIDATE.hex --device EFR32MG13P732F512GM48 --serialno PROBE_SERIAL
```

Commander defaults to erasing only affected pages, verifying writes and resetting after flash. Do not add mass erase, noverify or force options. Do not write a standalone bootloader or USERDATA. Initial NVM compatibility is a review gate, not an assumption that old network credentials will survive or be usable.

## Ordered first-device checks

1. Capture boot UART passively: 55 AA 03 wake/product-info, PID `ujcjk46o`, MCU version and observed OTA flag. Mismatch must block control while telemetry continues.
2. Pair/rejoin a test coordinator and read Basic `Tuya / TY0A01-TYZS3`. Use the separately reviewed experimental `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_candidate.js`; never load another definition for the same fingerprint. The production TYZS5 converter deliberately does not match and remains unchanged.
3. Verify Cmd24 sequence echo, standard UTC and local UTC+28800. Observe battery/events and DP58/59/60/93 where supported.
4. With maintainer approval for each physical action, exercise one DP21, then sacrificial test credentials through DP54/55; verify only the specific malformed stage-0 report is accepted. Types 1/2/3 and optional type 4 must use actual lock-supported credentials. Never delete existing household credentials as a test.
5. Confirm forbidden controls produce no UART wake/application command. No temporary-password, freeze/unfreeze or DP48/49 provisioning tests on the first candidate.

Stock dynamic password was observed working; TZLL does not implement the SecKey algorithm and therefore does NOT preserve it. Structurally valid Cmd07 returns 0x02, invalid returns 0x03. Periodic/one-time temporary passwords, DP27/28, DP48/49 and OTA are unavailable in this initial profile.

## Rollback

On boot/identity/time/control failure stop commands and retain logs. Verify the saved stock backup hash again. Only after confirming it belongs to this exact module, the maintainer may restore main flash:

```powershell
& $commander flash TYZS3-stock-A.bin --address 0x00000000 --device EFR32MG13P732F512GM48 --serialno PROBE_SERIAL
```

This deliberately restores the full saved main flash (including stock code/NVM) and relies on Commander's normal verification; it does not restore external lock-MCU credentials or USERDATA. Confirm stock boot/identity and basic operation. Do not improvise a chip erase if restoration fails. Keep original backups permanently.

Status: Ready for maintainer TYZS5 regression test and stock-layout review; TYZS3 flash not yet approved.
