# Supported Locks / Compatibility Matrix

TZLL compatibility has two layers:

1. **Module / protocol compatibility** — a matching TYZS3/TYZS5 module is a strong signal that the lock can use the TZLL Zigbee/UART integration.
2. **Lock-MCU feature support** — individual lock models may implement only a subset of optional datapoints.

A matching module therefore does **not** guarantee identical features across brands or models.

## Status legend

- ✅ Tested working
- ❌ Tested not supported / no response
- ➖ Not present / not applicable
- ❓ Not tested / unknown
- ⚠️ Partial / unusual behavior

## Community matrix

| Brand | Model | Module | Basic TZLL | Remote unlock | Fingerprint | Password | Temp password | Alarm | Power/work mode | Notes | Reporter |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 熊鲸智能 | H1-zigbee | TYZS5 | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ | Lower-cost tested lock; alarm absent; power/work-mode command produced no MCU response | Maintainer |
| 施曼客 | Unknown | TYZS5 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | Higher-cost tested lock; alarm available; power/work-mode command produced no MCU response | Maintainer |
| Unknown | Unknown | TYZS3 | ✅ | ✅ | ✅ | ✅ | ➖ | ❓ | ➖ | Initial support; ujcjk46o / MCU 1.0.0; card, face, credential enrollment/deletion tested; temporary passwords not exposed | Maintainer |

> Replace `Unknown` only when the corresponding brand/model/module has been confirmed. Do not infer it from another sample.

## Contributing a compatibility report

Please submit:

- brand and model;
- clear Zigbee-module photo;
- mainboard/connector photo;
- module marking;
- TZLL firmware/converter version;
- tested feature matrix;
- any unusual or unknown datapoints.

Use [`compatibility-report-template.md`](compatibility-report-template.md).

## Release scope

v1.1.0-alpha.1 retains validated TYZS5 / srptwvak and introduces initial hardware-validated TYZS3 / ujcjk46o / MCU 1.0.0 support. Both use EFR32MG13P732F512GM48; Basic identity is respectively `Tuya / TY0A01-TYZS5` and `Tuya / TY0A01-TYZS3`. PID is a tested product-definition binding, not module type or protocol generation. OTA is disabled; stock bootloader/NVM layout compatibility for unknown targets is not established.

TYZS3 specifically passed Basic TZLL, remote unlock, fingerprint, password, card, face, credential enrollment/deletion and DP58/59/60/93 list telemetry. Periodic temporary-password management is not supported in the initial TZLL release. Dynamic password works with stock firmware but is unsupported after TZLL flash because proprietary SecKey validation is unavailable. No consumer brand/model has been supplied; none is inferred.

TYZS3 supports writes only DP21/54/55 after PID verification. Alarm, door/inside-handle sensing and work/power modes remain lock-MCU dependent, not universal module capabilities. See [ujcjk46o limitations](lock-profiles/ujcjk46o.md) and the [TYZS3 guide](tyzs3-guide.md).

See the [capability discovery roadmap](ROADMAP.md); no probing is added in this release.
