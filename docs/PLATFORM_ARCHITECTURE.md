# TZLL platform architecture — T3-3

PID is a Tuya Product ID / product definition binding. It is not a Zigbee module identifier or protocol version. Capability names below are internal TZLL policy names, not official Tuya protocol generations.

| Concept | Owns | Implementation |
|---|---|---|
| Module Target | Basic model, adapter/pins/peripherals, Studio target, EM1/EM2, diagnostic version, flashing target | firmware/TYZS3, firmware/TYZS5, KAGEL_PROFILE, Studio projects |
| Product Binding | Expected PID, tested MCU evidence, quirks, PID write-verification policy, capability reference | firmware/common/lock_product_binding.c/h |
| Capability Profile | Feature flags and separate explicit writable-DP allowlist | firmware/common/lock_capability_profile.c/h |
| Runtime Product Observation | Received/valid state, observed PID/MCU, OTA flag presence/value | lock_product_observation_t inside lock_app_t |

```text
Build configuration -> Module target -> adapter / identity / power
                    -> Expected product binding -> capability profile -> explicit DP policy
MCU Product Info    -> runtime observation -> verify expected binding -> existing write gate
```

The build selects a module and an expected binding independently. Production configurations remain TYZS5+srptwvak and TYZS3+ujcjk46o. Host matrix tests intentionally combine both bindings with both module identities to prove independence; these combinations are not new supported products. Product observation never changes the selected binding or module identity.

## Current policy

| Product binding | Tested MCU evidence | Capability profile | Exact writable DPs | PID required before writes | Quirks |
|---|---|---|---|---|---|
| srptwvak | 1.0.8 | TUYA_LOCK_CAP_EXTENDED_V1 | 21,24,25,26,27,28,48,49,54,55 | No response allowed as before; invalid/wrong reply still blocks | none |
| ujcjk46o | 1.0.0 | TUYA_LOCK_CAP_CORE_V1 | 21,54,55 | Yes | LOCK_QUIRK_DP54_STAGE0_DECLARED_7_ACTUAL_9 |

Tested MCU versions describe evidence only. T3-3 does not introduce a version match gate or change the earlier PID-scoped quirk behavior for other reported MCU versions. The DP54 stage-0 quirk is owned by the ujcjk46o binding, observed on MCU 1.0.0. CORE_V1 does not imply it; a synthetic second CORE_V1 binding without the quirk rejects the malformed report.

Capability flags preserve the former differentiated feature metadata: temporary-password, password-free and face-credential support. They are not permission grants or a universal sensor inventory. `lock_capability_dp_writable()` consults only explicit arrays, independently of flags. All payload-specific validators and atomic EF00 validation remain required after the allowlist check. Neither target allows DP39,68–70,200,202,205/OTA; production FC00 writes stay disabled. No converter behavior changes.

## Product observation and verification

The serial dispatcher accepts full pure JSON by default. It removes one trailing OTA byte only when the penultimate byte is `}` and the last is exactly 0x00/0x01. Presence and capability are recorded separately. The existing strict bounded flat-JSON grammar moved to the product-binding layer; it was not broadened.

`received` means a Cmd01 callback arrived; `valid` means the latest JSON has a syntactically valid nonempty PID, not that it matches or permits writes. PID length is retained before bounded copying so truncation cannot turn a long PID into a match. Observed MCU strings never mutate static tested metadata. Optional MCU version remains optional. Invalid JSON leaves last parsed PID/MCU strings for diagnostics, marks valid=false, and still triggers the original sticky rejection. OTA metadata describes the latest response; it never enables OTA.

The existing `pid_verified` and sticky `pid_mismatch` gate remain in lock_app. Wrong/missing/malformed/empty identity information cancels pending writes and blocks until reinitialization. A later matching reply cannot clear the latch. Read/report processing continues. `product_info_seen` means any valid JSON has been received, independent of the latest observation's validity; this preserves the one-time deferred retry after complete MCU activity. No response alone does not latch mismatch.

Only the product-binding layer performs raw PID comparison. General control code follows the selected binding's capability profile and explicit allowlist, with product quirks copied to the serial context at initialization. The retained `kagel_control_dp_allowed(dp)` API delegates to `lock_binding_default()->capability_profile`; it remains on the real control path and defined in both ELFs. The app is initialized with that same static binding; runtime rebinding is not supported. The old lock_profile.c/h policy was removed, not retained as a second authority. The historical compile define `LOCK_PROFILE_UJCJK46O` is retained as a binding selector for existing build commands; it does not choose a radio model or power policy. The module header no longer requires a particular PID selector.

## Preserved module policy and limits

TYZS5 remains Tuya / TY0A01-TYZS5, module version 1.0.2. TYZS3 remains Tuya / TY0A01-TYZS3, module version T3-1, EM2 disabled/EM1 retained. Pin/peripheral setup, Zigbee transport, NVM3, bootloader and OTA policy remain unchanged. Existing module safety macro names and diagnostic build labels are retained to avoid unrelated churn.

Timezone remains 28800 seconds on bindings to preserve behavior. TODO: timezone is deployment/site configuration, not a product capability. Runtime/site timezone configuration is future work.

Multiple future PIDs may map to the same capability profile. Automatic observed-PID binding lookup, generic unknown-PID read-only fallback and converter commonization are not implemented. Unknown products currently follow the existing expected-binding rejection policy. No dynamic-password algorithm, new controls, converter entities or public release is introduced.

See [T3-3 verification report](T3_3_PLATFORM_CLEANUP_REPORT.md) for pre/post characterization, current builds and the required maintainer hardware regression.
