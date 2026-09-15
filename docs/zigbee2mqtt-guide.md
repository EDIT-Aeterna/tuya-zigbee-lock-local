# TYZS5 Zigbee2MQTT installation

Use only `zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js`, the Stable v1.2.1 production converter. It matches only `Tuya / TY0A01-TYZS5`. The legacy SmartHomePlus/LCK-BI400 definition is not a compatibility fallback.

1. Back up your Zigbee2MQTT configuration and current converter.
2. Remove the previous lock definition from the active external converters directory/registration. Do not load both old and new definitions.
3. Copy the canonical file to `<Zigbee2MQTT data directory>/external_converters/tuya_ty0a01_tyzs5.js`.
4. If external JavaScript is disabled, merge this setting into the existing configuration (do not replace other advanced settings):

   ```yaml
   advanced:
     enable_external_js: true
   ```

5. Restart Zigbee2MQTT using your installation's normal service controls. Check loading errors and the `zigbee2mqtt/bridge/converters` listing before exercising controls.

The [official external converter guide](https://www.zigbee2mqtt.io/advanced/more/external_converters.html) notes external converters are disabled by default in new installations from 2.11.0. The exact key `advanced.enable_external_js` and restart requirement were verified against [official settings](https://www.zigbee2mqtt.io/guide/configuration/all-settings.html#enable_external_js). Existing installation defaults can differ.

Current official examples use ESM/.mjs. This integration deliberately preserves the reviewed CommonJS/.js file; do not rename it to .mjs or claim modern-loader compatibility without testing in the deployment version.

## Policy and acceptance

### Lock-dependent datapoints

TZLL uses a common converter for the validated TYZS5 integration, but the lock MCU behind the Zigbee module may implement only a subset of optional datapoints. Alarm reporting and power/work-mode control (DP202) are lock-dependent, not guaranteed module capabilities.

An exposed optional control that produces no MCU response can indicate that the lock model does not implement that feature; it is not necessarily a Zigbee failure. Do not repeatedly retry unsupported commands. Record actual observations in the [compatibility matrix](supported-locks.md). The converter's existing alarm and DP202 handling is unchanged.

Writable: 21,24,25,26,27,28,48,49,54,55,202. DP58/59/60 remain read-only decoded telemetry. DP39, DP68/69/70, DP205/OTA are not writable. FC00 claim/auth, auth DPs 226/227/230 and DP200 writer have been removed.

No firmware rebuild, firmware flash, automatic lock operations or HA configuration changes are part of this integration. Maintainer real-device regression has passed on the validated TYZS5 target. Optional lock-dependent capabilities such as alarm reporting and DP202 must only be tested where the lock MCU implements them. Lack of DP202 response on a lock that does not support that feature is not a regression.
