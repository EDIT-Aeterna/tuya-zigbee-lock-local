# Stage 2E-A DP48 provision report

Status: Stage 2E-A offline implementation PASS. No hardware was connected,
flashed, erased, joined, or used for DP48 testing. Stage 2E-B/DP49 has not started.

- Q1 DP21 remains available: **Yes**.
- Q2 DP48 is the only newly enabled control DP: **Yes**.
- Q3 DP48 uses the narrow target profile: **Yes** — one RAW 21-byte unit,
  enable 1, key ID 1, increasing validity window, use count FFFF, eight ASCII digits.
- Q4 Does TYZS5 generate a remote key: **No**.
- Q5 Does TYZS5 write the key to NVM3: **No**.
- Q6 Can DP49 reach the lock MCU: **No**.
- Q7 Can other credential/password-management DP reach the MCU: **No**.
- Q8 Is OTA write/install enabled: **No**.
- Q9 Has hardware been flashed: **No**.

Build mode is `KAGEL_TELEMETRY_ONLY=1` plus `KAGEL_DP21_DP48_ONLY=1`.
EF00 remains atomic and accepts exactly one DP unit per request. The gate allows
only DP21 and DP48; DP48 validation is structural and does not retain key bytes.

Validation:

- DP48 reviewer: `AUDIT RESULT: 0 failure(s)`.
- DP48 EF00 integration: `ALL PASS (0 failures)`.
- Stage 2B-R v2: PASS.
- Stage 1.1 target audit and fixture corpus: PASS.
- Fixtures: `35 passed, 0 failed, 0 awaiting hardware`.
- Final ELF defines `kagel_control_dp_allowed`, `kagel_validate_dp21`,
  `kagel_validate_dp48`, and `tls_send_dp`; dangerous OTA symbols are absent.

The older Stage 2D-R reviewer still requires DP48 to be rejected and therefore
is superseded by Stage 2E-A's DP21+DP48 policy; its script was not modified.
