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
| Sample A | Unknown | Unknown | ✅ | ❓ | ❓ | ❓ | ❓ | ❌ | ❌ | Lower-cost tested lock; alarm absent; power/work-mode command produced no MCU response | Maintainer |
| Sample B | Unknown | Unknown | ✅ | ❓ | ❓ | ❓ | ❓ | ✅ | ❌ | Higher-cost tested lock; alarm available; power/work-mode command produced no MCU response | Maintainer |

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

The verified release target is TYZS5 / EFR32MG13P732F512GM48 / PID `srptwvak`, Basic identity `Tuya / TY0A01-TYZS5`. TYZS3 is planned and not included. Module matching is a compatibility indicator, not proof of support for an untested target. OTA and bootloader layout remain unresolved; OTA is disabled.

See the [capability discovery roadmap](ROADMAP.md); no probing is added in this release.
