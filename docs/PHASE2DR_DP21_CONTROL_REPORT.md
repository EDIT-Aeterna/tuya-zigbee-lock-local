# Stage 2D-R DP21 control report

Status: Stage 2D-R offline implementation PASS. No hardware was connected or
flashed. Stage 2D-R does not open DP48/DP49 or OTA.

- Q1: one `remote_unlock` produces one DP21 application command; wake handshake
  retries do not duplicate the application command.
- Q2: DP21 requires exactly six ASCII digits.
- Q3: cmd `0x04` ACK is transport acceptance, not unlock success.
- Q4: DP22 true/false remains the final business result through telemetry.
- Q5: DP41 remains an audit record through telemetry.
- Q6: DP48 reaches the MCU: No.
- Q7: DP49 reaches the MCU: No.
- Q8: other credential-management DP reaches the MCU: No.
- Q9: OTA write/install path enabled: No.
- Q10: hardware flashed: No.

The build retains `KAGEL_TELEMETRY_ONLY=1` and adds the separate
`KAGEL_DP21_ONLY=1` mode. EF00 parsing calls the DP21 gate and validator before
calling `tls_send_dp`; the generic donor forwarding path is not restored.

Validation: Stage 2D-R reviewer v2 reports `AUDIT RESULT: 0 failure(s)`;
Stage 2B-R reviewer v2 passes; Stage 1.1 target audit and fixture corpus pass;
fixture runner reports 35 passed, 0 failed, 0 awaiting hardware. Final ELF
defines `kagel_control_dp_allowed`, `kagel_validate_dp21`, and `tls_send_dp`,
while all four dangerous OTA symbols are absent.
