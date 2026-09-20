# Home Assistant guide — v1.2 Control / Monitor

TZLL devices are integrated into Home Assistant through Zigbee2MQTT. No Tuya Cloud or Tuya App is required.

## Choose the edition first

| Module / edition | Basic identity | Home Assistant intent |
|---|---|---|
| TYZS5 Control | Tuya / TY0A01-TYZS5 | Passive state/events plus validated controls |
| TYZS5 Monitor | Tuya / TY0A01-TYZS5-MON | Read-only state/events/diagnostics |
| TYZS3 Control | Tuya / TY0A01-TYZS3 | Passive state/events plus validated DP21/54/55 controls |
| TYZS3 Monitor | Tuya / TY0A01-TYZS3-MON | Read-only state/events/diagnostics |

Monitor Edition is recommended when Home Assistant only needs lock telemetry and events. The matching converter has no lock-control writers, and Monitor firmware independently denies externally-originated lock-control writes.

Depending on the actual lock MCU, passive entities can include battery, unlock events, last credential type/ID, credential-list synchronization, alarms and module diagnostics. Monitor should not expose remote unlock, credential enrollment/deletion, temporary-password operations, password-free provisioning or generic/raw writers.

DP8, where reported, is diagnostic lock/door state from the lock MCU. It is **not** a reliable independent physical door-contact sensor.

## Switching editions

Control and Monitor use different `modelIdentifier` values. Switching requires reflashing the matching firmware and installing the matching converter. Zigbee2MQTT may need re-interview or delete/re-pair to refresh cached identity and Home Assistant entities.

See [Access Editions](ACCESS_EDITIONS.md), [Zigbee2MQTT installation](zigbee2mqtt-guide.md) and the [compatibility matrix](supported-locks.md).
