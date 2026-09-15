# Stage 2B-R donor merge report

Date: 2026-09-09. Status: Stage 2B-R offline integration PASS.
Stage 2C has not started. No target was connected, flashed, erased, joined or tested.

## Sources and ownership

Frozen Stage 1.1 commit: `f01156f7ded3226def1300a87b6310993eaed7b9`.
Working branch: `port/tyzs5-stage2br-telemetry`.

| Component | Donor | Stage1.1 | Final source |
|---|---|---|---|
| nicki_ek_lock_serial.c | rejected old parser | retained unchanged | firmware/ |
| nicki_ek_lock_serial.h | rejected old API | retained unchanged | firmware/ |
| lock_app.c | rejected | retained unchanged | firmware/ |
| lock_app.h | rejected | retained unchanged | firmware/ |
| efr32_app.c | hardware/Zigbee source | superseded old HAL only | donor plus narrow adapter changes |
| app.c | retained unchanged | not used | studio/tyzs5-telemetry/app.c |
| main.c | retained unchanged | not used | studio/tyzs5-telemetry/main.c |
| ZAP | retained cluster selections | not used | donor; SDK package path fixed |
| custom clusters | retained unchanged XML | not used | config/zcl/kagel-extensions.xml |
| build scripts | retained for provenance | not used | tools/build_stage2br.ps1 is final entry |
| converter contract | external user file | unchanged | external SHA-256 recorded below |

Protocol semantics -> Stage 1.1. Hardware/Zigbee glue -> known-working donor.
Z2M interface -> existing kagel_lock.js contract.
V2 clean establishes the same device, GSDK and linker/NVM3 baseline; donor is its
working hardware/Zigbee evolution. No application relocation was introduced.

Donor legacy +14400 -> rejected; old DP24 field order -> rejected;
generic-only DP49 -> rejected; old protocol parser -> superseded.
These descriptions are historical evidence, not production configuration.

Imported donor paths: app.c, main.c, .project, .cproject, .projectlinkstore,
.pdm/, .settings/, .uceditor/, autogen/, config/, tools/, readme.html,
kagel_tyzs5_srptwvak_clean.slcp/.slps/.pintool, and firmware/efr32_app.c,
kagel_profile.h, kagel_rx_timeout.h. Generated outputs were regenerated.
Intentionally excluded: donor serial/application core (four files), copied SDK tree,
old GNU build outputs/Makefiles, trashed_modified_files, and historical task reports.
Complete current file/hash inventory is in artifacts/stage2br/file_inventory.log.

## Adapter and safety

Added firmware/target_tyzs5_adapter.h. It resets only exposed RX assembly fields
on donor inter-byte timeout/ring overflow, preserving pending TX/wake state.
It extracts the donor EF00 payload builder without changing its bytes.
No frozen public API was modified. Donor diagnostic-only callback registrations
not offered by frozen lock_app were removed; their event counters are therefore
not a supported diagnostic measurement in this build. UART ISR, ring handling,
PA1 wake, EM1/EM2, polling and event timing retain donor implementation.

EF00 command 0x01 body: `00 | transaction(1) | dp(1) | type(1) | length(2 BE) | value`.
DP8 bool/1, DP10 value/100, DP14 bool/1 are byte-for-byte host-tested.
MCU 0x05 and 0x23 use the frozen on_dp_report path to the same donor sender.
No DP-to-business interpretation is added on EFR32.

Generated compiler definitions explicitly include KAGEL_TELEMETRY_ONLY=1.
Both donor inbound EF00/FC00 handlers and OTA response handling are compile-gated.
Final ELF has no lock_app_ef00_rx, lock_app_zb_rx, lock_app_create_temp_pw,
bootloader_writeStorage, bootloader_eraseStorageSlot, bootloader_setImageToBootload,
or bootloader_rebootAndInstall symbol. UART IRQ and live telemetry entry points
are present. tools/verify_stage2br_safety.py checks this and frozen core equality.
DP200/202/205 inbound controls remain consumed; DP204 telemetry is retained.
No OTA slot was configured. Bootloader init/interface metadata remains SDK-owned.

## Build and memory

