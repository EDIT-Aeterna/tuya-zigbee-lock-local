# TZLL v1.0.0-alpha.1

First public TYZS5 release of Tuya Zigbee Lock Local.

Validated target: TYZS5, EFR32MG13P732F512GM48, manufacturer `Tuya`, model `TY0A01-TYZS5`.

Provides local Zigbee operation through Zigbee2MQTT and Home Assistant, validated TYZS5 firmware, and Stable v1.2.1 production converter. No Tuya Cloud or vendor gateway is required.

## Core validated integration

The tested integration baseline covers Zigbee2MQTT pairing, Home Assistant integration, remote unlock, supported credential operations (DP54/55) and temporary-password operations (DP24-28), alongside DP48/49. Battery and unlock-event reporting depend on what the lock MCU provides. DP58/59/60 are read-only telemetry. Production converter v1.2.1 is included; its static validation passed, while deployment runtime/device regression remains pending.

## Optional / lock-dependent capabilities

Some lock MCUs implement additional datapoints that others do not. Alarm reporting and power/work-mode control (DP202) are optional and are not guaranteed by a matching TYZS5/TYZS3 module. Unsupported lock MCUs may ignore a command or never report its datapoint; this alone does not establish a Zigbee failure.

Maintainer Sample A has basic integration but no alarm; Sample B has basic integration and alarm. Neither responded to the power/work-mode command. Their specific brand, model and module markings remain unknown. Other feature results must not be inferred from these observations.

DP39, DP68/69/70 and OTA remain disabled. TYZS3 is not included. This compatibility clarification changes neither firmware nor converter behavior.

Licensing of upstream-derived code is still being clarified. See NOTICE.md. Checksums are in SHA256SUMS.txt.
