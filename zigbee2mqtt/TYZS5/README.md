# Zigbee2MQTT converter

`kagel_lock.js` is the external converter that makes Zigbee2MQTT recognise a lock running this
firmware. Without it the lock still joins, but Z2M shows it as an unknown device and can't decode
its datapoints.

It matches on the identity the firmware advertises — model `LCK-BI400`, manufacturer
`SmartHomePlus` — and exposes:

- **actions**: fingerprint / password / card / temporary / dynamic / remote unlock, doorbell, alarms
- **state**: battery, door open/closed, double-lock
- **controls**: allow-remote-unlock, ring tone, and the password-free remote unlock

## Install

1. Copy `kagel_lock.js` into your Zigbee2MQTT data folder under `external_converters/`:

   ```
   <zigbee2mqtt-data>/external_converters/kagel_lock.js
   ```

   On older Zigbee2MQTT builds, instead register it in `configuration.yaml`:

   ```yaml
   external_converters:
     - kagel_lock.js
   ```

2. Restart Zigbee2MQTT.

3. Open permit-join and put the lock into pairing. It joins as **LCK-BI400** and its actions and
   state start appearing on its MQTT topic.

## Notes

- The converter's fingerprint (`LCK-BI400` / `SmartHomePlus`) must match what the firmware
  advertises in the Basic cluster. If you rebrand one, rebrand both.
- Unlock events arrive as `action` values; battery, door and alarm arrive as their own attributes.
- The password-free remote-unlock key is provisioned to the lock on first use and never travels in
  an unlock command — the controller just triggers an open.
