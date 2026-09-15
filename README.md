# Tuya Zigbee Lock Local (TZLL) v1.0.0-alpha.1

Local firmware and Zigbee2MQTT integration for the verified TYZS5 / EFR32MG13P732F512GM48 / srptwvak target. Firmware baseline: Stage 2G-R2 plus Basic Identity Migration. TYZS3 is planned and not included in this release.

## Production converter

Use [tuya_ty0a01_tyzs5.js](zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js), the reviewer-supplied Stable v1.2.1 candidate, integrated without payload changes. It fingerprints only manufacturer `Tuya`, model `TY0A01-TYZS5`. This integration has static validation; candidate real-device regression is still required.

Read the [installation guide](docs/zigbee2mqtt-guide.md). Do not install the [legacy converter](zigbee2mqtt/TYZS5/legacy/README.md) alongside it.

Structured control DPs: 21,24,25,26,27,28,48,49,54,55; DP202 is module-local power mode. DP58/59/60 are decoded read-only telemetry. DP39, DP68/69/70 and DP205/OTA are disabled. FC00 claim/auth, legacy auth DPs 226/227/230 and the stale DP200 writer are absent from the production definition.

## Firmware

Sources: [firmware/TYZS5](firmware/TYZS5/). Studio project: [studio/tyzs5-telemetry](studio/tyzs5-telemetry/). The original build entry point is `tools/build_stage2br.ps1`.

Canonical image: `studio/tyzs5-telemetry/build/debug/kagel_tyzs5_srptwvak_clean.hex`. Converter integration does not rebuild or flash firmware. OTA and bootloader layout remain unresolved; legacy bootloader artifacts are not approved flashing instructions.

## Project documentation

- [Supported locks](docs/supported-locks.md)
- [Converter guide](docs/zigbee2mqtt-guide.md)
- [Integration report](docs/TYZS5_PRODUCTION_CONVERTER_INTEGRATION.md)
- [Original project attribution](NOTICE.md)
- [License status](docs/LICENSE_RECOMMENDATION.md)

Original upstream code and history are preserved. © 2026 Nicki Eftekhari; original rights notices remain applicable.
