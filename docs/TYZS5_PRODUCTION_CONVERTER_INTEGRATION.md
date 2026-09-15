# TYZS5 production converter integration

## 来源与范围

输入：TZLL_CONVERTER_REVIEW_BUNDLE.zip 中 reviewer 提供的 Stable v1.2.1 candidate。该文件已包含 stable_v1.2_to_v1.2.1.diff 所述清理，无需再次应用 diff。
生产入口：zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js。
逐字节复制，未改动任何 payload builder 或控制逻辑。
SHA-256：8DE0244E00CF66145377BD5B574B49020F41901A50B89F338A20CAE19004836F。

## 实际文件变更

- 新增 zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js。
- 原 zigbee2mqtt/TYZS5/kagel_lock.js 原样移动至 legacy/kagel_lock.js。
- 新增 zigbee2mqtt/TYZS5/legacy/README.md，明确 REFERENCE/LEGACY — DO NOT USE。
- 更新 zigbee2mqtt/TYZS5/README.md、根 README.md、docs/zigbee2mqtt-guide.md、CHANGELOG.md。
- 新增本报告 docs/TYZS5_PRODUCTION_CONVERTER_INTEGRATION.md。

## 身份与 DP 策略

唯一 fingerprint：{modelID: 'TY0A01-TYZS5', manufacturerName: 'Tuya'}。
结构化可写 DP：21,24,25,26,27,28,48,49,54,55；另保留 module-local DP202 电源模式。
DP58/59/60 为只读解码上报。
禁止写入 DP39、68、69、70、205/OTA。
生产定义移除 FC00 claim/auth 注册、writer/reader、auth mappings 226/227/230 及过时 DP200 writer。
候选文件中的历史身份注释不属于 fingerprint，保留以确保候选字节完全一致。

## 验证

- node --check zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js：PASS（Node 24.16.0）。
- 对照 ZIP candidate 原始字节：PASS，SHA-256 与 reviewer 报告一致。
- git diff --exit-code HEAD -- firmware studio：PASS，固件、工程与 HEX 未改变。
- git diff --check：PASS；Git 提示 Windows 行尾转换，不是差异检查失败。
- 已检查 fingerprint、发送路径和最终 DP mapping。
- 本仓库没有 Zigbee2MQTT package/runtime，Node 无法解析 zigbee-herdsman-converters 依赖，因此未进行真实 runtime 加载。未以 mock 加载替代运行时验证。

安装指南中的 advanced.enable_external_js 已核对 Zigbee2MQTT 官方 external converters 与 all-settings 文档，链接保存在指南中。保留 CommonJS/.js 格式，本轮不实施 ESM 迁移。

## 仍需维护者实机验收

Interview/rejoin 身份、battery/alarm/action/credential ID 上报；DP21；DP48 与 DP49；DP24/25/26/27/28；DP54 start/cancel 和 DP55 single delete；DP58/59/60 列表；DP202；Z2M restart 与 state restoration/migration。
语法检查通过不等于实机回归通过。本次未连接设备、发送 MQTT 控制、改 HA 配置或刷写固件。
