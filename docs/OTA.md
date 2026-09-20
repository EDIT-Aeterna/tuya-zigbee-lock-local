> [!WARNING]
> **Historical upstream OTA documentation.** OTA is disabled in current TZLL releases, and the current release firmware is intentionally audited without OTA write/install paths. Do not install the historical bootloader or follow this procedure on a TZLL lock. This file is retained only for provenance and future research.

# Wireless firmware updates (OTA)

Once the lock is assembled the SWD pads are sealed away, so **over-the-air update is the
only way to change the module firmware afterwards.** This firmware ships a complete Zigbee
OTA path, so a running lock can be updated from your own Zigbee2MQTT — no cable, no cloud.

Proven on hardware: a lock updated **1.0.0 → 1.0.1** entirely over the air.

## The pieces

| Layer | What it does |
|---|---|
| **OTA client** (in the firmware) | Hand-rolled ZCL **OTA Upgrade cluster 0x0019** client: QueryNextImage → ImageBlock loop → UpgradeEnd. Writes the received image into the bootloader's storage slot. |
| **Gecko bootloader** (`../firmware/kagel-lock-bootloader.s37`) | A separate Silicon Labs bootloader in its own flash region (`0xFE10000` on this Series-1 part). On reboot it validates the staged image and flashes it. The app itself stays at `0x0` — no relocation. |
| **`.ota` image + `make-ota.js`** | Wraps a compressed firmware image (**GBL**, LZ4) in the Zigbee OTA file format (magic `0x0BEEF11E`: a 56-byte header + a sub-element, then the GBL). |
| **Zigbee2MQTT** | Serves the `.ota` to the lock through its OTA override index — the OTA *server* on the radio side. |

## How an update flows

```
  build firmware.ota  →  drop it in z2m's OTA folder + override index
        →  trigger the update (z2m: ota_update)  →  z2m streams the image
        →  the lock's OTA client writes it to the bootloader slot  →  UpgradeEnd
        →  lock reboots → bootloader validates + flashes the GBL → runs the new
           firmware and reports its new version.  A bad/incomplete image is
           rejected → the lock stays on its current firmware (safe).
```

## Serving an update from your Zigbee2MQTT

1. Put the `.ota` in z2m's data dir, e.g. `data/ota/firmware-1.0.1.ota`.
2. Add an override index `data/ota-index.json` listing it — **`url` is RELATIVE to the data dir** (not `file://`):
   ```json
   [{"fileVersion":16777217,"fileSize":200826,"manufacturerCode":4098,"imageType":1,"url":"ota/firmware-1.0.1.ota"}]
   ```
3. In `configuration.yaml`:
   ```yaml
   ota:
     zigbee_ota_override_index_location: data/ota-index.json
   ```
   Restart z2m. (The converter already has `ota: true`.)
4. Trigger: the z2m frontend's **Check for updates / Update** on the lock, or publish to
   `zigbee2mqtt/bridge/request/device/ota_update/update`. Watch it stream (~200 KB; a sleepy
   device ≈ 14 min), then reboot into the new firmware.

## The apply detail (why images land correctly)

The bootloader looks for the **GBL magic `0xEB17A603` at offset 0** of its storage slot. The
`.ota` file is `[OTA header] + [sub-element header] + [GBL]`, so the OTA client **skips the
wrapper and writes only the GBL** to slot offset 0 — otherwise the bootloader sees the OTA
magic and rejects it. It buffers into word-aligned pages (Series-1 flash requires it). Slot
geometry: **start `0x42000`, size `0x35000`** (fits the ~200 KB LZ4 image, ends below NVM3).

## Versioning

Two defines in `../firmware/efr32_app.c`, kept in step:

```c
#define KAGEL_FW_VERSION      "1.0.1"       // string the lock reports
#define KAGEL_FW_VERSION_U32  0x01000001u   // OTA fileVersion (major.minor.patch → 0xMMmmpppp)
```

**The version is compiled into the firmware.** The lock reports whatever string is baked in —
the `.ota`'s version label can't change it. So a "test" `.ota` that re-wraps an old build with a
higher label downloads and applies fine, but the lock still reports the old number (and z2m keeps
re-offering it). To move the number, bump both defines and rebuild.

## Cutting a release

1. Bump `KAGEL_FW_VERSION` + `KAGEL_FW_VERSION_U32` in `efr32_app.c`, rebuild → `.s37`.
2. `commander gbl create out.gbl --app <build>.s37 --compress lz4`.
3. `node ../firmware/make-ota.js out.gbl firmware-<ver>.ota 0x0100000X` → the `.ota`.
4. Serve it from z2m (above). Locks download + apply it and report the new version.

## Safety

- Device firmware is **CRC-checked, not signed** (integrity, not authenticity) — a deliberate
  local-first choice. Signed images (secure boot) are a future hardening step and need the
  larger bootloader variant.
- The bootloader keeps the current firmware on any failed/interrupted flash, so a dropped OTA
  never bricks a lock.
- Never interrupt an in-progress apply over SWD — let the bootloader finish.
