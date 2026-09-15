# Home Assistant guide

Pair the verified TYZS5 device through Zigbee2MQTT, then expose its entities to Home Assistant. No Tuya Cloud or Tuya App is required. Device identity is Tuya / TY0A01-TYZS5. DP8 is an unreliable diagnostic door-state signal, not a guaranteed independent door sensor; entities depend on the lock MCU's actual capability.

## Optional entities and controls

An entity may appear in the converter/UI even when the lock MCU does not implement it. Alarm availability and power/work-mode control (DP202) vary by lock model; matching modules do not guarantee identical Home Assistant entities or behavior.

An unsupported optional command may receive no MCU response. This does not necessarily mean Zigbee failed. Do not repeatedly retry an unsupported control. Record the result in the [compatibility report](compatibility-report-template.md) and consult the [capability matrix](supported-locks.md).
