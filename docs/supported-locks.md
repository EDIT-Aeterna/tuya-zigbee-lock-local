# Supported Locks / Compatibility Matrix

TZLL compatibility has separate layers: Module Target, Product Binding, Capability Profile and Access Edition. A matching module does **not** guarantee identical lock-MCU features across brands or models.

## Validated Product Bindings

| Module | Product Binding | MCU evidence | Control | Monitor | Notes |
|---|---|---|---|---|---|
| TYZS5 | srptwvak | 1.0.8 evidence | ✅ | ✅ | Mature validated target; broader validated Control profile |
| TYZS3 | ujcjk46o | 1.0.0 | ✅ | ✅ | Initial hardware-validated support; Control limited to DP21/54/55 |

Control/Monitor PASS means maintainer real-device validation on the tested binding. It is not a universal claim for every lock carrying that module.

## Community matrix

| Brand | Model | Module | Basic TZLL | Remote unlock | Fingerprint | Password | Temp password | Alarm | Power/work mode | Notes | Reporter |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 熊鲸智能 | H1-zigbee | TYZS5 | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ | Lower-cost tested lock; alarm absent; power/work-mode command produced no MCU response | Maintainer |
| 施曼客 | Unknown | TYZS5 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | Higher-cost tested lock; alarm available; power/work-mode command produced no MCU response | Maintainer |
| Unknown | Unknown | TYZS3 | ✅ | ✅ | ✅ | ✅ | ➖ | ❓ | ➖ | Initial support; ujcjk46o / MCU 1.0.0; card, face, credential enrollment/deletion tested | Maintainer |

Do not infer PID/MCU for a specific brand/model row unless that sample was directly recorded.

Use [`compatibility-report-template.md`](compatibility-report-template.md) for new reports. Remove passwords, Zigbee network keys and other sensitive values before posting.

v1.2.0-alpha.1 publishes TYZS5 Control/Monitor and TYZS3 Control/Monitor for the tested bindings. Monitor has no external writable lock DP and uses a separate read-only converter. Control permissions remain profile-specific.

See [Access Editions](ACCESS_EDITIONS.md), [platform architecture](PLATFORM_ARCHITECTURE.md) and the [TYZS3 binding](lock-profiles/ujcjk46o.md).
