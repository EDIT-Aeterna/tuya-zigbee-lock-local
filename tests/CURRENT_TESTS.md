# Current test policy

GitHub CI runs `python tools/run_current_ci.py`.

The current gate includes:

- Stage 1.1 UTC/local time integration;
- Stage 2B adapter;
- current atomic EF00 integration;
- Stage 2F-R;
- Stage 2G credential and legacy gate paths;
- Product Binding / Capability Profile characterization;
- common-core tests for both current bindings;
- four-way Control/Monitor access tests;
- fixture corpus;
- credential bitmap/vector tests;
- TYZS3 Control converter tests;
- Monitor converter read-only/passive tests;
- syntax checks for all four canonical converters.

Full Silicon Labs firmware matrix builds are not run on GitHub-hosted runners because the Gecko SDK/Simplicity Studio toolchain is external. Release builds remain a separate reproducible maintainer gate.
