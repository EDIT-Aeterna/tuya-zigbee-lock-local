# Stage 2B-R telemetry acceptance matrix

| Lock MCU input | Expected EF00/Z2M | Offline status |
|---|---|---|
| DP8 bool 0 | door=CLOSE | donor encoder contract; converter mapping inspected |
| DP8 bool 1 | door=OPEN | encoder byte vector tested |
| DP10 value 100 | battery=100 | encoder byte vector tested |
| DP14 event | action=doorbell | encoder byte vector tested |
| DP2 unlock | action=unlock_password | transparent DP path; converter inspected |
| DP5 unlock | action=unlock_card | target record fixture plus converter contract |
| DP9 alarm | converter alarm enum/raw mapping | transparent DP path, not final hardware-tested |
| UART cmd 0x23 record (not DP23) | timestamp parsed, contained DPs reported | frozen record regression passes |

OFFLINE VERIFIED applies to the specific tests stated above, not an Ember-stack
simulation. HARDWARE VERIFIED BY OLD DONOR refers only to the user's report that
the donor boots, joins and reports battery/door/doorbell telemetry.
Every row NEEDS NEW FINAL-BUILD HARDWARE RETEST. No new binary was flashed.

EF00/FC00 inbound control (including DP21/24/25/48/49/54/55) is consumed under
the actual telemetry-only build definition. Management functions and OTA
storage write/install entries are absent from the final linked image.
