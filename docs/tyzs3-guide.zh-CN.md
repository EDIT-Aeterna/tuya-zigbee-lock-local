# TYZS3 初始支持指南 — v1.1.0-alpha.1

[English](tyzs3-guide.md)

## 确认目标与备份

确认模组丝印/照片为 TYZS3，芯片为 EFR32MG13P732F512GM48。本次实测产品绑定为涂鸦 PID `ujcjk46o`、锁 MCU `1.0.0`。PID 是产品定义标识，不是模组类型或协议代际；未知 TYZS3 锁不能直接视为兼容。

烧录前保存原厂 product-info、板级接线记录，并读取本机完整主 Flash 两次，每份 524288 字节，确认 SHA256 一致并离线保存。单独保留本机 USERDATA/制造 token，不能用另一把锁的备份替代，也不要公开这些私有数据。确认原厂布局和回滚方案，详见[烧录要求](FLASHING.md)。不要通过擦除解除读保护。

## 固件安装

使用发布 ZIP 内的 `firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex`，核对 SHA256SUMS。不能混用 TYZS5 或旧 upstream HEX。完成备份/布局审核后，用已确认的烧录工具正常编程并校验，不做整片擦除，不单刷 bootloader，不用旧一键 flasher。

内部构建仍为 `tools/build_tyzs3.ps1` / `studio/tyzs3-candidate`。发布文件重命名不改变运行行为：模组诊断版本仍为 `T3-1`，保留 EM1、禁用 EM2。OTA 禁用。Zigbee 身份为 `Tuya / TY0A01-TYZS3`。

## Zigbee2MQTT 与配对

1. 备份 Zigbee2MQTT 配置与当前 converter。
2. 从 ZIP 提取 `zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js`（v0.1.0 初始验证支持）。停用旧 `_candidate.js` 和其他匹配同一 fingerprint 的定义。
3. 按部署版本支持的 external converter 机制安装并重启，检查加载错误。现有部署步骤见[安装指南](zigbee2mqtt-guide.md)。保留 CommonJS `.js`，不要直接改名 `.mjs`。
4. 协调器开放入网，使用锁本身已知的本地配网步骤；不同锁没有统一按键组合。确认身份与配对/重新入网正常。
5. 冷启动抓取 Cmd01，确认 `ujcjk46o / 1.0.0`。纯 JSON 或 JSON 后紧跟 0/1 OTA 标志均可接受。未验证 PID 时仅可上报，不能写控制；错误/缺失/畸形 PID 回复会锁定控制至重启，不要绕过。
6. 门保持打开并准备机械后备手段，先检查时间、动作、电量和最新列表，再依次人工测试 DP21、用测试凭证执行 DP54 和 DP55。不要拿现有家庭凭证做删除试验。

旧 SmartHomePlus / LCK-BI400 converter 仅供历史参考，不适用于当前固件，也不要重复加载重叠定义。

## 功能与诊断

只开放 DP21 远程密码开锁、DP54 凭证录入、DP55 删除。使用结构化控件，DP21 先在内存暂存六位 ASCII 数字，再明确执行一次；固件仍独立验证。不要将真实密码写入公开日志。

已测指纹/密码/门卡/人脸动作、电池及 DP58/59/60/93 列表。`00 00` 表示空列表/数量 0，不应显示分片 0 错误。ID 计算为 `(shard - 1) * 8 + bit`，旧缓存需等待新上报替换。DP93 是实测人脸列表扩展，不代表所有锁实现。报警等可选上报取决于锁 MCU。

Converter 的 dispatch/status 是诊断信息，“已发出 Zigbee 指令”不等于“锁 MCU 已执行”。重试前确认结果和物理状态。DP204 显示模组诊断版本，不是 MCU product-info 版本。

## 不支持项与回滚

- 周期临时密码：观察到原厂传输，但保存后未能开锁，因此不开放。
- 一次性临时密码、冻结/解冻不开放；实测原厂 DP27 无 MCU 回复。
- DP48/49 即使已有抓包布局，仍禁用。DP24–28、39、48/49、68–70、200、202、205/OTA、FC00 均不能写。
- 原厂动态密码通过专有 SecKey 验证可用，TZLL 未实现，刷入后不支持。这是专有能力缺失，不是共核协议回归。
- 不保留 Tuya Cloud/App，不支持 OTA。当前 EM1 策略尚不承诺成熟续航或通用兼容。

异常时停止操作并保存日志。核对本机原厂备份 SHA256，按[回滚说明](FLASHING.md)恢复本机主 Flash 并校验，保留 USERDATA 和全部原备份。模组回滚不能撤销锁 MCU 内已发生的凭证变更。

详见[产品绑定](lock-profiles/ujcjk46o.md)、[已知良好基线](TYZS3_KNOWN_GOOD_BASELINE.md)和[验证记录](TYZS3_VALIDATION_v1.1.0-alpha.1.md)。
