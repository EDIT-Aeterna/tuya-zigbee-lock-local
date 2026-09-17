# TYZS3 converter v0.1.0

Initial hardware-validated TYZS3 integration. Canonical file: `tuya_ty0a01_tyzs3.js`, fingerprint only `Tuya / TY0A01-TYZS3`. Tested product binding: `ujcjk46o / MCU 1.0.0`. This is initial support, not a universal TYZS3 compatibility claim.

Install using the [TYZS3 guide](../../docs/tyzs3-guide.md) / [中文指南](../../docs/tyzs3-guide.zh-CN.md). Remove the old candidate file from active registration before installing this canonical filename. Do not load duplicate fingerprints. Outside GitHub, distribute the converter inside the release ZIP.

Writes remain exactly structured DP21/54/55. DP21 uses six ASCII digits staged in RAM with explicit single execution and expiry. Enrollment/deletion require explicit type and action; deletion accepts IDs 1..999. Face type 4 is lock-dependent. Existing enrollment timeout cancellation is retained. No generic writable DP handler is installed.

No DP24–28, DP39, DP48/49, DP68–70, DP200/202/205, OTA or FC00 controls. Firmware independently requires a verified matching PID before accepting writes.

Read/report surface: actions and last-unlock metadata, battery, alarm if reported, DP204 module diagnostics, DP54/55 results, DP58/59/60/93 credential lists. MCU product-info version and DP204 module version are distinct. One-based shards are retained; the exact `00 00` sentinel means empty list/count zero. DP93 is an observed/validated face-list extension, not a universal numeric assignment from the older public DP table.

Dispatch/status fields are diagnostic: converter dispatch of a Zigbee command does not prove that the lock MCU executed it. Confirm MCU result/local behavior before retrying.

The former diagnostic integration passed maintainer hardware checks. Promotion preserves all writers and adds the taskbook-required empty-list sentinel missing from the repository. Syntax, stubbed module loading, captured vectors and writer invariance pass automated tests; final-package smoke testing is a maintainer action.

Legacy `SmartHomePlus / LCK-BI400` converters are reference only and not for current TZLL firmware. Do not load overlapping legacy definitions together. The production TYZS5 converter remains separately maintained as Stable v1.2.2 and is unchanged.
