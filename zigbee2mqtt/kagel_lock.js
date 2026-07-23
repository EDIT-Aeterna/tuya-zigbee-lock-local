// Z2M external converter — SmartHomePlus Zigbee door lock, model LCK-BI400.
// Our own-brand firmware (custom TYZS3 build) advertises Basic
// manufacturerName="SmartHomePlus", modelID="LCK-BI400" and rides lock data over
// the EF00 vendor datapoint cluster (server->client reports), so nicki_ek.fz.datapoints
// decodes it.
//
// DP TABLE = the AUTHORITATIVE per-PID shadow from the vendor developer platform
// (cloud /shadow/properties for this exact PID, supplied by Nicki 2026-07-15).
// 38 DPs, mapped 1:1 — keys below use the exact vendor schema codes:
//   Unlock events (value, momentary): 1 unlock_fingerprint, 2 unlock_password,
//     3 unlock_temporary, 4 unlock_dynamic, 5 unlock_card, 6 unlock_face,
//     7 unlock_key, 41 unlock_remote, 45 unlock_hand, 62 unlock_voice_remote
//   Event bools (momentary): 14 doorbell, 35 hijack, 36 open_inside
//   Status: 8 open_close (door), 9 alarm_lock (enum), 10 residual_electricity
//     (battery), 22 remote_result (bool)
//   Config: 23 remote_unlock_switch (bool)
//   Remote unlock: 21 remote_unlock (raw, 6-digit ASCII password),
//     48 remote_no_pd_setkey + 49 remote_no_dp_key (key-based, password-free)
//   Temp-password mgmt (raw): 24 password_creat, 25 password_delete,
//     26 password_update, 27 password_disable, 28 password_enable,
//     39 password_reset
//   Offline password: 68 unlock_offline_pd, 69 unlock_offline_clear,
//     70 unlock_offline_clear_single (raw), 91 password_offline_time (string)
//   Enrollment mgmt (raw): 54 unlock_method_create, 55 unlock_method_delete
//   Sync (raw): 58 update_all_finger, 59 update_all_password,
//     60 update_all_card, 93 update_all_face
//   Records: 92 lock_record (raw unified log)
// NOTE: this PID has NO DP12/13/15/40/44/46/47/50-53/56/57/61 — no persistent
// lock-state DP; the hub derives Locked/Unlocked from unlock events + DP8.
// z2m's datapoint helper library. The require PATH is a real file inside
// node_modules and therefore cannot be renamed; the local binding can.
const nicki_ek = require('zigbee-herdsman-converters/lib/tuya');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const {Zcl} = require('zigbee-herdsman');
const e = exposes.presets;
const ea = exposes.access;

// ---- Kagel hub-lock anti-clone claim channel (custom cluster 0xFC00) ----
// hub->module: claim(1, 131B blob), hubResponse(4, hub_id||nonce||mac).
// module->hub: kbind(2, hub_id||k_bind), modChallenge(3, nonce), modResponse(6, mac).
// Firmware sends module->hub as SERVER_TO_CLIENT (commandsResponse). One var-length
// byte field per command carries the raw payload.
const P = [{name: 'data', type: Zcl.BuffaloZclDataType.LIST_UINT8}];
const KAGEL_FC00 = {
    ID: 0xfc00,
    attributes: {},
    commands: {
        claim: {ID: 1, parameters: P},
        hubResponse: {ID: 4, parameters: P},
        hubChallenge: {ID: 5, parameters: P},
    },
    commandsResponse: {
        kbind: {ID: 2, parameters: P},
        modChallenge: {ID: 3, parameters: P},
        modResponse: {ID: 6, parameters: P},
    },
};
const hex = (arr) => Buffer.from(arr).toString('hex');

