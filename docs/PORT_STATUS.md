# TYZS5 Port Status

## Current Stage 2E-B status (2026-09-10)

DP21 + narrow DP48 provisioning + narrow DP49 password-free unlock offline build and the current Stage 2E-B reviewer audit passed. The unchanged supplied EF00 test has one out-of-bounds method mutation; this is documented in `PHASE2EB_DP49_CONTROL_REPORT.md`. No hardware was connected or flashed.

## Previous Stage 2E-A status (2026-09-10)

DP21 + narrow DP48 provisioning offline build passed the Stage 2E-A reviewer
and EF00 integration test. DP49 and all other control DPs remain blocked; OTA
write/install remains disabled. See `PHASE2EA_DP48_PROVISION_REPORT.md`.

## Current Stage 2B-R status (2026-09-09)

Donor merge and two offline clean builds succeeded; Stage 1.1 regression and
adapter/safety checks PASS. Reviewer Stage 2B-R script exits 1 because its
whole-tree old-offset search matches frozen historical PASS logs. This is a
review blocker, not a production time-offset regression. See
PHASE2BR_DONOR_MERGE_REPORT.md and artifacts/stage2br/reviewer.log.
Stage 1.1 frozen commit: f01156f7ded3226def1300a87b6310993eaed7b9.
No target connection or flashing. No Stage 2C. The sections below are the
historical Stage 1.1 record; their git status describes that earlier stage.

Stage: 1.1 - srptwvak target evidence closure

Status: PASS for the Stage 1.1 target golden audit and offline verification. Remaining opaque
field semantics and the release-blocking OTA/bootloader layout discrepancy are documented.
Stopped for review before Stage 2.

Date: 2026-09-09 (Asia/Shanghai)

## Repository baseline

- Working repository: `D:\project\tyzs5-lock-port\Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware`
- Origin: `https://github.com/nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware.git`
- Source branch: `main`
- Working branch: `port/tyzs5-lock`
- Baseline commit: `3822b191fddfe822df8c9cba43e4bb0b7f2dde5e`
- Baseline commit title: `firmware 1.0.2: answer the MCU's queries, and count what we still cannot`
- The previously existing sibling directory `D:\project\TYZS5_lock\...` is out of scope. No future
  changes for this task are to be made there.

At the end of Stage 0, the freshly cloned repository was clean and `HEAD` matched `origin/main`.
The Stage 0 working tree contained only the three intended untracked baseline documents. The
current Stage 1 working tree is:

```text
## port/tyzs5-lock
 M firmware/host_selftest.c
 M firmware/lock_app.c
 M firmware/nicki_ek_lock_serial.c
 M firmware/nicki_ek_lock_serial.h
?? docs/BACKUP_MANIFEST.md
?? docs/PHASE1_PROTOCOL_REPORT.md
?? docs/PORT_STATUS.md
?? docs/REFERENCE_MATERIAL.md
?? tests/
```

## Tool inventory

| Tool | Path | Observed version or evidence |
|---|---|---|
| pyOCD | `C:\Users\Aerial\AppData\Local\Python\pythoncore-3.14-64\Scripts\pyocd.exe` | `0.45.1` |
| Simplicity Studio launcher | `C:\SiliconLabs\SimplicityStudio\v5\studio.exe` | Eclipse Platform `4.34.0` from `.eclipseproduct`; Studio executable has no usable Windows file version metadata |
| Simplicity Commander | `C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\commander\commander.exe` | `1v22p1b1957`; J-Link DLL `8.94` |
| SLC CLI | `C:\Users\Aerial\.silabs\slc_cli_windows\slc_cli\bin\slc-cli\slc-cli.exe` | product bundle `com.silabs.uc.cli.product=5.3.0.202505231656-914`; `--version` prints no value |
| GNU Arm GCC | `C:\SiliconLabs\SimplicityStudio\v5\developer\toolchains\gnu_arm\12.2.rel1_2023.7\bin\arm-none-eabi-gcc.exe` | Arm GNU Toolchain `12.2.Rel1`, GCC `12.2.1` |
| GNU Make | `C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin\make.exe` | installed; no standalone version string returned |
| Node.js | PATH | `v24.16.0` |
| npm | PATH | `11.13.0` |

No `cc`, `clang`, `clang-cl`, or `cl` compiler was found on PATH. The host-test command in
`firmware/BUILD.md` therefore cannot be run as written yet.

The installed Studio tree contains an offline package directory
`C:\SiliconLabs\SimplicityStudio\v5\offline\com.silabs.sdk.stack.super_4.5.1\platform`, and the
repository source comments target Gecko SDK 4.5. The full Gecko SDK/EmberZNet source checkout and
the exact SDK used to produce the prebuilt image were not found in the repository or a user Studio
workspace, so SDK availability is recorded as package evidence rather than a reproducible build
claim.

## Original repository inventory

