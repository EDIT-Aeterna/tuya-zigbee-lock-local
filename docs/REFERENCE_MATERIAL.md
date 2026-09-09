# Reference Material

Recorded on 2026-09-09 (Asia/Shanghai) for the TYZS5 port baseline.

The files below are external reference material kept in the parent workspace. They are not copied
into the Git repository and are not firmware inputs until their use is explicitly documented.
Paths are relative to the repository root.

| Path | Type | Size | SHA-256 | Use |
|---|---|---:|---|---|
| `../reference/通用 MCU 对接协议_涂鸦开发者平台_涂鸦开发者平台.pdf` | Official MCU/module protocol | 266903 bytes | `11A40D9C22ECDDEFCAE92D196BB520BDE0F35C4BF7FD001AD0C9BFC44CA927E5` | Generic protocol source of truth where not contradicted by `TARGET_SRPTWVAK` captures |
| `../reference/protocol_2eqdqlq2_20260901.pdf` | Product protocol/debug reference | 234409 bytes | `30BE80389C18FAE87ACB44A9B1EF4C752CB8FBC0CBE077F9AEDB53BE1BC1486A` | Product-specific protocol evidence; PID is not assumed to be the target PID |
| `../reference/mcu_sdk_Zigbee门锁_20260901.zip` | Official MCU SDK reference implementation | 39608 bytes | `6A8602FD87A66B6A412B074CE9D0224B1642937A2677905AC881DDE604C379A4` | Reference only; must not be flashed to the EFR32 |
| `../reference/Debugfile_Zigbee门锁_20260901.json` | Debug/product DP definition | 20713 bytes | `6D6B5EE475AF41CFA3F134A71EA1BD48348D57D6D94D6AFBA439AA2CE4E789BB` | DP map input; top-level keys are `Pro_Key` and `Dp_Data` (43 entries) |

## Archive inventory

The MCU SDK ZIP contains:

- `mcu_sdk/system.c`, `system.h`
- `mcu_sdk/mcu_api.c`, `mcu_api.h`
- `mcu_sdk/protocol.c`, `protocol.h`
- `mcu_sdk/zigbee.h`
- `mcu_sdk/zigbee门锁_202609011134.xls`

The SDK is an oracle for protocol behavior and field definitions. It is not an EFR32 build
dependency for the port.

## Naming note

The task book names these attachments with a `(1)` suffix. The actual files use the names recorded
above; they have not been renamed.
