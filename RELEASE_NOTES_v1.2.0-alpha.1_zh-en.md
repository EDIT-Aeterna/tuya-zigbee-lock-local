# TZLL v1.2.0-alpha.1 — 可控制版与只读监控版

## 中文

### 本次更新

新增 TYZS5 / TYZS3 Monitor 只读监控版及独立 Zigbee2MQTT v0.1.0 converter；共享源码支持四版本构建。Product Binding 与中立 Capability Profile 分离，Access Edition 独立决定外部写权限。Control 已验证行为与白名单保持不变。

### 两种版本怎么选

只需 Home Assistant 状态、事件、电量与凭证信息，推荐 Monitor。明确需要远程开锁或凭证管理时选择 Control。具体能力取决于模组、产品绑定、profile 及实际锁 MCU，不能根据模组名称推断所有锁都支持。

### 支持矩阵

manufacturerName 均为 Tuya。

| 模组/版本 | modelIdentifier | 产品绑定 / profile | 外部可写 DP |
|---|---|---|---|
| TYZS5 Control | TY0A01-TYZS5 | srptwvak / EXTENDED_V1 | 21,24,25,26,27,28,48,49,54,55 |
| TYZS5 Monitor | TY0A01-TYZS5-MON | srptwvak / EXTENDED_V1 | 空 |
| TYZS3 Control | TY0A01-TYZS3 | ujcjk46o / CORE_V1 | 21,54,55 |
| TYZS3 Monitor | TY0A01-TYZS3-MON | ujcjk46o / CORE_V1 | 空 |

TYZS5 为当前较成熟已验证目标；TYZS3 为初始实机验证支持。维护者已报告两种 Control，以及两种 Monitor 固件配合对应 converter 的 Zigbee2MQTT/HA 实机验证 PASS。Codex 仅执行构建、静态审计和自动化测试，没有操作硬件。发布文件须与已验证候选逐字节一致。

### Monitor 的安全模型

只读监控版同时移除 Zigbee2MQTT 控制写入入口，并在固件层拒绝外部发起的门锁控制写入，从而缩小远程控制攻击面。不提供远程开锁、录入/删除凭证、临时密码、免密配置或 raw 写入口。电量、事件、凭证列表、可选报警与诊断上报按 MCU 能力保留；必要的唤醒、时间同步、网络状态与 ACK 不被禁用。这不是安全认证或零风险保证。

### 固件与 converter 文件

路径相对于发布 ZIP 根目录：

| 版本 | HEX | Converter |
|---|---|---|
| TYZS5 Control | firmware/TYZS5/tzll_tyzs5_control_v1.2.0-alpha.1.hex | zigbee2mqtt/TYZS5/tzll_tyzs5_control_converter_v1.2.2.js |
| TYZS5 Monitor | firmware/TYZS5/tzll_tyzs5_monitor_v1.2.0-alpha.1.hex | zigbee2mqtt/TYZS5/tzll_tyzs5_monitor_converter_v0.1.0.js |
| TYZS3 Control | firmware/TYZS3/tzll_tyzs3_control_v1.2.0-alpha.1.hex | zigbee2mqtt/TYZS3/tzll_tyzs3_control_converter_v0.1.0.js |
| TYZS3 Monitor | firmware/TYZS3/tzll_tyzs3_monitor_v1.2.0-alpha.1.hex | zigbee2mqtt/TYZS3/tzll_tyzs3_monitor_converter_v0.1.0.js |

### 升级/切换注意事项

先确认模组，再选版本，完成本机备份和布局审核，核对校验值，烧录匹配 HEX，安装对应 converter，最后配对/重新 interview。保留原厂完整备份与回滚路径。不要混刷模组，不使用旧一键 flasher、整片擦除或单独 bootloader 写入。

Control 与 Monitor 身份不同，切换须重刷；可能需要 Zigbee2MQTT 删除重配或重新 interview，以刷新缓存身份与 HA 实体。Monitor 不复用 Control converter；不要重复加载同一 fingerprint。

### 已知限制

- 功能仍取决于锁 MCU / 产品绑定，不宣称全部 TYZS3/TYZS5 锁兼容。
- TYZS3 Control 不开放临时密码及扩展 DP48/49 控制；保留 EM1，EM2 禁用。
- 不支持动态密码 / SecKey，不保留 Tuya Cloud/App。
- OTA 禁用，bootloader/布局未解决事项不在本次解决。
- DP8 为诊断值，不是可靠独立门磁。
- TYZS5 原 Control converter 的可选 DP202 不在固件白名单内，不是本发布支持的端到端控制。
- 仍为 alpha。Monitor 缩小控制攻击面，不消除所有安全风险。

### 校验值

包根目录 SHA256SUMS.txt 包含全部交付文件校验值（校验表自身除外）；RELEASE_MANIFEST.md 记录来源提交和身份。FINAL_AUDIT_REPORT.md 比较四份固件及两份 Monitor converter 与已实机验证字节，说明 Control converter 行尾身份差异。固件诊断版本保留 1.0.2 / 1.0.2-MON / T3-1 / T3-1-MON，不等同于公开版本号。

---

## English

### What's new

Four shared-source builds now offer TYZS5/TYZS3 Control and Monitor. Product Binding is separated from neutral Capability Profile, with an orthogonal compile-time Access Edition. Control behavior and exact write policies are unchanged. Both independent Monitor converters are v0.1.0.

### Choosing an edition

Monitor is recommended for Home Assistant status/events-only use. Control is for intentional remote-control use. Capabilities depend on module target, Product Binding, Capability Profile and actual lock MCU.

### Support matrix

The table above lists all four exact Tuya identities and write policies. TYZS5 is the more mature validated target; TYZS3 is initial hardware-validated support. The maintainer reports PASS for both Control targets and both Monitor firmware/converter combinations in Zigbee2MQTT/Home Assistant. Codex did not perform hardware tests; final assets must match validated bytes.

### Monitor security model

Monitor Edition removes the normal integration-layer lock-control writers and firmware-side externally-originated lock-control permissions, reducing the remote-control attack surface. No remote unlock, credential management, temporary-password, password-free or generic/raw writers are provided. MCU-dependent passive reports and required internal protocol traffic remain. This is not a security certification or an all-risk guarantee.

### Firmware and converter files

The asset table above gives exact paths. Four versioned HEX files and four versioned JS copies are shipped. Use the converter matching both module and edition; do not reuse Control definitions for Monitor.

### Upgrade/switching notes

Identify module, choose edition, keep a verified full backup and reviewed rollback/layout plan, verify checksums, flash matching HEX, install matching converter, then pair/re-interview. Switching requires reflashing and changes modelIdentifier; deleting/re-pairing or re-interviewing may be needed to clear cached identity/entities. No whole-chip erase, legacy flasher or standalone bootloader procedure is recommended.

### Known limitations

Feature availability remains MCU/binding-dependent. TYZS3 temporary-password/extended-control features remain unavailable, with EM1 retained and EM2 disabled. Dynamic password/SecKey and Tuya Cloud/App are unsupported. OTA is disabled; bootloader/layout uncertainty is not resolved. DP8 is diagnostic, not an independent reliable door-contact sensor. Optional DP202 in the unchanged TYZS5 Control converter is outside firmware permission. This remains alpha; Monitor does not remove all risk.

### Checksums

Verify every entry in SHA256SUMS.txt. RELEASE_MANIFEST.md records source commit and asset identities; FINAL_AUDIT_REPORT.md records validated-byte comparisons and Control converter line-ending provenance. Runtime versions remain 1.0.2, 1.0.2-MON, T3-1 and T3-1-MON, independent of the public release tag.
