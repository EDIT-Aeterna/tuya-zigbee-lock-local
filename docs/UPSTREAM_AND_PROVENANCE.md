# Upstream relationship and provenance

TZLL originated from:

- **Upstream repository:** [nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware](https://github.com/nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware)
- **Original author:** Nicki Eftekhari / `nickieftekhari-dotcom`

The upstream project remains an active TYZS3-focused replacement-firmware project. This document describes TZLL's relationship to that codebase; it does not replace Git history or file-level provenance.

Comparison below was reviewed against upstream `main` at commit:

```text
3822b191fddfe822df8c9cba43e4bb0b7f2dde5e
```

and TZLL `main` after v1.2 repository hardening/hygiene.

## Where TZLL came from

The original project established the core idea and important implementation foundations:

- replacement firmware for a Tuya residential lock's TYZS3 / EFR32MG13 module;
- MCU-side UART bridging and lock datapoint handling;
- local Zigbee2MQTT integration;
- EFR32 application/adapter code;
- protocol, hardware and flashing documentation;
- an OTA/bootloader path in the upstream design.

TZLL preserves attribution and Git history for this lineage.

## How TZLL has evolved

TZLL is no longer a small patch set over a single-target TYZS3 firmware. Its current architecture and product scope differ substantially:

| Area | Upstream project | TZLL v1.2 |
|---|---|---|
| Module targets | TYZS3-focused | TYZS3 + TYZS5 |
| Firmware organization | single firmware tree | shared common core + per-module targets |
| Product selection | device-specific implementation | Product Binding abstraction |
| Feature policy | direct implementation | neutral Capability Profiles + explicit write allowlists |
| User access model | control-oriented | independent Control / Monitor Access Editions |
| Monitor mode | not a separate product model | firmware write surface empty + read-only converter |
| Zigbee identities | single TYZS3 integration | four module/edition identities |
| Zigbee2MQTT | one primary converter | separate TYZS3/TYZS5 Control and Monitor definitions |
| Safety gate | upstream behavior | PID/binding gates + explicit access-policy layer |
| Credential sync | upstream-specific support | validated DP58/59/60/93 bitmap semantics and empty sentinel |
| OTA strategy | upstream supports OTA/bootloader workflow | OTA intentionally disabled in current TZLL releases |
| Validation | upstream project tests/field work | host fixtures, binding/profile tests, exhaustive Monitor deny tests, converter tests, four-edition release audit |
| Project operations | compact repository | releases, compatibility matrix, Security/Contributing docs, issue forms, current-policy GitHub Actions |

These differences are architectural and product-level, not only UI or naming changes.

## What is still derived

TZLL is **not** a clean-room rewrite.

Several low-level implementation areas retain direct lineage from upstream, including EFR32 application code, serial/protocol code, selected hardware/build material, protocol/hardware documentation and historical flasher/OTA material.

Examples of visibly retained lineage include files such as:

```text
nicki_ek_lock_serial.c/.h
app.c
efr32_app.c
main.c
docs/PROTOCOL.md
docs/HARDWARE.md
```

Some files have been moved, adapted or substantially modified, but modification does not erase their provenance.

## Current project identity

A concise description of the relationship is:

> **TZLL originated from Nicki Eftekhari's TYZS3 → Zigbee2MQTT replacement firmware and has since evolved into a multi-target local lock platform with separate Product Binding, Capability Profile and Control/Monitor access-policy architecture.**

This wording acknowledges both facts:

1. TZLL has a clear upstream code lineage.
2. TZLL's current scope and architecture have diverged substantially from the original project.

## Licensing status

The upstream repository currently does not contain an explicit LICENSE file.

TZLL therefore does **not** apply a blanket MIT/GPL/Apache license to upstream-derived code. See:

- [NOTICE.md](../NOTICE.md)
- [LICENSE_RECOMMENDATION.md](LICENSE_RECOMMENDATION.md)

This is project-governance documentation, not legal advice. If the upstream author later grants explicit permission or a license is clarified, TZLL can revisit file-level and project-level licensing.
