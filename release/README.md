# Historical in-repository release staging

Older TZLL alpha staging directories were previously committed under `release/`.

They have been removed from the current source tree because the canonical published assets are preserved by GitHub Releases:

- https://github.com/EDIT-Aeterna/tuya-zigbee-lock-local/releases

The old staging files remain available through Git history/tags if release archaeology is needed.

Current release packaging is reproducible via:

```text
python tools/package_v1_2_release.py
```

Generated release output belongs under `artifacts/release/` and is ignored/not committed as normal source.
