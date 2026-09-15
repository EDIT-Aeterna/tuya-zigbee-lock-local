# Credential management protocol

DP54 supports target verified password, card, and fingerprint enrollment
start/cancel requests. DP55 supports target verified single deletion for the
same three credential classes. DP54 report byte 0 remains an opaque target
field and is not interpreted as credential type.

DP58, DP59, and DP60 are read-only MCU-to-hub synchronization reports. DP39,
delete-all, remote administrator creation, offline password management, and
OTA remain forbidden. Credential data is managed by the lock MCU and is not
stored by TYZS5.