The clean upstream repository contains:

- `firmware/`: portable serial core, application layer, EFR32 HAL source, host self-test, prebuilt
  application and bootloader images, and build notes;
- `zigbee2mqtt/`: one external converter and install notes;
- `docs/`: protocol, hardware, flashing, and OTA notes;
- `flasher/`: pyOCD scripts, executable flasher, and duplicate application image.

No `.slcp`, `.isc`, `.hwconf`, `.project`, `.cproject`, `.sls`, linker script, `Makefile`, generated
configuration directory, or Simplicity Studio project is present. Consequently, the target
configuration below is source/document evidence, not a verified Studio project configuration.

## Target configuration evidence

| Item | Current upstream evidence | Baseline conclusion |
|---|---|---|
| MCU | `firmware/BUILD.md` and `docs/HARDWARE.md` name `EFR32MG13P732F512GM48` | 512 KB Series-1 target is documented |
| UART peripheral | `firmware/efr32_app.c:57-64` defines `USART0`, `cmuClock_USART0`, PA0/PA1, route 0 | Existing source uses USART0, TX PA0, RX PA1 |
| UART format | `firmware/efr32_app.c:64` defines `115200`; `USART_InitAsync` is used at lines 145-156 | Existing source says 115200 8N1, no flow control |
| Zigbee endpoint/clusters | `firmware/efr32_app.c:72-74` defines endpoint 1, EF00 telemetry, FC00 control | Existing source exposes endpoint 1 with EF00/FC00 paths |
| Identity | `firmware/efr32_app.c` writes `SmartHomePlus` / `LCK-BI400` to Basic attributes | Must be revalidated for the target product; do not treat it as target identity yet |
| Device type | `firmware/BUILD.md:52-65` describes Sleepy End Device + Pro Leaf Stack | Intended SED behavior is documented, but no generated config verifies it |
| NVM3 | `efr32_app.c` includes `nvm3_default.h` and uses NVM3-backed network credentials | Actual storage layout is not verifiable without the generated linker/config files |
| Bootloader/linker | No linker or Studio project files are present | Cannot safely prove bootloader/application placement |

## Image and memory evidence

The Intel HEX records were checked for record checksums:

- `firmware/kagel-lock.hex`: 227260 data bytes, data addresses `0x00000000-0x000377BB`, 0 bad
  record checksums;
- `flasher/kagel-lock.hex`: same data size and range, 0 bad record checksums;
- `firmware/kagel-lock-bootloader.hex`: 13288 data bytes, data addresses
  `0x0FE10800-0x0FE13BE7`, 0 bad record checksums.

The repository documents multiple memory models that must be resolved before any build or flash:

- `docs/OTA.md` describes the application at `0x0`, a separate bootloader region around
  `0xFE10000`, and an OTA slot starting at `0x42000` with size `0x35000`;
- `docs/OTA-BOOTLOADER-RECIPE.md:40-46` instead describes a 16 KB bootloader at `0x00000`, a
  relocated application at `0x04000`, an OTA slot at `0x42000-0x77000`, and NVM3 at
  `0x77000-0x80000`;
- the prebuilt bootloader HEX contains data in the `0xFE...` address space, while the application
  HEX starts at `0x0`.

This is a release-blocking configuration discrepancy. It must be resolved from the actual Studio
project/linker output and bootloader storage metadata, not inferred from the prebuilt files.

## Known risks and stale evidence

1. The upstream project targets TYZS3 in its README, hardware notes, and source comments. The
   target is TYZS5, so module pinout, carrier wiring, antenna, LED, reset, and wake GPIO facts still
   require target-hardware evidence.
2. `docs/PROTOCOL.md:25-32` describes version `0x02` and says this firmware uses 9600 baud, while
   `firmware/nicki_ek_lock_serial.h:19-23` defines protocol version `0x03` and
   `firmware/efr32_app.c:64` uses 115200. The official task-book protocol and fresh captures must
   decide the target behavior; the stale text is retained as evidence.
3. `flasher/flash.bat:15` and `docs/FLASHING.md:28` use chip erase by default. That command was not
   run and must not become the default TYZS5 procedure until the backup and image layout are
   approved.
4. `flasher/rebuild-firmware.bat:5` contains the hard-coded path
   `C:\Users\Main\SimplicityStudio\v5_workspace\kagel-lock`, which does not describe the current
   workspace.
5. The target product-info reply has now confirmed PID `srptwvak` and reported version `1.0.8`.
   `2eqdqlq2` remains reference-only and must not be substituted for the target PID.
6. There is no connected probe or target read in this baseline. Hardware identity, debug-lock state,
   UART electrical levels, and TYZS5 carrier wiring remain unverified.

## Commands and results

Commands used during Stage 0 included:

