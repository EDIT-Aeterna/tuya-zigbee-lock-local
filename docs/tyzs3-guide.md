# TYZS3 guide — TZLL v1.2 Control / Monitor

[简体中文](tyzs3-guide.zh-CN.md)

Validated target: TYZS3 / EFR32MG13P732F512GM48 / Product Binding `ujcjk46o` / lock MCU evidence `1.0.0`. Control identity is `Tuya / TY0A01-TYZS3`; Monitor identity is `Tuya / TY0A01-TYZS3-MON`.

Before flashing, keep two identical full 524288-byte backups from the exact module, preserve USERDATA/manufacturing tokens separately, and review [FLASHING.md](FLASHING.md). Do not mass erase.

Control firmware: `firmware/TYZS3/tzll_tyzs3_control_v1.2.0-alpha.1.hex`. Monitor firmware: `firmware/TYZS3/tzll_tyzs3_monitor_v1.2.0-alpha.1.hex`. Use the matching canonical converter in `zigbee2mqtt/TYZS3/`.

Monitor is recommended for read-only HA use. Control allows only DP21 and DP54/55 after expected-PID verification. Passive reports include battery, local unlock actions and DP58/59/60/93 credential lists on the tested lock. `00 00` is empty-list; bitmap IDs use `(shard - 1) * 8 + bit`.

TYZS3 Control does not expose temporary-password management, DP48/49 or dynamic password/SecKey. OTA is disabled; Tuya Cloud/App is not retained; EM2 remains disabled.
