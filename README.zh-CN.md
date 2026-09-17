# Tuya Zigbee Lock Local (TZLL) v1.1.0-alpha.1

[English](README.md) | **简体中文**

面向已验证 TYZS5、TYZS3 锁的本地固件与 Zigbee2MQTT 集成，目标 SoC 为 EFR32MG13P732F512GM48。本次预发布首次提供基于共享核心的 TYZS3 初始实机验证支持。

**刷入 TZLL 后不保留 Tuya Cloud / Tuya App 兼容能力。**

| 模组 | 状态 | 已测产品绑定 / 说明 |
|---|---|---|
| TYZS5 | 已验证 / 当前成熟目标 | srptwvak |
| TYZS3 | 初始实机验证支持 | ujcjk46o / 锁 MCU 1.0.0，控制范围保守 |

PID 是涂鸦 Product ID（产品定义绑定），不等于模组类型或协议代际。相同模组不代表锁 MCU 功能相同；报警、门状态、工作/省电模式等取决于锁体。详见[支持矩阵](docs/supported-locks.md)，不要将未知锁型直接视为已支持。

## 选择对应 Converter

| 模组 | 正式文件 | 版本 / 精确身份 |
|---|---|---|
| TYZS5 | [tuya_ty0a01_tyzs5.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js) | Stable v1.2.2；Tuya / TY0A01-TYZS5 |
| TYZS3 | [tuya_ty0a01_tyzs3.js](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js) | v0.1.0 初始支持；Tuya / TY0A01-TYZS3 |

安装前阅读 [TYZS3 中文指南](docs/tyzs3-guide.zh-CN.md) 或 [TYZS5 安装指南](docs/zigbee2mqtt-guide.md)。更换 TYZS3 文件时停用旧 candidate 定义，不要重复加载同一 fingerprint。旧 SmartHomePlus / LCK-BI400 converter 仅供历史参考，不适用于当前 TZLL 身份。

TYZS5 固件控制范围保持 DP21、24–28、48/49、54/55 不变。其原有 converter 还暴露可选 DP202，但当前固件白名单不接受它，不能当作本版本支持的端到端控制。

TYZS3 只允许通过 PID 验证后的 DP21 远程密码开锁、DP54 录入、DP55 删除。支持已测指纹/密码/门卡/人脸事件、电池和凭证列表；DP93 是观察并验证的人脸列表扩展，并非所有锁必有的能力。

## 固件与安装

共享源码：[firmware/common](firmware/common/)。目标适配：[TYZS5](firmware/TYZS5/) / [TYZS3](firmware/TYZS3/)。

构建入口分别为 `tools/build_stage2br.ps1`、`tools/build_tyzs3.ps1`。为保持构建配置不变，内部 TYZS3 工程仍名为 `studio/tyzs3-candidate`，发布 HEX 已使用正式名称：

- `firmware/TYZS5/tzll_tyzs5_srptwvak_v1.1.0-alpha.1.hex`
- `firmware/TYZS3/tzll_tyzs3_ujcjk46o_v1.1.0-alpha.1.hex`

两种 HEX 不能混刷，使用前核对包内 SHA256SUMS。先阅读[烧录说明](docs/FLASHING.md)，保存本机完整原厂备份并确认回滚路径。不要使用旧一键 flasher，不做整片擦除，不单刷 bootloader。未知目标的原厂布局兼容性仍须单独审核。

## TYZS3 当前限制

- 不开放周期临时密码、一次性临时密码、冻结/解冻、DP48/49。
- 原厂动态密码可用，但 TZLL 缺少专有 SecKey 验证能力，刷入后不支持。
- OTA 禁用，不保留 Tuya Cloud/App。
- 保持已验证的保守 EM1 策略，EM2 禁用，尚不宣称成熟低功耗表现。
- 报警、门状态等可选功能取决于锁 MCU，不承诺通用兼容。

维护者已报告 TYZS5 共核实机回归和 TYZS3 首轮实机功能验证通过。本次自动化构建、静态测试与既有实机结果分开记录，不将 Codex 构建检查写成实机验证。

## 文档与来源

- [TYZS3 已验证基线](docs/TYZS3_KNOWN_GOOD_BASELINE.md)
- [ujcjk46o 产品绑定及限制](docs/lock-profiles/ujcjk46o.md)
- [本版本验证记录](docs/TYZS3_VALIDATION_v1.1.0-alpha.1.md)
- [发布说明](RELEASE_NOTES.md)
- [Home Assistant 指南](docs/home-assistant-guide.md)
- [兼容性反馈模板](docs/compatibility-report-template.md)
- [原始项目与版权归属](NOTICE.md)
- [许可证状态](docs/LICENSE_RECOMMENDATION.md)

保留原作者 Nicki Eftekhari 的代码、历史与归属声明。upstream 派生代码许可状态仍待明确，本次不新增统一 MIT/GPL/Apache 许可证。
