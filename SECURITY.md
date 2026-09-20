# Security Policy

TZLL controls or observes physical door locks. Treat firmware, Zigbee2MQTT, Home Assistant and coordinator security as part of one system.

## Supported release line

The current maintained prerelease line is **v1.2.x**. Older alpha releases are retained for history and rollback evidence but may not receive fixes.

## Access Editions

### Monitor Edition

Monitor is read-only from the normal Home Assistant / Zigbee2MQTT control perspective:

- the Monitor converter has no lock-control `toZigbee` writers;
- Monitor firmware denies externally-originated lock-control DPs;
- required MCU protocol traffic such as wake, Product Info, time sync and ACKs still operates.

This reduces the remote-control attack surface. It is **not** a security certification and does not guarantee zero risk.

### Control Edition

Control intentionally exposes the validated write surface for the selected Product Binding / Capability Profile. Use it only when remote lock-control features are actually required.

## Threats outside this policy boundary

TZLL does not claim to prevent:

- physical access to SWD/UART or replacement of the module;
- compromise of the Zigbee network/coordinator, Home Assistant host or MQTT broker;
- vulnerabilities in the lock MCU, motor controller, keypad/fingerprint hardware or mechanical lock;
- malicious or modified third-party firmware/converters;
- disclosure caused by users posting passwords, network keys, stock backups or other secrets.

Keep a physical fallback available while testing and preserve an exact-device stock backup before flashing.

## Reporting a vulnerability

Do **not** post passwords, Zigbee network keys, private stock dumps, exploit details for an unpatched issue, or household-sensitive logs in a public issue.

If GitHub shows **Report a vulnerability** for this repository, use that private reporting path. Otherwise, open a minimal public issue titled `Security report — private contact requested` without sensitive technical details so the maintainer can establish a private channel.

For non-sensitive security hardening suggestions, normal GitHub issues are fine.

## Security-relevant regression requirements

Changes affecting lock control should preserve at minimum:

- exact Control writable-DP allowlists;
- exhaustive Monitor external-write denial;
- Product Binding / PID gates;
- Monitor converter read-only structure;
- OTA-disabled policy unless a separately reviewed future design explicitly changes it.

See [Access Editions](docs/ACCESS_EDITIONS.md) and [Platform Architecture](docs/PLATFORM_ARCHITECTURE.md).
