# Reproduce v1.2.0-alpha.1 release preparation

Run from a clean checkout of the release-preparation commit:

```powershell
python tools/package_v1_2_release.py --sdk C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk
```

Requirements: the existing Windows SLC/ZAP/Simplicity Studio toolchain, ARM GCC 12.2.rel1, make, Python 3, Node.js and host GCC at C:/msys64/ucrt64/bin/gcc.exe. Original Studio configuration and firmware sources are not changed. The same matrix generator performs Generate + Clean + Build four times; only evidence output paths are configurable. Public HEX files are copies, never conversions.

The script requires clean Git state, verifies the unchanged firmware/Studio inputs and existing Control definitions against 65417b2, reruns host/access/converter checks, rebuilds all four images, and stops immediately if any hash differs from maintainer-validated candidates. It never flashes, tags, pushes or calls GitHub APIs.

Outputs (ignored by Git so HEAD remains the exact clean build source):

- artifacts/release-work/v1.2.0-alpha.1/: complete local build/test logs, ELF/config/disassembly evidence.
- artifacts/release/v1.2.0-alpha.1/: allowlisted public release files and final audit.
- artifacts/release/TZLL-v1.2.0-alpha.1.zip: validated package, independently extracted and checksum-checked.

Existing completed release output is not overwritten. Move it aside if intentionally rebuilding. Failed-run local evidence may be refreshed on retry. No old backups are removed.

The reviewer Monitor test is preserved unchanged in tests/reviewer-monitor/. Its runner copies exact canonical definitions alongside it in a temporary directory. Supplemental tests cover both Monitor passive mappings and all four fingerprints. Control regression assertions remain unchanged.

Historical reviewer conflicts are retained: Stage2D-only, Stage2E-A DP49 prohibition, Stage2E-B old DP49 format and pre-2F-R temp-password assertions conflict with the validated later policy. The host runner intentionally returns nonzero for those old assertions. Packaging accepts only the exact recorded baseline outcome map and fails on any new/changed failure. It does not suppress test output or rewrite reviewers.

The four-build auditor now permits documentation and new Monitor definitions, but freezes all firmware/Studio inputs and existing Control definitions at the validated T3-4A baseline. Its prior T3-4A requirement that README and all zigbee2mqtt files remain unchanged is phase-specific and incompatible with this release integration; only that source-scope check is updated. Identity, allowlist, OTA, NVM3 and compiled-policy checks are retained.

Monitor files use path-specific Git -text attributes to preserve their validated bytes. TYZS5 Control checkout bytes remain unchanged. TYZS3 Control may use either the existing CRLF checkout or the previously released LF representation; only the two recorded hashes and the exact normalized Git blob are accepted. The manifest records which bytes were packaged.

SHA256SUMS.txt covers every file except itself. The manifest records hashes of payload assets (firmware, converters and docs); generated manifest/audit/checksum files identify their generating commit, with hashes in SHA256SUMS where non-circular. ZIP SHA256 is reported separately, avoiding recursive self-checksum claims.

Hardware PASS statements come from the supplied release taskbook, not from Codex. Stop with the complete audited package for maintainer review and manual publication.
