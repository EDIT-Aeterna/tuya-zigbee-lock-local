# TYZS3 known-good baseline for TZLL v1.1.0-alpha.1

T3-2 starts from clean branch `feature/tyzs3-common-core`, HEAD `3ba36fe` (product-info optional OTA trailer hotfix). The maintainer's T3-2 taskbook reports successful hardware validation of this baseline and the TYZS5 common-core regression image. Codex did not perform hardware testing.

| Property | Validated binding |
|---|---|
| Module / SoC | TYZS3 / EFR32MG13P732F512GM48 |
| Zigbee Basic identity | Tuya / TY0A01-TYZS3 |
| Module diagnostic version | T3-1 |
| Tested Tuya Product ID / lock MCU | ujcjk46o / 1.0.0 |
| Firmware write surface | DP21, DP54, DP55, only after verified matching PID |
| Power / OTA | EM1 retained, EM2 disabled; OTA disabled |
| Validated TYZS3 HEX SHA256 | a10da2b79daf8378f60893ed4b2fb68cc586d162b8d4ec86e9acef2fa31ba268 |
| Validated TYZS5 HEX SHA256 | e46e3dc9efa07119d30d677c091dc3a217d3db577fcc6c6d473c35babfd82183 |

`ujcjk46o` is a Tuya Product ID generated for a product definition. TZLL uses it as a tested product/capability binding. PID is not a Zigbee module type, protocol generation or protocol family identifier. Only this product binding and MCU version are covered by the current TYZS3 hardware evidence; no consumer brand/model was supplied.

## Maintainer-reported hardware validation

The supplied taskbook records PASS for pairing/rejoin, Basic identity, Product Info and PID verification, UTC/local-time synchronization, fingerprint/password/card/face unlock events, battery, credential-list telemetry (DP58 fingerprint, DP59 password, DP60 card, DP93 face), DP21 remote password unlock, DP54 enrollment, DP55 deletion and the narrowly gated malformed-length DP54 stage-0 report. TYZS5 common-core hardware regression is also reported PASS.

These are prior maintainer results, not new measurements made during release preparation. The release converter's exact `00 00` empty-list sentinel adjustment receives automated verification here; its final packaged version can receive a maintainer smoke check before publication.

## Repository audit before changes

`git status --short --branch`: `## feature/tyzs3-common-core`, with no modified/untracked files.

```text
3ba36fe fix(firmware): accept product-info JSON without OTA trailer
639ac0d fix(tyzs3): close static identity and first-flash safety gates
5f41ef2 chore(tyzs3): remove copied legacy IDE helper artifacts
2b15d2e feat(firmware): add TYZS3 target skeleton
d4bcdbf refactor(firmware): extract shared residential-lock core
```

Origin: `https://github.com/EDIT-Aeterna/tuya-zigbee-lock-local.git`.
Upstream: `https://github.com/nickieftekhari-dotcom/Door-Lock-TY0A01-with-TYZS3-to-Z2M-firmware.git`.
Existing local tags: `pre-tzll-migration`, `v1.0.0-alpha.1`, `v1.0.0-alpha.2`.

All requested source/tool/test/documentation directories exist. The actual TYZS3 Studio directory is `studio/tyzs3-candidate`; it remains unchanged to preserve build configuration. The release-facing HEX and converter use canonical non-candidate filenames. The candidate converter did not yet recognize `00 00` as an empty list despite the taskbook describing that behavior as verified; T3-2 adds this exact sentinel without accepting arbitrary shard-zero data.