SDK: C:/Users/Aerial/SimplicityStudio/SDKs/gecko_sdk, gecko_sdk.slcs version 4.5.1.
SLC 5.11.0.0; GNU Arm 12.2.Rel1, gcc 12.2.1 20221205.
ZAP 2025.10.23, feature level 107. Device EFR32MG13P732F512GM48.
Run `./tools/build_stage2br.ps1` from the repository. It performs SLC Generate,
donor custom ZAP generation, clean, and build using the newly generated Makefile.
The preserved Eclipse metadata is donor provenance; the verified build entry is
the SLC Makefile workflow, not the donor's old Eclipse build directory.
SDK dependencies remain external and must be installed to reproduce the build.

An initial relocated custom ZCL absolute path produced empty generated enums.
Resolved by copying GSDK's unmodified app/zcl reference files under config/zcl/sdk-zcl
and using a relative xmlRoot. No cluster selections were redesigned.
Two subsequent full clean builds succeeded, including the scripted workflow.

| Item | Final evidence |
|---|---|
| HEX | 0x00000000..0x0002825F inclusive; 164448 data bytes; checksums valid |
| .text | 0x00000000, size 0x27E88 |
| .data | RAM 0x20001098, size 0x3C4, load 0x00027E9C |
| .bss | 0x2000145C, size 0x2CAC |
| stack | 0x20000000..0x20001000, 0x1000 bytes |
| heap minimum | 0x20004108, 0x800 bytes; limit 0x20010000 |
| GNU size | text 164436, data 12, bss 15684 (section classification differs from MAP .data) |
| NVM3 | __nvm3Base/linker_nvm_begin 0x77000; size 0x9000; end 0x80000 exclusive |

No NVM3 address regression. Do not interpret the MAP's synthetic .nvm section
cursor as the backing store: linker_nvm_begin and nvm3 initialization symbols
place storage at the reserved top-of-flash region. OTA remains unresolved.
Final ELF (.out), HEX, S37, MAP and BIN are in studio/tyzs5-telemetry/build/debug/.

Warnings: SDK libraryNames unused-variable compiler warning; ZAP HA Door Lock
device-compliance warnings for absent Door Lock, Groups, Identify client/server
and Scenes. These match donor's custom EF00 surface; this build does not claim
standard HA Door Lock compliance. SLC reports the SLF4J no-provider notice.
Board RF/clock/wiring correctness and final binary runtime remain unverified here.

## Checks and reviewer blocker

All Stage 1.1 checks pass: target audit, corpus audit, host selftest, 35 fixtures
(0 failed/0 awaiting hardware), production lock_app UTC+8 integration.
Adapter test and linked-image safety checks pass.
Reviewer script is unchanged and exits 1 for legacy_14400 only.
It searches all repository text, including the frozen PASS log
tests/STAGE1_1_AUDIT_OUTPUT.txt:40 and this required historical rejection report.
Production source has no old offset. Changing frozen evidence or the reviewer
script to force PASS is not authorized. Reviewer needs to restrict this check to
production definitions/inputs or explicitly adjudicate the false positive.
Logs are preserved, including the failure. No AUDIT RESULT: PASS is claimed.

## Direct answers

| Question | Answer |
|---|---|
| Q1 Only Stage 1.1 core compiled? | Yes; root firmware paths, unchanged frozen files |
| Q2 Donor old time offset excluded? | Yes, production provider remains UTC+8 |
| Q3 Target DP24 27-byte order retained? | Yes, unchanged and regression-tested |
| Q4 Target DP49 13/3 profile retained? | Yes, frozen implementation/evidence retained |
| Q5 UART from donor? | Yes, USART0 PA0/PA1 115200 8N1 no flow control |
| Q6 EF00 contract retained? | Yes, encoder byte tests and donor transport |
| Q7 Fingerprint retained? | Yes, SmartHomePlus / LCK-BI400 |
| Q8 Sleepy End Device? | Yes, donor Pro Leaf/steering/power configuration |
| Q9 Telemetry-only effective? | Yes, generated macro and linked-image checks |
| Q10 Remote control DP can reach MCU? | No external EF00/FC00 forwarding entry linked |
| Q11 OTA write path executable? | No specified storage-write/install paths linked |
| Q12 Flashed? | No |

Converter SHA-256: 4DF18679B9CFCF16E4BD04FBAD4498DA0843B36966818014D8EF9D837F0E5E86.
Path: D:/project/TYZS5_lock/TYZS3toTYZS5/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware-main/zigbee2mqtt/kagel_lock.js.
Converter remains unchanged. Final-build hardware retest requires a separately
authorized stage after offline reviewer approval.