// z2m doesn't resolve 0xFC00 to our custom cluster on RECEIVE (delivers it 'raw'),
// so parse the raw ZCL frame ourselves: [frameControl | seq | cmd | payload...].
// cmd 2=kbind(hub_id||k_bind), 3=modChallenge(nonce), 6=modResponse(mac).
const fzFc00 = {
    cluster: 64512,
    type: ['raw'],
    convert: (model, msg) => {
        const b = Buffer.from((msg.data && msg.data.data) || msg.data || []);
        if (b.length < 3) return;
        const cmd = b[2];
        const payload = hex(b.subarray(3));
        if (cmd === 2) return {kagel_kbind: payload};
        if (cmd === 3) return {kagel_mod_challenge: payload};
        if (cmd === 6) return {kagel_mod_response: payload};
    },
};
const tzFc00 = {
    key: ['kagel_claim', 'kagel_hub_response', 'kagel_hub_challenge'],
    convertSet: async (entity, key, value, meta) => {
        const bytes = [...Buffer.from(String(value), 'hex')];
        const cmd = key === 'kagel_claim' ? 'claim'
                  : key === 'kagel_hub_response' ? 'hubResponse' : 'hubChallenge';
        await entity.command('kagelFc00', cmd, {data: bytes}, {disableDefaultResponse: true});
        return {state: {[key]: String(value)}};
    },
};

// DP9 alarm_lock enum order per the Residential Lock DP Reference (v20240613).
const alarmLookup = {
    0: 'wrong_finger', 1: 'wrong_password', 2: 'wrong_card', 3: 'wrong_face',
    4: 'tongue_bad', 5: 'too_hot', 6: 'unclosed_time', 7: 'tongue_not_out',
    8: 'pry', 9: 'key_in', 10: 'low_battery',
};
// The unlock DPs (1..7) carry the CREDENTIAL ID as their value (per the residential
// lock DP reference: "the ID is assigned by the hardware ... after the door is unlocked
// the lock reports the DP"). nicki_ek.fz.datapoints flattens that to a fixed action
// string and drops the id. This ADDITIVE converter runs alongside it and surfaces the
// id + type as action_source_id / action_source_type, so the hub can say WHO opened the
// door. It does not touch the action mapping — purely extra keys on the same report.
const UNLOCK_ID_DP = {1: 'finger', 2: 'password', 3: 'temp', 4: 'dynamic', 5: 'card', 6: 'face', 7: 'key'};
const fzUnlockId = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        for (const d of dps) {
            const t = UNLOCK_ID_DP[d.dp];
            if (!t) continue;
            const bytes = Array.isArray(d.data) ? d.data : [...Buffer.from(d.data || [])];
            let id = 0; for (const x of bytes) id = (id << 8) | x;   // big-endian int value
            return {action_source_type: t, action_source_id: id};
        }
    },
};
// every momentary unlock/event DP -> a fixed action string (= vendor schema code)
const act = (label) => ({from: () => label});
const UNLOCK_ACTIONS = [
    'unlock_fingerprint', 'unlock_password', 'unlock_temporary', 'unlock_dynamic',
    'unlock_card', 'unlock_face', 'unlock_key', 'unlock_remote', 'unlock_hand',
    'unlock_voice_remote', 'doorbell', 'hijack', 'open_inside',
];
// raw mgmt DPs: SET takes a hex string of the exact DP payload (byte formats per
// the Residential Lock DP Reference); reports come back as hex on the same key
// (so the state holds the last MCU response, e.g. status+key_id).
const rawHex = {
    to: (v) => [...Buffer.from(String(v), 'hex')],
    from: (v) => (Buffer.isBuffer(v) ? v.toString('hex') : String(v)),
};
const rawHexKey = (name, desc) =>
    e.text(name, ea.STATE_SET).withDescription(`${desc} — hex payload; reports return as hex`);

