# TYZS3 指南 — TZLL v1.2 Control / Monitor

[English](tyzs3-guide.md)

已验证目标：TYZS3 / EFR32MG13P732F512GM48 / Product Binding `ujcjk46o` / 锁 MCU `1.0.0`。Control 身份为 `Tuya / TY0A01-TYZS3`，Monitor 为 `Tuya / TY0A01-TYZS3-MON`。

烧录前保存当前模组两份一致的 524288 字节完整主 Flash，并单独保留 USERDATA/制造 token；先阅读 [FLASHING.md](FLASHING.md)。不要整片擦除。

Control 固件：`firmware/TYZS3/tzll_tyzs3_control_v1.2.0-alpha.1.hex`。Monitor 固件：`firmware/TYZS3/tzll_tyzs3_monitor_v1.2.0-alpha.1.hex`。使用 `zigbee2mqtt/TYZS3/` 中匹配版本的 converter。

只需要 HA 状态/事件时推荐 Monitor。Control 仅在预期 PID 验证后允许 DP21、DP54/55。已测锁可上报电量、本地开锁事件和 DP58/59/60/93 凭证列表；`00 00` 表示空列表，ID 使用 `(shard - 1) * 8 + bit`。

TYZS3 Control 不开放临时密码、DP48/49，也不支持动态密码/SecKey。OTA 禁用，不保留 Tuya Cloud/App，EM2 仍禁用。
