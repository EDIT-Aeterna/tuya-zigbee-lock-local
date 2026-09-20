# Roadmap

## Access editions

- T3-4A: firmware-only Control/Monitor access policy and four candidate builds; implemented for maintainer hardware regression, not public release.
- T3-4B: matching Control/Monitor converter layer; not implemented in T3-4A. Canonical converters remain unchanged.
- Planned v1.2.0-alpha.1: four-edition release only after hardware validation and T3-4B review. Not prepared, tagged or published by T3-4A.

See [Access Editions](ACCESS_EDITIONS.md).

## Product binding and capability profiles

PID means Tuya Product ID / product definition binding, not module type or protocol generation. T3-3 separates module targets, static product bindings, neutral capability profiles and runtime observations; see [architecture](PLATFORM_ARCHITECTURE.md). Current builds still select one expected binding; MCU versions remain evidence metadata, not an additional gate.

Later work, not implemented in T3-3:

- Automatic multi-PID binding lookup from observations.
- Generic unknown-PID read-only profile, without relaxing current write safety.
- Multiple product bindings mapping to a shared capability profile.
- Converter commonization (the two current converters remain unchanged).
- Runtime/site timezone configuration instead of the preserved binding UTC+8 metadata.

## Lock capability discovery / per-model feature profiling

Future work should prefer passive observation of reported datapoints and known-model compatibility profiles. Avoid aggressive startup probing of unknown lock MCUs. Capability discovery is not implemented by the optional-capabilities documentation addendum.