module.exports = [
    {
        fingerprint: [{modelID: 'LCK-BI400', manufacturerName: 'SmartHomePlus'}],
        model: 'LCK-BI400',
        vendor: 'SmartHomePlus',
        description: 'Smart Home Plus Zigbee door lock',
        fromZigbee: [fzFc00, fzUnlockId, nicki_ek.fz.datapoints],
        toZigbee: [tzFc00, nicki_ek.tz.datapoints],
        onEvent: nicki_ek.onEvent,
        configure: async (device, coordinatorEndpoint, logger) => {
            device.addCustomCluster('kagelFc00', KAGEL_FC00);
            try { await nicki_ek.configureMagicPacket(device, coordinatorEndpoint, logger); } catch (e) {}
        },
        exposes: [
            e.battery(),
            e.binary('door', ea.STATE, 'OPEN', 'CLOSE').withDescription('Door open/closed (DP8 open_close)'),
            e.action(UNLOCK_ACTIONS).withDescription('Last event: unlock method / doorbell / hijack / open-inside (momentary)'),
            e.enum('alarm', ea.STATE, Object.values(alarmLookup)).withDescription('Lock alarm (DP9 alarm_lock)'),
            e.binary('remote_unlock_switch', ea.STATE_SET, 'ON', 'OFF').withDescription('Allow remote unlock (DP23)'),
            e.binary('remote_result', ea.STATE, true, false).withDescription('Result of last remote unlock (DP22)'),
            e.text('remote_unlock', ea.STATE_SET).withDescription('Remote unlock with password (DP21): set the 6-digit unlock password'),
            rawHexKey('remote_no_pd_setkey', 'Set key for password-free remote unlock (DP48): effect(1)+key_id(2)+from(4)+to(4)+max_uses(2)+key(8)'),
            rawHexKey('remote_no_dp_key', 'Password-free remote unlock (DP49): open_close(1)+key_id(2)+key(8)+method(1)'),
            rawHexKey('password_creat', 'Create temp password (DP24): vendor_ser(2)+srv_ser(2)+mfr(2)+start(4)+end(4)+onetime(1)+pw(6)'),
            rawHexKey('password_delete', 'Delete temp password (DP25): vendor_ser(2)+srv_ser(2)+mfr(2)'),
            rawHexKey('password_update', 'Modify temp password (DP26): same format as create'),
            rawHexKey('password_disable', 'Freeze temp password (DP27): same format as delete'),
            rawHexKey('password_enable', 'Unfreeze temp password (DP28): same format as delete'),
            rawHexKey('password_reset', 'Clear all temp passwords (DP39)'),
            rawHexKey('unlock_method_create', 'Add unlock method (DP54): type(1)+stage(1)+admin(1)+member_id(2)+hw_id(2)'),
            rawHexKey('unlock_method_delete', 'Delete unlock method (DP55): type(1)+stage(1)+admin(1)+member_id(2)+hw_id(2)+mode(1)'),
            rawHexKey('update_all_finger', 'Sync all fingerprint IDs (DP58, 125-shard bitmap)'),
            rawHexKey('update_all_password', 'Sync all password IDs (DP59)'),
            rawHexKey('update_all_card', 'Sync all card IDs (DP60)'),
            rawHexKey('update_all_face', 'Sync all face IDs (DP93)'),
            rawHexKey('unlock_offline_pd', 'Offline password mgmt (DP68)'),
            rawHexKey('unlock_offline_clear', 'Clear all offline passwords (DP69)'),
            rawHexKey('unlock_offline_clear_single', 'Clear one offline password (DP70)'),
            e.text('password_offline_time', ea.STATE).withDescription('Offline password validity window (DP91)'),
            e.text('lock_record', ea.STATE).withDescription('Raw unified lock record (DP92, hex)'),
            // anti-clone claim channel (FC00) — hex payloads, driven by the hub/relay orchestrator
            e.text('kagel_claim', ea.SET).withDescription('Send relay-signed claim blob (131B hex) over FC00'),
            e.text('kagel_hub_response', ea.SET).withDescription('Send hub challenge-response (hub_id||nonce||mac hex)'),
            e.text('kagel_kbind', ea.STATE).withDescription('Module-minted binding: hub_id||k_bind (hex)'),
            e.text('kagel_mod_challenge', ea.STATE).withDescription('Module challenge nonce (hex)'),
            e.text('kagel_mod_response', ea.STATE).withDescription('Module proof mac (hex)'),
        ],
        meta: {
            tuyaDatapoints: [
                // ---- unlock / event actions (momentary) ----
                [1,  'action', act('unlock_fingerprint')],
                [2,  'action', act('unlock_password')],
                [3,  'action', act('unlock_temporary')],
                [4,  'action', act('unlock_dynamic')],
                [5,  'action', act('unlock_card')],
                [6,  'action', act('unlock_face')],
                [7,  'action', act('unlock_key')],
                [41, 'action', act('unlock_remote')],
                [45, 'action', act('unlock_hand')],
                [62, 'action', act('unlock_voice_remote')],
                [14, 'action', act('doorbell')],
                [35, 'action', act('hijack')],
                [36, 'action', act('open_inside')],
                // ---- status ----
                [8,  'door', {from: (v) => (v ? 'OPEN' : 'CLOSE')}],
                [10, 'battery', {from: (v) => v}],
                [9,  'alarm', {from: (v) => alarmLookup[v] ?? `alarm_${v}`}],
                [22, 'remote_result', {from: (v) => !!v}],
                // ---- remote unlock ----
                // DP21 remote_unlock: the remote-unlock password as 6 ASCII bytes.
                // The lock MCU verifies LOCALLY and only accepts a 6-DIGIT password
                // (Residential Lock DP Reference: Data[0..5] = the 6-digit password;
                // PROVEN live 2026-07-15 — an 8-digit value returns remote_result:false,
                // 6 digits unlocks). Password length is enforced by the MCU, not us,
                // so reject non-6-digit input HERE with a clear error rather than
                // sending bytes the lock will silently reject.
                //   NOTE for the app: a user's keypad code may be >6 digits and thus
                //   NOT usable for remote unlock. The robust path is to CREATE a
                //   6-digit temp password (DP24 password_creat) and remote-unlock
                //   with that — the app controls its length. See interfaces/lock.
                [21, 'remote_unlock', {
                    to: (v) => {
                        const s = String(v);
                        if (!/^[0-9]{6}$/.test(s)) {
                            throw new Error(
                                `remote_unlock requires a 6-digit password (got "${s}"). ` +
                                `The lock only accepts 6-digit remote-unlock passwords; ` +
                                `use a 6-digit temp password (password_creat) for codes of other lengths.`);
                        }
                        return [...Buffer.from(s, 'ascii')];
                    },
                    from: rawHex.from,
                }],
                [23, 'remote_unlock_switch', {to: (v) => v === 'ON', from: (v) => (v ? 'ON' : 'OFF')}],
                [48, 'remote_no_pd_setkey', rawHex],
                [49, 'remote_no_dp_key', rawHex],
                // ---- temp-password management ----
                [24, 'password_creat', rawHex],
                [25, 'password_delete', rawHex],
                [26, 'password_update', rawHex],
                [27, 'password_disable', rawHex],
                [28, 'password_enable', rawHex],
                [39, 'password_reset', rawHex],
                // ---- offline passwords ----
                [68, 'unlock_offline_pd', rawHex],
                [69, 'unlock_offline_clear', rawHex],
                [70, 'unlock_offline_clear_single', rawHex],
                [91, 'password_offline_time', {from: (v) => String(v)}],
                // ---- enrollment management + sync ----
                [54, 'unlock_method_create', rawHex],
                [55, 'unlock_method_delete', rawHex],
                [58, 'update_all_finger', rawHex],
                [59, 'update_all_password', rawHex],
                [60, 'update_all_card', rawHex],
                [93, 'update_all_face', rawHex],
                // ---- records ----
                [92, 'lock_record', rawHex],
                // anti-clone auth replies (module->hub) ride EF00 raw DPs 0xE2/E3/E6
                [226, 'kagel_kbind', rawHex],
                [227, 'kagel_mod_challenge', rawHex],
                [230, 'kagel_mod_response', rawHex],
            ],
        },
    },
];
