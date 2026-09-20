# Historical reviewer tests

These tests preserve expectations from earlier development stages that were intentionally superseded by the current reviewed policy.

They remain in the repository for release archaeology and reproducibility, but **they are not part of the current-policy CI gate**:

- `tests/stage2dr_control_gate_test.c` — older DP21-only expectation.
- `tests/stage2ea_ef00_integration_test.c` — older DP49-forbidden expectation.
- `tests/stage2eb_ef00_integration_test.c` — older DP49 method expectation.
- `tests/stage2f_ef00_integration_test.c` — pre-2F-R DP39 / DP26 policy.

`tools/run_t3_host_tests.py` intentionally retains these historical tests and may therefore exit non-zero while reproducing the v1.2 validation baseline.

For active development and pull requests use:

```bash
python tools/run_current_ci.py
```

Do not rewrite historical assertions merely to make an aggregate status green. If policy changes again, update current tests and document why.
