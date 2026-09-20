# Building TYZS5 firmware

This directory contains the TYZS5 target adapter/source used by the shared TZLL firmware core.

For normal users, use the versioned HEX from the matching GitHub Release. Do **not** look for a prebuilt `kagel-lock.hex` in this source directory.

## Current architecture

Shared protocol/application policy lives in:

```text
firmware/common/
```

TYZS5 target-specific code/configuration lives in:

```text
firmware/TYZS5/
studio/tyzs5-telemetry/
```

The current platform separates Product Binding, Capability Profile and Access Edition. TYZS5 supports two build editions:

| Edition | Basic identity | External control policy |
|---|---|---|
| Control | Tuya / TY0A01-TYZS5 | validated profile allowlist |
| Monitor | Tuya / TY0A01-TYZS5-MON | empty external write surface |

## Supported build entry points

Build one edition:

```powershell
tools/build_tzll.ps1 -Module TYZS5 -Edition Control -SdkRoot <gecko_sdk>
tools/build_tzll.ps1 -Module TYZS5 -Edition Monitor -SdkRoot <gecko_sdk>
```

Build the full 2×2 TYZS3/TYZS5 matrix:

```powershell
tools/build_all_editions.ps1 -SdkRoot <gecko_sdk>
```

The build helper derives an isolated generated Studio project under:

```text
studio/tzll-<module>-<edition>-generated/
```

Those directories and all `studio/*/build/` outputs are intentionally ignored by Git. Maintained source/configuration remains in the original Studio inputs plus `firmware/common`.

## Toolchain

The reviewed project uses Silicon Labs Simplicity Studio / Gecko SDK with EFR32MG13P732F512GM48 support. The repository scripts call SLC generation, ZAP generation, clean, then make.

Pass your local Gecko SDK path explicitly with `-SdkRoot`; the default path in helper scripts is only a maintainer convenience and is not portable.

## Control compatibility build

`tools/build_stage2br.ps1` remains as a historical-compatible TYZS5 Control build entry. New development should prefer the edition-aware `build_tzll.ps1` / `build_all_editions.ps1` path.

## Host tests

Current pull-request CI runs:

```text
python tools/run_current_ci.py
```

This covers the portable common core, access policy, fixtures and converter tests without the Silicon Labs SDK. Full firmware builds remain a separate maintainer/release gate.

## OTA / bootloader note

The files `kagel-lock-bootloader.hex`, `kagel-lock-bootloader.s37` and `make-ota.js` are retained from the upstream OTA work for provenance/research only.

**OTA is disabled in current TZLL releases. Do not flash the historical standalone bootloader as part of a supported TZLL installation.**

See [../../docs/FLASHING.md](../../docs/FLASHING.md) and the warning in [../../docs/OTA.md](../../docs/OTA.md).
