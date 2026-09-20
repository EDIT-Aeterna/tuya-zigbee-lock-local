# Legacy flasher material

This directory is retained for upstream provenance and historical hardware reference.

It is **not** the supported TZLL flashing workflow.

Current TZLL flashing requirements are documented in:

- [docs/FLASHING.md](../docs/FLASHING.md)
- [docs/HARDWARE.md](../docs/HARDWARE.md)

Important current rules:

- keep verified full backups from the exact module;
- do not use mass/chip erase;
- do not install the historical standalone bootloader;
- select the exact TYZS3/TYZS5 and Control/Monitor release image;
- use a reviewed SWD/Commander procedure and keep a physical fallback available.

`Manual.html`, the historical photos and `rebuild-firmware.bat` are retained as reference material only.
