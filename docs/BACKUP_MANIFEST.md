# Flash Backup Manifest

Status: read-only baseline. Verified on 2026-09-09 (Asia/Shanghai).

## Target

- MCU: `EFR32MG13P732F512GM48`
- Address range: `0x00000000-0x0007FFFF`
- Expected image size: `524288` bytes
- Original PID: `srptwvak`
- Original firmware string: `si32_zg_uart_door_lock_ty_1.2.3`

## Required restore baseline

Paths are relative to the repository root. The files are outside the Git repository and must not be
modified or regenerated.

| File | Size | SHA-256 | Role |
|---|---:|---|---|
| `../backups/ori/original-main-flash-A.bin` | 524288 bytes | `E8352809D83A2FA161947F6043A632E90AD005DAFD4FC11EF6AD484CA545E42A` | Verified full main-flash image |
| `../backups/ori/README_restore.txt` | 252 bytes | `4AC8954DBA616A6063356914F6569E17F056D4F3C679C85E4887224878BF8335` | Restore metadata |
| `../backups/ori/SHA256.txt` | 64 bytes | `52AD017F8693C212CF7612E83FCF640C5B0F44BA6FEB87278C9E554D35FDD91F` | Recorded image hash |

`../backups/original-main-flash-B.bin` is an additional copy. It is also 524288 bytes and has the
same SHA-256 as image A:

`E8352809D83A2FA161947F6043A632E90AD005DAFD4FC11EF6AD484CA545E42A`

## Supplemental artifacts

These files were found but are not part of the required restore manifest:

| File | Size | SHA-256 |
|---|---:|---|
| `../backups/build-id.bin` | 31 bytes | `4ACB97C925A3E0E9C05F8EC2B3C255FF7AFD32B63D3F7F5D98A91E99D31D1081` |
| `../backups/vector-after-flash.bin` | 64 bytes | `408C674CA73B1A11860F2C3058C2C549627ADAD2152983ADB1138E0BF80E70DD` |

## Verification

The required image was checked with `Get-FileHash -Algorithm SHA256` and its length was checked
with `Get-Item`. Both image A and image B matched the hash and size recorded in the task book.

No probe read, chip erase, flash write, bootloader write, or device reset was performed during this
baseline step.
