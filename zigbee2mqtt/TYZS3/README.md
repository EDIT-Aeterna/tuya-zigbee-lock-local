# TYZS3 experimental / first-flash diagnostic converter

`tuya_ty0a01_tyzs3_candidate.js` fingerprints only `Tuya / TY0A01-TYZS3`.
This is not the legacy SmartHomePlus identity, not the production TYZS5 converter,
and not hardware approval. Do not load another definition with the same fingerprint.

Use the existing external-converter installation procedure, copying this standalone
file to the deployment's external_converters directory and restarting Zigbee2MQTT.
The common-core TYZS5 hardware regression and stock TYZS3 backup/layout review must
pass before any TYZS3 first flash. This task does not install or load the converter
on a live coordinator.

Writes are exclusively structured DP21 and DP54/55: six-digit password staging in
RAM with explicit single execution/expiry, and selected credential type plus explicit
enrollment/cancellation/deletion. Deletion accepts IDs 1..999. Face type 4 is an observed
extension, only for lock MCUs implementing it. Enrollment retains the reviewed
single timeout cancellation; no generic raw writable datapoint helper is registered.

No DP24–28, DP39, DP48/49, DP68–70, DP200/202/205, OTA or FC00 controls are exposed.
Read reports include known unlock events, battery, optional alarm, DP204 module version,
DP54/55 results and DP58/59/60/93 credential lists using one-based shard numbering.
DP93 is an observed extension, not a universal documented capability. MCU product-info
version and module DP204 version are distinct; only the latter is exposed over the
existing diagnostic transport. Firmware requires a matching `ujcjk46o` PID before
lock writes, independently of this UI.

Offline syntax, stubbed module load, structured writer and bitmap tests are included.
Actual Zigbee2MQTT deployment loading and hardware operation remain human gates.
