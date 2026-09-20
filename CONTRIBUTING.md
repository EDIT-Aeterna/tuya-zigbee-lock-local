# Contributing to TZLL

Thanks for helping improve Tuya Zigbee Lock Local.

## Before opening a change

Read:

- [README](README.md)
- [Access Editions](docs/ACCESS_EDITIONS.md)
- [Platform Architecture](docs/PLATFORM_ARCHITECTURE.md)
- [Supported Locks](docs/supported-locks.md)
- [Security Policy](SECURITY.md)

TZLL distinguishes **Module Target**, **Product Binding**, **Capability Profile** and **Access Edition**. New compatibility should be described in those terms instead of assuming that every TYZS3/TYZS5 lock behaves identically.

## Compatibility reports

Use the compatibility issue template when possible. Helpful reports include:

- brand/model and clear module/mainboard photos;
- TYZS3/TYZS5 marking;
- Tuya PID and lock MCU version if observed;
- exact TZLL firmware edition and Zigbee `modelIdentifier`;
- converter version;
- tested feature matrix and unusual datapoints.

Remove real passwords, administrator credentials, Zigbee network keys, private stock backups and other household-sensitive data before posting.

## Code changes

Prefer small, reviewable changes. For firmware policy changes:

- keep write permissions explicit;
- do not infer permissions from feature flags;
- keep product-specific quirks on Product Bindings;
- preserve the Monitor empty external-write surface;
- do not broaden OTA, raw writers or generic control paths without a dedicated design/review.

For Zigbee2MQTT changes, keep Control and Monitor fingerprints mutually exclusive and do not add writable Monitor exposes.

## Tests

Current CI uses `python tools/run_current_ci.py` and intentionally excludes four superseded historical reviewer expectations. Those tests remain documented under [tests/historical](tests/historical/README.md) for release archaeology and should not be silently rewritten.

Firmware matrix builds require the Silicon Labs Gecko SDK / Simplicity Studio toolchain and are not currently run in GitHub-hosted CI.

## Pull requests

A PR should explain:

- what changed;
- which module/binding/edition is affected;
- whether wire behavior or writable policy changes;
- tests performed;
- hardware validation, if any;
- rollback implications for firmware changes.

Do not describe automated/static checks as hardware validation.

## Licensing and provenance

The upstream project currently has no explicit LICENSE file. TZLL therefore does not apply a new blanket MIT/GPL/Apache license to upstream-derived code. See [NOTICE.md](NOTICE.md) and [license guidance](docs/LICENSE_RECOMMENDATION.md).

Only contribute material you have the right to submit. Substantial code copied from another project should include clear provenance so its licensing can be reviewed.
