# Stage 1 protocol fixtures

Each JSON file records an `evidence_profile`, direction, raw serial bytes,
source class, expected frame or DP fields, confidence, and known issue. The
approved profiles are:

- `GENERIC_TUYA`: official generic Tuya protocol and DP reference evidence;
- `TARGET_SRPTWVAK`: DHO924 target hardware captures, which define target
  compatibility where they differ from generic behavior;
- `REFERENCE_2EQDQLQ2`: supplied SDK/Debug JSON reference evidence only.

The corpus contains zero awaiting-hardware placeholders. The historical
malformed `0x4E` DP49 transcription remains as an uncertain target fixture;
historical malformed/uncertain does not mean awaiting hardware.

The official Tuya DP reference used for the DP24, DP48, DP49, DP54, and DP55
schemas is:

https://developer.tuya.com/cn/docs/iot/zigbee-doorlock-dp?id=K9fembhbeab0p

Frames labeled `official_web` or `official_generic_protocol` are documentation
examples or schema-derived synthetic frames. They are not claims about a
TYZS5 device capture. Files labeled `stage1_taskbook` identify captures that
the task book requires before release.