```text
git clone --branch main --single-branch https://github.com/nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware.git Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware
git switch -c port/tyzs5-lock
git status --short --branch
git remote -v
git log -1 --oneline --decorate
pyocd --version
commander.exe --version
arm-none-eabi-gcc.exe --version
Get-FileHash -Algorithm SHA256 <backup files>
```

Results: clone succeeded; branch is `port/tyzs5-lock`; `main`, `origin/main`, and the baseline
commit remain `3822b191fddfe822df8c9cba43e4bb0b7f2dde5e`; tool versions are listed above; both
required Flash images are 524288 bytes with the verified SHA-256 recorded in
`docs/BACKUP_MANIFEST.md`; `git diff --ignore-space-at-eol --exit-code` returned 0; no functional
source was changed; no hardware write was attempted.

## Stage 0 report (historical)

Status: PASS

Changes: added `docs/REFERENCE_MATERIAL.md`, `docs/BACKUP_MANIFEST.md`, and this file. No C, JS,
binary, or external reference file was changed.

Evidence: the three documents above, the clean upstream commit, and the verified backup manifest.

Unresolved at the Stage 0 checkpoint: no generated Studio project/linker; the OTA/bootloader
address contradiction remains release-blocking and is intentionally not resolved here; target
TYZS5 board mapping and hardware state; no host C compiler was available on PATH at that
checkpoint; stale upstream protocol/flashing instructions.

Stage 0 next step: after review, Stage 1 would read the official PDFs/SDK/Debug JSON and build
offline protocol fixtures and host tests without requiring the EFR32 or hardware.

## Stage 1 report

Status: PASS for offline protocol analysis, portable parser validation, categorized fixtures, and
host tests. Superseded by the Stage 1.1 target evidence closure below.

Changes:

- extended the portable serial core with strict frame decoding and DP/schema parsers;
- corrected protocol-only handling for fixed wake framing, same-sequence replies, DP report ACKs,
  record timestamps, time-sync field order, and validated dynamic/offline password lengths;
- added `firmware/host_selftest.c` coverage without EFR32 or Zigbee dependencies;
- added `docs/PHASE1_PROTOCOL_REPORT.md`, `tests/run_fixtures.py`, and categorized fixtures;
- did not change EFR32 GPIO/RF/sleep/Zigbee code, flasher code, binaries, OTA data, bootloader
  data, or linker configuration. `lock_app.c` was updated only for the target UTC+8 provider and
  target DP24 builder integration required by Stage 1.1.

Host verification used the installed native MinGW GCC at
`C:\msys64\ucrt64\bin\gcc.exe` through MSYS2. Results:

```text
ALL PASS (0 failures)
FIXTURES: 18 passed, 0 failed, 5 awaiting hardware
```

The historical five skipped fixtures were removed after the DHO924 target captures resolved the
DP49 response, first DP54 password command, complete time-sync exchange, normal-password record,
and card record.

The OTA/application/bootloader address contradiction remains release-blocking. There is still no
Studio project or linker output, so app base, bootloader model, and NVM3 layout were not guessed.
No hardware connection, mass erase, application flash, bootloader flash, or physical write was
performed.

Next: wait for review. Do not begin Stage 2 from this tree until the Stage 1.1 report is approved.

## Stage 1.1 target evidence closure

Profiles:

- `GENERIC_TUYA`: generic official protocol and DP schemas, including generic DP24 21-byte and
  DP49 15-byte layouts;
- `TARGET_SRPTWVAK`: DHO924 target truth for compatibility, including DP24 27-byte ordering,
  DP49 13-byte request, DP54 report sequence, target product-info sequence, target UTC+8, and
  same-sequence `0x06/0x10` ACK;
- `REFERENCE_2EQDQLQ2`: reference SDK/Debug JSON only; its PID and product-specific fields are
  not applied to `srptwvak`.

Stage 1.1 changes:

- target production time provider is UTC+8 (`28800` seconds);
- target DP24 builder emits `prefix(6), start(4), end(4), unknown/reserved(6), one_time(1),
  password(6)` and is covered by a byte-for-byte host test;
- inbound same-sequence `0x06` status `0x10` is consumed silently without a reply or unhandled
  callback;
- target golden fixtures were added under `tests/fixtures/target_srptwvak/`;
- the old `0x4E` DP49 transcription remains only as a malformed historical regression case;
- offline password behavior is documented and structurally tested; SecKey behavior remains
  unimplemented and unclaimed.

Verification:

```text
AUDIT RESULT: 0 failure/blocker(s)
ALL PASS (0 failures)
FIXTURES: 35 passed, 0 failed, 0 awaiting hardware
```

Remaining uncertainty: DP49 trailing two request bytes and DP54 report byte zero semantics. The
OTA/bootloader address contradiction remains release-blocking. No Studio project, linker output,
RF, GPIO, Zigbee, flasher, OTA, bootloader, or hardware state was changed.

Next: stop and wait for review. Do not begin Stage 2.
