# Temporary password protocol

## TARGET_SRPTWVAK

DP24 is verified from target hardware as a 27-byte RAW value: prefix(6),
start(4), end(4), opaque reserved(6), one_time(1), and six ASCII digits.
The validator requires reserved bytes zero, one_time 0/1, and start < end.

## GENERIC_TUYA_ONLY / TARGET_UNVERIFIED

DP25, DP27, and DP28 are TARGET_SRPTWVAK VERIFIED as 6-byte RAW reference
requests. DP26 is TARGET_SRPTWVAK VERIFIED and uses the same 27-byte layout
as DP24. DP39 is DISABLED / NO TARGET CAPTURE.

Each EF00 request contains exactly one complete DP unit and is validated before
any UART side effect. No password or credential data is stored in NVM3 or
printed, and no application-layer retry is added. DP39 is destructive and
requires explicit UI confirmation.
