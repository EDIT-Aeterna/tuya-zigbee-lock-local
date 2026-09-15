# Tuya Zigbee Lock Local (TZLL) v1.0.0-alpha.1

[English](README.md) | **简体中文**

面向已验证 **TYZS5 / EFR32MG13P732F512GM48 / PID `srptwvak`** 目标的本地化固件与 Zigbee2MQTT 集成方案。

当前固件基线为 **Stage 2G-R2 + Basic Identity Migration**。

**TYZS3 目前仍在计划 / 兼容验证阶段，不包含在本次发行版中。**

> 完全本地运行：不依赖 Tuya Cloud，不依赖厂商网关。  
> 通过 Zigbee2MQTT 接入 Home Assistant。

## 生产版 Converter

请使用：

[`zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js)

这是当前 **Stable v1.2.1** 生产版 converter。

它只匹配：

```text
manufacturerName: Tuya
modelIdentifier:  TY0A01-TYZS5
```

该 converter 已完成静态检查与实机回归测试。

**本项目不会保留 Tuya Cloud / Tuya App 兼容能力。**

安装说明请查看：

[`docs/zigbee2mqtt-guide.md`](docs/zigbee2mqtt-guide.md)

不要与 legacy converter 同时加载：

[`zigbee2mqtt/TYZS5/legacy/README.md`](zigbee2mqtt/TYZS5/legacy/README.md)

当前已验证的结构化控制 DP：

```text
21
24
25
26
27
28
48
49
54
55
```

电池、开锁事件以及 DP58 / DP59 / DP60 等只读遥测，取决于锁 MCU 实际提供的上报内容。

> **相同的 TYZS5 / TYZS3 模组，不代表锁体功能完全一致。**
>
> 报警、工作 / 省电模式（DP202）等能力由锁 MCU 实现，不同品牌、型号甚至不同配置版本之间都可能存在差异。
>
> TYZS3 当前仍属于计划支持目标，不包含在 `v1.0.0-alpha.1` 中。

完整兼容性与能力矩阵：

[`docs/supported-locks.md`](docs/supported-locks.md)

以下能力在当前生产定义中保持禁用：

```text
DP39
DP68
DP69
DP70
DP205 / OTA
```

同时，生产版 converter 中不包含：

- FC00 claim/auth 控制路径
- legacy auth DP226 / DP227 / DP230
- 旧的 DP200 writer

## 固件

源码：

[`firmware/TYZS5`](firmware/TYZS5/)

Simplicity Studio 工程：

[`studio/tyzs5-telemetry`](studio/tyzs5-telemetry/)

当前构建入口：

```powershell
tools/build_stage2br.ps1
```

Canonical HEX：

```text
studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex
```

Converter 的安装与更新不会重新构建或重新烧写固件。

## OTA 状态

**OTA 当前禁用。**

OTA / bootloader 布局仍未完成安全验证。

仓库中保留的历史 bootloader / OTA 文件仅供开发和参考，**不属于当前受支持的升级流程，也不应作为量产刷写说明使用。**

## 兼容性说明

TZLL 的兼容性需要分成两层理解：

1. **模组 / 协议兼容性**  
   相同或兼容的 TYZS3 / TYZS5 模组，是 TZLL 可以工作的强兼容信号。

2. **锁 MCU 功能支持**  
   不同锁体可能只实现一部分可选 DP，因此最终可用功能可能不同。

例如，当前实机样本已经观察到：

- 有的锁支持报警，有的锁不支持；
- 有的锁对 DP202 工作 / 省电模式指令没有任何响应；
- 因此不能仅凭模组型号判断全部功能是否存在。

请查看：

[`docs/supported-locks.md`](docs/supported-locks.md)

并欢迎提交新的品牌 / 型号 / 模组 / 功能测试结果。

## 项目文档

- [支持锁型 / 功能矩阵](docs/supported-locks.md)
- [Zigbee2MQTT 安装指南](docs/zigbee2mqtt-guide.md)
- [Home Assistant 指南](docs/home-assistant-guide.md)
- [兼容性反馈模板](docs/compatibility-report-template.md)
- [Converter 集成报告](docs/TYZS5_PRODUCTION_CONVERTER_INTEGRATION.md)
- [原始项目与版权归属](NOTICE.md)
- [许可证状态](docs/LICENSE_RECOMMENDATION.md)

## 当前发行范围

本版本已验证目标：

```text
Module: TYZS5
SoC: EFR32MG13P732F512GM48
PID: srptwvak

manufacturerName: Tuya
modelIdentifier: TY0A01-TYZS5
```

当前 `v1.0.0-alpha.1` 不包含：

- TYZS3 正式支持
- OTA
- Tuya Cloud
- Tuya App
- 对所有涂鸦 Zigbee 锁的通用兼容承诺

## 项目来源与许可证

本项目保留了原始 upstream 的代码和 Git 历史。

原始项目：

`nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware`

原作者版权声明仍然适用。

由于 upstream 当前没有提供明确的开源许可证，本项目暂不对 upstream 派生代码重新声明统一的 MIT / GPL / Apache 等许可证。

详细信息：

- [`NOTICE.md`](NOTICE.md)
- [`docs/LICENSE_RECOMMENDATION.md`](docs/LICENSE_RECOMMENDATION.md)

---

如果你的锁使用 TYZS5 / TYZS3 模组，并愿意参与兼容性测试，欢迎提交锁的品牌、型号、模组照片和功能测试结果。
