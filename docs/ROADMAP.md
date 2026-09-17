# Roadmap

## Product binding and capability profiles

PID means Tuya Product ID / product definition binding, not module type or protocol generation. Future architecture may map `Product binding (PID + MCU version) -> Capability profile`, with multiple PIDs sharing one capability profile. T3-2 retains existing internal profile names and implements no broad refactor or new controls.

## Lock capability discovery / per-model feature profiling

Future work should prefer passive observation of reported datapoints and known-model compatibility profiles. Avoid aggressive startup probing of unknown lock MCUs. Capability discovery is not implemented by the optional-capabilities documentation addendum.
