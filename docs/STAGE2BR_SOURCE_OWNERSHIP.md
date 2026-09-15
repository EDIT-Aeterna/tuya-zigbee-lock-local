# Stage 2B-R source ownership

Status: merge and two clean builds completed; reviewer audit blocked by its
whole-repository historical-log scan. Frozen commit: `f01156f7ded3226def1300a87b6310993eaed7b9`.

| Component | Source of truth | Rule |
|---|---|---|
| firmware/nicki_ek_lock_serial.c and .h | Reviewed Stage 1.1 working tree | Preserve protocol semantics; reject donor versions |
| firmware/lock_app.c and .h | Reviewed Stage 1.1 working tree | Preserve public API unless separately authorized |
| Stage 1.1 tests and target fixtures | Reviewed Stage 1.1 | Preserve unchanged |
| Studio MCU/SDK/linker/NVM3 baseline | V2 clean project | EFR32MG13P732F512GM48, GSDK 4.5.1; no relocation |
| efr32_app.c, app.c, main.c | User-validated before_task7b1 donor | Retain UART, wake, polling, power and framework behavior |
| ZAP, custom clusters and identity | User-validated donor | Preserve Endpoint 1, HA Door Lock, EF00/FC00 and Basic identity |
| Build scripts | Donor with local generation/path fixes | Regenerate before clean build |
| kagel_lock.js | User-specified external converter | Read-only contract; no edits |

Protocol semantics belong to Stage 1.1. Hardware/Zigbee glue belongs to the
known-working donor. Z2M interface belongs to the existing converter contract.
Donor legacy time offset, DP24 order, generic-only DP49 assumptions and serial
parser must not replace the frozen core.

SDK located and version verified from gecko_sdk.slcs:
`C:/Users/Aerial/SimplicityStudio/SDKs/gecko_sdk`, version `4.5.1`.

No SWD, target connection, flash, erase, join or target UART test is authorized.
