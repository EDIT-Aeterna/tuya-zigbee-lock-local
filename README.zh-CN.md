# Tuya Zigbee Lock Local (TZLL) v1.2.0-alpha.1

[English](README.md) | **简体中文**

面向已验证 TYZS5、TYZS3 锁的本地固件与 Zigbee2MQTT 集成，目标 SoC 为 EFR32MG13P732F512GM48。本次 alpha 提供共享源码构建的可控制版与只读监控版，并已于 2026-09-20 作为 GitHub 预发布版本发布。

**刷入 TZLL 后不保留 Tuya Cloud / Tuya App 兼容能力。**

| 模组 | 状态 | 已测产品绑定 / 说明 |
|---|---|---|
| TYZS5 | 已验证 / 当前成熟目标 | srptwvak |
| TYZS3 | 初始实机验证支持 | ujcjk46o / 锁 MCU 1.0.0，控制范围保守 |

PID 是涂鸦 Product ID（产品定义绑定），不等于模组类型或协议代际。相同模组不代表锁 MCU 功能相同；报警、门状态、工作/省电模式等取决于锁体。详见[支持矩阵](docs/supported-locks.md)，不要将未知锁型直接视为已支持。

## 选择版本

如果只需要在 Home Assistant 中获取门锁状态、开锁记录、电量和凭证信息，推荐使用 **Monitor / 只读监控版**。只有明确需要远程开锁、凭证管理等能力时，再选择 Control / 可控制版。

| 版本 | 状态上报 | 远程开锁 | 凭证写入 | 临时密码 |
|---|---|---|---|---|
| Monitor / 只读监控版 | 取决于锁 MCU | 无 | 无 | 无 |
| Control / 可控制版 | 取决于锁 MCU | 按 profile | 按 profile | 按 profile |

只读监控版同时移除 Zigbee2MQTT 控制写入入口，并在固件层拒绝外部发起的门锁控制写入，从而缩小远程控制攻击面。这不是安全认证或零风险保证。必要的 MCU 唤醒、时间同步、网络状态和 ACK 仍正常工作。

具体可控制能力取决于模组、Product Binding、Capability Profile 以及实际锁 MCU。两个 Monitor 的外部可写 DP 集合均为空。详见[版本边界](docs/ACCESS_EDITIONS.md)。

## 选择对应 Converter

| 模组 | 正式文件 | 版本 / 精确身份 |
|---|---|---|
| TYZS5 | [tuya_ty0a01_tyzs5.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js) | Stable v1.2.2；Tuya / TY0A01-TYZS5 |
| TYZS3 | [tuya_ty0a01_tyzs3.js](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js) | v0.1.0 初始支持；Tuya / TY0A01-TYZS3 |

两个原有 converter 用于 Control。Monitor 必须使用独立定义：

| 模组 | Monitor converter | 精确身份 |
|---|---|---|
| TYZS5 | [v0.1.0](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5_monitor.js) | Tuya / TY0A01-TYZS5-MON |
| TYZS3 | [v0.1.0](zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_monitor.js) | Tuya / TY0A01-TYZS3-MON |

安装前阅读 [TYZS3 中文指南](docs/tyzs3-guide.zh-CN.md) 或 [TYZS5 安装指南](docs/zigbee2mqtt-guide.md)。更换 TYZS3 文件时停用旧 candidate 定义，不要重复加载同一 fingerprint。旧 SmartHomePlus / LCK-BI400 converter 仅供历史参考，不适用于当前 TZLL 身份。

TYZS5 固件控制范围保持 DP21、24–28、48/49、54/55 不变。其原有 converter 还暴露可选 DP202，但当前固件白名单不接受它，不能当作本版本支持的端到端控制。

TYZS3 只允许通过 PID 验证后的 DP21 远程密码开锁、DP54 录入、DP55 删除。支持已测指纹/密码/门卡/人脸事件、电池和凭证列表；DP93 是观察并验证的人脸列表扩展，并非所有锁必有的能力。

## 固件与安装

共享源码：[firmware/common](firmware/common/)。目标适配：[TYZS5](firmware/TYZS5/) / [TYZS3](firmware/TYZS3/)。

四版本构建入口为 `tools/build_all_editions.ps1`。发布复现命令为 `python tools/package_v1_2_release.py`，详见[发布准备说明](docs/RELEASE_PREPARATION_v1.2.0-alpha.1.md)。

1. 确认模组 TYZS3/TYZS5、绑定与接线。
2. 选择 Monitor（只读推荐）或 Control（明确需要远程控制）。
3. 核对 SHA256SUMS.txt，完成备份/布局审核后刷入匹配 HEX。
4. 安装匹配 converter。
5. 配对或重新 interview，核对 Basic 身份。

发布包含四种版本，例如 `firmware/TYZS5/tzll_tyzs5_monitor_v1.2.0-alpha.1.hex`。完整文件清单见[中英文发布说明](RELEASE_NOTES_v1.2.0-alpha.1_zh-en.md)。切换版本必须重刷，modelIdentifier 随之改变；可能需要 Zigbee2MQTT 删除重配或重新 interview，以刷新身份及 HA 实体。Monitor 不能复用 Control converter。

不同模组 HEX 不能混刷，使用前核对包内 SHA256SUMS。先阅读[烧录说明](docs/FLASHING.md)，保存本机完整原厂备份并确认回滚路径。不要使用旧一键 flasher，不做整片擦除，不单刷 bootloader。未知目标的原厂布局兼容性仍须单独审核。

## TYZS3 当前限制

- 不开放周期临时密码、一次性临时密码、冻结/解冻、DP48/49。
- 原厂动态密码可用，但 TZLL 缺少专有 SecKey 验证能力，刷入后不支持。
- OTA 禁用，不保留 Tuya Cloud/App。
- 保持已验证的保守 EM1 策略，EM2 禁用，尚不宣称成熟低功耗表现。
- 报警、门状态等可选功能取决于锁 MCU，不承诺通用兼容。

维护者已报告两种 Control，以及两种 Monitor 固件配合各自 converter 的 Zigbee2MQTT/HA 实机验证 PASS。DP8 仅为诊断状态，不是可靠独立门磁。本次自动化构建、静态测试与既有实机结果分开记录，不将 Codex 构建检查写成实机验证。

## 文档与来源

- [TYZS3 已验证基线](docs/TYZS3_KNOWN_GOOD_BASELINE.md)
- [ujcjk46o 产品绑定及限制](docs/lock-profiles/ujcjk46o.md)
- [本版本验证记录](docs/TYZS3_VALIDATION_v1.1.0-alpha.1.md)
- [v1.2.0-alpha.1 中英文发布说明](RELEASE_NOTES_v1.2.0-alpha.1_zh-en.md)
- [版本历史](RELEASE_NOTES.md)
- [Home Assistant 指南](docs/home-assistant-guide.md)
- [兼容性反馈模板](docs/compatibility-report-template.md)
- [原始项目与版权归属](NOTICE.md)
- [许可证状态](docs/LICENSE_RECOMMENDATION.md)

保留原作者 Nicki Eftekhari 的代码、历史与归属声明。upstream 派生代码许可状态仍待明确，本次不新增统一 MIT/GPL/Apache 许可证。


## 社区与安全

- [安全策略](SECURITY.md)
- [贡献指南](CONTRIBUTING.md)
- [兼容性矩阵](docs/supported-locks.md)
- [兼容性反馈模板](docs/compatibility-report-template.md)

提交 Issue / 日志前请移除真实密码、Zigbee 网络密钥、私有原厂备份及其他家庭敏感信息。
