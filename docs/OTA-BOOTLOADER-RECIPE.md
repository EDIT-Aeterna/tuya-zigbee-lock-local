> [!WARNING]
> **Historical upstream bootloader recipe — not a supported TZLL flashing procedure.** Current TZLL releases disable OTA and do not require or support installing this standalone bootloader. See [FLASHING.md](FLASHING.md) for the supported cable-flash/rollback procedure.

# TYZS3 Lock — OTA bootloader recipe (one-time Studio build)

The only OTA piece that needs Studio generation. Everything else (OTA-client
firmware, app relocation, `.gbl`/`.ota` image, z2m OTA server, converter `ota`)
is hand-built with no generation. Bootloaders essentially never change after
this, so it's a one-time task.

## What to build in Simplicity Studio
1. **File → New → Silicon Labs Project Wizard**, part **EFR32MG13P732F512GM48**.
2. Pick the example: **"Bootloader - Storage Internal (single image on internal flash)"**
   (`bootloader-storage-internal-single`, Series-1). This is a NEW project — a
   different operation from regenerating the lock app, so it should generate even
   though the app regen doesn't.
3. Leave the **bootloader size at its default** (Series-1 = 16 kB, app base `0x4000`).
   Do NOT change it — the app linker is being set to `0x4000` to match.
   Use the **"Bootloader - SoC Internal Storage (single image on 512kB device)"**
   example (matches the part). Its default slot 0x44000/0x30000 leaves only 256 KB
   for the app (0x4000→0x44000) — too tight for our ~247 KB app + OTA client.
4. **Bootloader Storage Slot Setup** — set Slot 0 (FINAL for LZ4, matched to app linker):
   - Start Address = **`0x42000`**
   - Slot Size     = **`0x35000`**  (212 KB, ends at 0x77000 = NVM3 start)
   - single slot (Slot 0 only; Slot 1 off).
   (Slot is bigger than the LZMA plan because LZ4 images are larger; the app is
   slimmed to ~230 KB so it still fits the 0x04000–0x42000 region.)
5. **Compression = LZ4, NOT LZMA.** The Series-1 bootloader region is a fixed
   14 KB and the SHA crypto the GBL parser needs is a locked dependency — LZMA's
   decompressor overflows it by ~3 KB. LZ4's decompressor is tiny and fits.
   Component: **`bootloader_compression_lz4`** ("GBL Compression (LZ4)"). Uninstall
   the LZMA one if the sample added it. (LZ4 compresses less → app is slimmed +
   the slot is enlarged, below.)
6. Build → produce **`bootloader-storage-internal-single.s37`** (and `.hex`).
   Hand me that file; I flash it at `0x0` in the coordinated cable flash.

## Security note
For the first working OTA, a **CRC-only (unsigned)** GBL is fine to prove the
mechanism. For production this is a LOCK, so before shipping we should enable
**secure boot + signed GBL** (bootloader signing key; the `.gbl` is signed by
Commander with the matching private key). Flagging now; not a blocker for bring-up.

## The layout your SLOT0 must match (512 KB, 0x00000–0x80000)
| region | range | size |
|---|---|---|
| Gecko bootloader | 0x00000–0x04000 | 16 KB |
| Application (relocated, slimmed) | 0x04000–0x42000 | 248 KB region (~230 KB used) |
| OTA storage slot (SLOT0, LZ4) | 0x42000–0x77000 | 212 KB (holds ~185 KB LZ4 GBL) |
| NVM3 (pairing) | 0x77000–0x80000 | 36 KB |

If the built bootloader reports a different app base than `0x4000`, tell me and
I'll match the app linker to it.
