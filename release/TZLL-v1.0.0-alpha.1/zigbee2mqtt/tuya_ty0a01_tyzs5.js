// Z2M external converter — SmartHomePlus Zigbee door lock, model LCK-BI400.
// Stable production converter v1.2.1 candidate for TYZS5 / srptwvak Stage 2G-R2.
// v1.2.1 is a release-hardening cleanup: validated TYZS5 control behavior is unchanged.
// Writable controls are deliberately limited to the target-verified safe paths.
// Our TYZS5 Stage 2G-R2 firmware advertises Basic
// manufacturerName="Tuya", modelID="TY0A01-TYZS5" and rides lock data over
// the EF00 vendor datapoint cluster (server->client reports), so nicki_ek.fz.datapoints
// decodes it.
//
// DP TABLE reference comes from the per-PID vendor shadow.
// The vendor schema contains 38 DPs, but this production converter intentionally does NOT
// expose every writable DP. Only target-verified safe controls are enabled:
//   Unlock events (value, momentary): 1 unlock_fingerprint, 2 unlock_password,
//     3 unlock_temporary, 4 unlock_dynamic, 5 unlock_card, 6 unlock_face,
//     7 unlock_key, 41 unlock_remote, 45 unlock_hand, 62 unlock_voice_remote
//   Event bools (momentary): 14 doorbell, 35 hijack, 36 open_inside
//   Status: 8 open_close (door), 9 alarm_lock (enum), 10 residual_electricity
//     (battery), 22 remote_result (bool)
//   Config: 23 remote_unlock_switch (bool)
//   Remote unlock: 21 remote_unlock (raw, 6-digit ASCII password),
//     48 remote_no_pd_setkey + 49 remote_no_dp_key (key-based, password-free)
//   Temp-password mgmt: 24 create, 25 delete, 26 update, 27 freeze, 28 unfreeze.
//     TARGET_SRPTWVAK: DP24/26 are 27-byte; DP25/27/28 are 6-byte refs. DP39 disabled.
//   Report-only / diagnostic: 58 update_all_finger, 59 update_all_password,
//     60 update_all_card, 91 password_offline_time, 92 lock_record, 93 update_all_face.
//   Enrollment mgmt: DP54/55 are exposed only through the structured Stage 2G safe UI.
//   Explicitly not exposed for writes: DP39, DP68/69/70, DP205/OTA.
//   Legacy FC00 claim/auth support is intentionally removed from this production converter
//   because the validated TYZS5 firmware has that handshake disabled/inert.
// NOTE: this PID has NO DP12/13/15/40/44/46/47/50-53/56/57/61 — no persistent
// lock-state DP; the hub derives Locked/Unlocked from unlock events + DP8.
// z2m's datapoint helper library. The require PATH is a real file inside
// node_modules and therefore cannot be renamed; the local binding can.
const nicki_ek = require('zigbee-herdsman-converters/lib/tuya');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const e = exposes.presets;
const ea = exposes.access;

// FC00 claim/auth support intentionally omitted: current TYZS5 firmware keeps it inert.

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
// id + type as persistent last_unlock_credential_id / last_unlock_credential_type.
// These deliberately do NOT use the action_source_* names, because Zigbee2MQTT treats
// action-related metadata as momentary and may reset it to null after publishing action.
// The persistent keys remain until the next credential-based unlock event.

// ---- One-shot cleanup for state cached by older converter versions ----
// Older versions exposed password/key management fields as STATE_SET, so Zigbee2MQTT
// may still have retained sensitive values in its device state even after the UI is changed.
// On the first Tuya datapoint report after each converter/Z2M restart, overwrite those old
// cached properties with null. The new safe DP21 password field is SET-only and is never
// returned as device state.
const legacyStateCleanupDone = new Set();
const legacyCleanupDeviceKey = (msg) =>
    (msg && msg.device && msg.device.ieeeAddr) ||
    (msg && msg.endpoint && msg.endpoint.deviceIeeeAddress) ||
    'single-device-fallback';

const fzLegacyStateCleanup = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const key = legacyCleanupDeviceKey(msg);
        if (legacyStateCleanupDone.has(key)) return;
        legacyStateCleanupDone.add(key);
        return {
            // Old momentary credential metadata:
            action_source_type: null,
            action_source_id: null,

            // Old DP21 text-state password:
            remote_unlock: null,

            // Old raw password/key management states that may contain credentials:
            remote_no_pd_setkey: null,
            remote_no_dp_key: null,
            password_creat: null,
            password_delete: null,
            password_update: null,
            password_disable: null,
            password_enable: null,
            password_reset: null,
            unlock_method_create: null,
            unlock_method_delete: null,
            update_all_finger: null,
            update_all_password: null,
            update_all_card: null,
            unlock_offline_pd: null,
            unlock_offline_clear_single: null,
        };
    },
};

const UNLOCK_ID_DP = {1: 'finger', 2: 'password', 3: 'temp', 4: 'dynamic', 5: 'card', 6: 'face', 7: 'key'};
const UNLOCK_TYPE_CN = {
    finger: '指纹', password: '长期密码', temp: '临时密码', dynamic: '动态密码',
    card: '门卡', face: '人脸', key: '机械钥匙',
};
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
            const eventAt = new Date().toISOString();
            const idText = (t === 'temp' || t === 'dynamic') ? `设备记录值 ${id}` : `凭证 ID ${id}`;
            return {
                last_unlock_credential_type: t,
                last_unlock_credential_id: id,
                // These two properties are deliberately event-shaped: eventAt changes for every
                // actual unlock report, even if the same credential ID is used repeatedly.
                // This makes Home Assistant Recorder preserve consecutive identical-credential unlocks.
                last_unlock_event_at: eventAt,
                last_unlock_event: `${UNLOCK_TYPE_CN[t] || t} · ${idText} · ${eventAt}`,
            };
        }
    },
};

// ---- TARGET_SRPTWVAK DP48 provisioning result ----
// Target capture proves the MCU reports DP48 as RAW: status(1) + key_id(2).
// Only status 0x00 is assigned a semantic meaning here because that is the
// target-captured success value. Unknown non-zero statuses remain visible as hex.
const fzRemoteKeyProvisionResult = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        for (const d of dps) {
            if (d.dp !== 48) continue;
            const bytes = Array.isArray(d.data) ? d.data : [...Buffer.from(d.data || [])];
            if (bytes.length !== 3) {
                return {
                    remote_key_provision_result: `未知 DP48 回包长度 ${bytes.length}`,
                };
            }
            const status = bytes[0];
            const keyId = (bytes[1] << 8) | bytes[2];
            return {
                remote_key_provision_result:
                    status === 0 ? '成功' : `状态 0x${status.toString(16).padStart(2, '0').toUpperCase()}`,
                remote_key_id: keyId,
            };
        }
    },
};

// ---- TARGET_SRPTWVAK DP49 password-free remote-unlock result ----
// Target capture proves the MCU reports DP49 as RAW: status(1) + key_id(2).
// Keep this separate from DP22: DP49 validates the password-free key request,
// while DP22 remains the final remote-unlock business result.
const fzPasswordFreeUnlockResult = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        for (const d of dps) {
            if (d.dp !== 49) continue;
            const bytes = Array.isArray(d.data) ? d.data : [...Buffer.from(d.data || [])];
            if (bytes.length !== 3) {
                return {
                    password_free_unlock_key_result: `未知 DP49 回包长度 ${bytes.length}`,
                };
            }
            const status = bytes[0];
            const keyId = (bytes[1] << 8) | bytes[2];
            return {
                password_free_unlock_key_result:
                    status === 0 ? '成功' : `状态 0x${status.toString(16).padStart(2, '0').toUpperCase()}`,
                password_free_unlock_key_id: keyId,
            };
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
// Read-only raw decoder for report-only / diagnostic DPs.
// No generic raw writer exists in the stable converter.
const rawHex = {
    from: (v) => (Buffer.isBuffer(v) ? v.toString('hex') : String(v)),
};

// ---- Safe UI for DP21 password remote unlock ----
// Editing the password NEVER sends DP21. It is cached in RAM only.
// The user must explicitly press the stateless execute trigger.
// After one send, the cached password is erased.
const stagedRemoteUnlockPassword = new Map();
const REMOTE_UNLOCK_PASSWORD_TTL_MS = 60 * 1000;
const remoteUnlockDeviceKey = (entity, meta) =>
    (meta && meta.device && meta.device.ieeeAddr) ||
    (entity && entity.deviceIeeeAddress) ||
    'single-device-fallback';

const tzRemoteUnlockSafe = {
    key: ['remote_unlock_password', 'remote_unlock_execute'],
    convertSet: async (entity, key, value, meta) => {
        const deviceKey = remoteUnlockDeviceKey(entity, meta);

        if (key === 'remote_unlock_password') {
            const s = String(value).trim();
            if (!/^[0-9]{6}$/.test(s)) {
                throw new Error('远程开锁密码必须正好为 6 位数字');
            }
            stagedRemoteUnlockPassword.set(deviceKey, {
                password: s,
                expiresAt: Date.now() + REMOTE_UNLOCK_PASSWORD_TTL_MS,
            });
            // Publish only a mask, never plaintext. The real password stays in converter RAM.
            // The execute action explicitly publishes an empty string after consuming the secret.
            return {state: {remote_unlock_password: '••••••'}};
        }

        if (key === 'remote_unlock_execute') {
            if (value !== '执行') {
                throw new Error('无效的远程开锁触发值');
            }

            const staged = stagedRemoteUnlockPassword.get(deviceKey);
            if (!staged || Date.now() > staged.expiresAt) {
                stagedRemoteUnlockPassword.delete(deviceKey);
                throw new Error('请先输入 6 位远程开锁密码，然后在 60 秒内点击“执行远程开锁”');
            }

            try {
                await nicki_ek.sendDataPointRaw(entity, 21, Buffer.from(staged.password, 'ascii'));
            } finally {
                // One-shot staging: require deliberate password entry again for the next unlock.
                stagedRemoteUnlockPassword.delete(deviceKey);
            }

            // Stateless trigger: do not retain an "ON" state.
            return {state: {remote_unlock_execute: null, remote_unlock_password: ''}};
        }
    },
};

// ---- Safe TARGET_SRPTWVAK DP48 remote-key provisioning UI ----
// Editing the 8-digit key NEVER sends DP48. The key is held only in converter
// process memory for a short time. An explicit second action constructs and sends
// the target 21-byte DP48 payload. The key is deleted from RAM immediately after
// the send attempt and is never returned as Zigbee2MQTT device state.
const stagedRemoteKey = new Map();
const REMOTE_KEY_TTL_MS = 120 * 1000;
const REMOTE_KEY_VALID_DAYS = 365;
const REMOTE_KEY_ID = 1;

const writeU32BE = (buf, offset, value) => {
    const v = Number(value) >>> 0;
    buf[offset] = (v >>> 24) & 0xFF;
    buf[offset + 1] = (v >>> 16) & 0xFF;
    buf[offset + 2] = (v >>> 8) & 0xFF;
    buf[offset + 3] = v & 0xFF;
};

const buildTargetDp48 = (keyText) => {
    const now = Math.floor(Date.now() / 1000);
    const validTo = now + REMOTE_KEY_VALID_DAYS * 24 * 60 * 60;
    const payload = Buffer.alloc(21);

    payload[0] = 0x01;                    // enable
    payload[1] = 0x00;                    // key_id = 1, big endian
    payload[2] = REMOTE_KEY_ID;
    writeU32BE(payload, 3, now);           // UTC Unix timestamp
    writeU32BE(payload, 7, validTo);       // UTC Unix timestamp
    payload[11] = 0xFF;                   // use_count = 0xFFFF
    payload[12] = 0xFF;
    Buffer.from(keyText, 'ascii').copy(payload, 13);

    return payload;
};

const tzRemoteKeyProvisionSafe = {
    key: ['remote_key_value', 'remote_key_provision_execute'],
    convertSet: async (entity, key, value, meta) => {
        const deviceKey = remoteUnlockDeviceKey(entity, meta);

        if (key === 'remote_key_value') {
            const s = String(value).trim();
            if (!/^[0-9]{8}$/.test(s)) {
                throw new Error('免密远程密钥必须正好为 8 位数字');
            }
            stagedRemoteKey.set(deviceKey, {
                key: s,
                expiresAt: Date.now() + REMOTE_KEY_TTL_MS,
            });
            // Publish only a mask; keep the real key only in RAM until explicit execution.
            return {state: {remote_key_value: '••••••••'}};
        }

        if (key === 'remote_key_provision_execute') {
            if (value !== '配置') {
                throw new Error('无效的免密密钥配置触发值');
            }

            const staged = stagedRemoteKey.get(deviceKey);
            if (!staged || Date.now() > staged.expiresAt) {
                stagedRemoteKey.delete(deviceKey);
                throw new Error('请先输入 8 位免密远程密钥，然后在 120 秒内点击“配置/更新免密密钥”');
            }

            try {
                const dp48 = buildTargetDp48(staged.key);
                await nicki_ek.sendDataPointRaw(entity, 48, dp48);
            } finally {
                stagedRemoteKey.delete(deviceKey);
            }

            // This means "sent to the TYZS5"; final success still comes from
            // the MCU's DP48 status report parsed by fzRemoteKeyProvisionResult.
            return {
                state: {
                    remote_key_provision_execute: null,
                    remote_key_value: '',
                    remote_key_provision_result: '已发送，等待锁 MCU 返回结果',
                },
            };
        }
    },
};

// ---- Safe TARGET_SRPTWVAK DP49 password-free remote unlock ----
// Input/Enter/blur only stages the key in converter RAM. No lock action occurs.
// The user must explicitly execute the second control. The key is never returned
// as Zigbee2MQTT device state and is deleted immediately after the send attempt.
const stagedPasswordFreeUnlockKey = new Map();
const PASSWORD_FREE_UNLOCK_KEY_TTL_MS = 60 * 1000;

const buildTargetDp49 = (keyText) => {
    const payload = Buffer.alloc(13);
    payload[0] = 0x01;                    // state = unlock/open
    payload[1] = 0x00;                    // key_id = 0x0001
    payload[2] = 0x01;
    Buffer.from(keyText, 'ascii').copy(payload, 3);
    payload[11] = 0x00;                   // method = 0x0001
    payload[12] = 0x01;
    return payload;
};

const tzPasswordFreeUnlockSafe = {
    key: ['password_free_unlock_key', 'password_free_unlock_execute'],
    convertSet: async (entity, key, value, meta) => {
        const deviceKey = remoteUnlockDeviceKey(entity, meta);

        if (key === 'password_free_unlock_key') {
            const s = String(value).trim();
            if (!/^[0-9]{8}$/.test(s)) {
                throw new Error('免密开锁密钥必须正好为 8 位数字');
            }
            stagedPasswordFreeUnlockKey.set(deviceKey, {
                key: s,
                expiresAt: Date.now() + PASSWORD_FREE_UNLOCK_KEY_TTL_MS,
            });
            // Publish only a mask; the execute action clears the HA/Z2M text state after use.
            return {state: {password_free_unlock_key: '••••••••'}};
        }

        if (key === 'password_free_unlock_execute') {
            if (value !== '执行') {
                throw new Error('无效的免密远程开锁触发值');
            }

            const staged = stagedPasswordFreeUnlockKey.get(deviceKey);
            if (!staged || Date.now() > staged.expiresAt) {
                stagedPasswordFreeUnlockKey.delete(deviceKey);
                throw new Error('请先输入当前 8 位免密密钥，然后在 60 秒内点击“执行免密远程开锁”');
            }

            try {
                const dp49 = buildTargetDp49(staged.key);
                await nicki_ek.sendDataPointRaw(entity, 49, dp49);
            } finally {
                stagedPasswordFreeUnlockKey.delete(deviceKey);
            }

            return {
                state: {
                    password_free_unlock_execute: null,
                    password_free_unlock_key: '',
                    password_free_unlock_key_result: '已发送，等待锁 MCU 返回结果',
                },
            };
        }
    },
};


// ---- TARGET_SRPTWVAK Stage 2F-R structured temporary-password management ----
// Target captures prove:
//   DP24 create   = ref6 + start4 + end4 + reserved6(zeros) + one_time1 + password6 = 27 bytes
//   DP25 delete   = ref6 = 6 bytes
//   DP26 update   = same 27-byte target layout as DP24
//   DP27 freeze   = ref6 = 6 bytes
//   DP28 unfreeze = ref6 = 6 bytes
// DP39 clear-all is deliberately NOT exposed or sent by this converter.
//
// The first two ref bytes are the APP-visible temporary-password ID (998/999 in captures).
// The remaining four target-captured ref bytes are preserved as 00 01 00 00; no stronger
// semantic name is assigned to them here.
//
// Password plaintext is never returned as Zigbee2MQTT state. It lives in converter RAM
// for at most 180 seconds and is erased after a create/update send attempt.
const TEMP_PASSWORD_SECRET_TTL_MS = 180 * 1000;
const TEMP_PASSWORD_MAX_ID = 999;
const stagedTempPassword = new Map();
const tempPasswordUsedIds = new Map();
const tempPasswordRecords = new Map();
const pendingTempPasswordOperation = new Map();

const targetTempDeviceKey = (entity, meta) => remoteUnlockDeviceKey(entity, meta);
const targetTempMsgDeviceKey = (msg) => legacyCleanupDeviceKey(msg);

const parseTempIdList = (value) => {
    const out = new Set();
    const text = value == null ? '' : String(value);
    for (const m of text.matchAll(/\b(\d{1,3})\b/g)) {
        const id = Number(m[1]);
        if (Number.isInteger(id) && id >= 1 && id <= TEMP_PASSWORD_MAX_ID) out.add(id);
    }
    return out;
};

const parseTempRegistryJson = (value) => {
    if (!value) return new Map();
    try {
        const arr = JSON.parse(String(value));
        const m = new Map();
        if (Array.isArray(arr)) {
            for (const r of arr) {
                const id = Number(r && r.id);
                if (!Number.isInteger(id) || id < 1 || id > TEMP_PASSWORD_MAX_ID) continue;
                // Never accept/store password material in this registry.
                m.set(id, {
                    id,
                    type: r.type === '一次性' ? '一次性' : (r.type === '周期性' ? '周期性' : '未知'),
                    state: ['启用', '冻结', '未知'].includes(r.state) ? r.state : '未知',
                    validFrom: typeof r.validFrom === 'string' ? r.validFrom : '',
                    validTo: typeof r.validTo === 'string' ? r.validTo : '',
                });
            }
        }
        return m;
    } catch (_) {
        return new Map();
    }
};

const seedTempRegistryFromState = (deviceKey, meta) => {
    if (!tempPasswordUsedIds.has(deviceKey)) {
        tempPasswordUsedIds.set(deviceKey, parseTempIdList(meta && meta.state && meta.state.temp_password_ids));
    }
    if (!tempPasswordRecords.has(deviceKey)) {
        const records = parseTempRegistryJson(meta && meta.state && meta.state.temp_password_registry_json);
        tempPasswordRecords.set(deviceKey, records);
        const ids = tempPasswordUsedIds.get(deviceKey);
        for (const id of records.keys()) ids.add(id);
    }
};

const formatTempIds = (ids) => {
    const a = [...ids].sort((x, y) => y - x);
    return a.length ? a.join(', ') : '无';
};

const formatTempRecords = (records, ids) => {
    const allIds = new Set(ids || []);
    for (const id of records.keys()) allIds.add(id);
    const sorted = [...allIds].sort((a, b) => b - a);
    if (!sorted.length) return '无';
    return sorted.map((id) => {
        const r = records.get(id);
        if (!r) return `${id}（详情未知）`;
        const range = r.validFrom && r.validTo ? `，${r.validFrom} → ${r.validTo}` : '';
        return `${id}（${r.type || '未知'}，${r.state || '未知'}${range}）`;
    }).join('；');
};

const serializeTempRegistry = (records) => JSON.stringify(
    [...records.values()].sort((a, b) => b.id - a.id).map((r) => ({
        id: r.id,
        type: r.type || '未知',
        state: r.state || '未知',
        validFrom: r.validFrom || '',
        validTo: r.validTo || '',
    })),
);

const makeTempRegistryState = (deviceKey) => {
    const ids = tempPasswordUsedIds.get(deviceKey) || new Set();
    const records = tempPasswordRecords.get(deviceKey) || new Map();
    return {
        temp_password_ids: formatTempIds(ids),
        temp_password_records: formatTempRecords(records, ids),
        // Unexposed machine-readable persistence; contains metadata only, never passwords.
        temp_password_registry_json: serializeTempRegistry(records),
    };
};

// Interpret UI text explicitly as mainland-China local time (UTC+8, no DST), so the
// result does not depend on the timezone configured on the Zigbee2MQTT host.
const parseChinaTime = (text) => {
    const s = String(text || '').trim();
    // Accept both zero-padded and human-entered forms, e.g.
    // 2026-09-11 18:14 and 2026-9-11 18:14. State is canonicalized later.
    const m = /^(\d{4})-(\d{1,2})-(\d{1,2})[ T](\d{1,2}):(\d{1,2})(?::(\d{1,2}))?$/.exec(s);
    if (!m) throw new Error('时间格式必须为 YYYY-M-D HH:mm 或 YYYY-MM-DD HH:mm（按中国标准时间 UTC+8 解释）');
    const [year, month, day, hour, minute, second] = m.slice(1).map(Number);
    if (month < 1 || month > 12 || day < 1 || day > 31 || hour > 23 || minute > 59 || second > 59) {
        throw new Error('时间字段超出有效范围');
    }
    const utcMs = Date.UTC(year, month - 1, day, hour - 8, minute, second || 0);
    const d = new Date(utcMs + 8 * 3600 * 1000);
    if (d.getUTCFullYear() !== year || d.getUTCMonth() !== month - 1 || d.getUTCDate() !== day ||
        d.getUTCHours() !== hour || d.getUTCMinutes() !== minute || d.getUTCSeconds() !== (second || 0)) {
        throw new Error('无效的日期/时间');
    }
    const sec = Math.floor(utcMs / 1000);
    if (sec < 0 || sec > 0xFFFFFFFF) throw new Error('时间超出门锁 32 位 Unix 时间戳范围');
    return sec >>> 0;
};

const canonicalChinaTime = (text) => {
    const sec = parseChinaTime(text);
    const d = new Date((sec + 8 * 3600) * 1000);
    const pad = (n) => String(n).padStart(2, '0');
    return `${d.getUTCFullYear()}-${pad(d.getUTCMonth() + 1)}-${pad(d.getUTCDate())} ${pad(d.getUTCHours())}:${pad(d.getUTCMinutes())}`;
};

const buildTargetTempRef6 = (id) => {
    if (!Number.isInteger(id) || id < 1 || id > TEMP_PASSWORD_MAX_ID) {
        throw new Error('临时密码 ID 必须在 1..999');
    }
    const b = Buffer.alloc(6);
    b[0] = (id >>> 8) & 0xFF;
    b[1] = id & 0xFF;
    b[2] = 0x00;
    b[3] = 0x01;
    b[4] = 0x00;
    b[5] = 0x00;
    return b;
};

const buildTargetTemp27 = (id, validFromText, validToText, type, password) => {
    if (!/^[0-9]{6}$/.test(password)) throw new Error('临时密码必须正好为 6 位数字');
    if (type !== '一次性' && type !== '周期性') throw new Error('请选择“一次性”或“周期性”');
    const start = parseChinaTime(validFromText);
    const end = parseChinaTime(validToText);
    if (start >= end) throw new Error('失效时间必须晚于生效时间');
    const p = Buffer.alloc(27);
    buildTargetTempRef6(id).copy(p, 0);
    writeU32BE(p, 6, start);
    writeU32BE(p, 10, end);
    // bytes 14..19 stay zero: target-captured unknown/reserved field.
    p[20] = type === '一次性' ? 1 : 0;
    Buffer.from(password, 'ascii').copy(p, 21);
    return p;
};

const getTempStage = (deviceKey) => {
    if (!stagedTempPassword.has(deviceKey)) stagedTempPassword.set(deviceKey, {});
    return stagedTempPassword.get(deviceKey);
};

const getTempInput = (stage, meta, key) =>
    stage[key] !== undefined ? stage[key] : (meta && meta.state ? meta.state[key] : undefined);

const getTempSecret = (deviceKey) => {
    const stage = getTempStage(deviceKey);
    if (!stage.password || !stage.passwordExpiresAt || Date.now() > stage.passwordExpiresAt) {
        delete stage.password;
        delete stage.passwordExpiresAt;
        throw new Error('请先输入 6 位临时密码，然后在 180 秒内执行操作');
    }
    return stage.password;
};

const clearTempSecret = (deviceKey) => {
    const stage = getTempStage(deviceKey);
    delete stage.password;
    delete stage.passwordExpiresAt;
};

const autoAllocateTempId = (used) => {
    for (let id = TEMP_PASSWORD_MAX_ID; id >= 1; --id) {
        if (!used.has(id)) return id;
    }
    throw new Error('Z2M 已知的 1..999 临时密码 ID 已全部占用');
};

const normalizeTempId = (v, allowAuto) => {
    const raw = String(v == null ? '' : v).trim();
    if (allowAuto && (raw === '' || raw === '0' || raw.toLowerCase() === 'auto' || raw === '自动')) return 0;
    const n = Number(raw);
    if (!Number.isInteger(n)) throw new Error('临时密码 ID 必须为整数');
    if (n < 1 || n > TEMP_PASSWORD_MAX_ID) throw new Error('临时密码 ID 必须在 1..999');
    return n;
};

const tzTempPasswordSafe = {
    key: [
        'temp_password_value', 'temp_password_type', 'temp_password_valid_from', 'temp_password_valid_to',
        'temp_password_create_id', 'temp_password_manage_id',
        'temp_password_create_execute', 'temp_password_update_execute',
        'temp_password_freeze_execute', 'temp_password_unfreeze_execute', 'temp_password_delete_execute',
    ],
    convertSet: async (entity, key, value, meta) => {
        const deviceKey = targetTempDeviceKey(entity, meta);
        seedTempRegistryFromState(deviceKey, meta);
        const stage = getTempStage(deviceKey);

        if (key === 'temp_password_value') {
            const s = String(value).trim();
            if (!/^[0-9]{6}$/.test(s)) throw new Error('临时密码必须正好为 6 位数字');
            stage.password = s;
            stage.passwordExpiresAt = Date.now() + TEMP_PASSWORD_SECRET_TTL_MS;
            // Password plaintext never becomes device state. Publish only a mask; create/update clears it after use.
            return {state: {temp_password_value: '••••••'}};
        }
        if (key === 'temp_password_type') {
            if (value !== '一次性' && value !== '周期性') throw new Error('无效的临时密码类型');
            stage.temp_password_type = value;
            return {state: {temp_password_type: value}};
        }
        if (key === 'temp_password_valid_from' || key === 'temp_password_valid_to') {
            const canonical = canonicalChinaTime(value);
            stage[key] = canonical;
            return {state: {[key]: canonical}};
        }
        if (key === 'temp_password_create_id') {
            const id = normalizeTempId(value, true);
            stage.temp_password_create_id = id;
            return {state: {temp_password_create_id: String(id)}};
        }
        if (key === 'temp_password_manage_id') {
            const id = normalizeTempId(value, false);
            stage.temp_password_manage_id = id;
            return {state: {temp_password_manage_id: String(id)}};
        }

        const used = tempPasswordUsedIds.get(deviceKey);
        const type = getTempInput(stage, meta, 'temp_password_type');
        const validFrom = getTempInput(stage, meta, 'temp_password_valid_from');
        const validTo = getTempInput(stage, meta, 'temp_password_valid_to');

        if (key === 'temp_password_create_execute') {
            if (value !== '创建') throw new Error('无效的临时密码创建触发值');
            const password = getTempSecret(deviceKey);
            const requestedId = normalizeTempId(getTempInput(stage, meta, 'temp_password_create_id') || 0, true);
            const id = requestedId === 0 ? autoAllocateTempId(used) : requestedId;
            if (used.has(id)) throw new Error(`临时密码 ID ${id} 已在 Z2M 已知列表中占用`);
            const payload = buildTargetTemp27(id, validFrom, validTo, type, password);
            pendingTempPasswordOperation.set(deviceKey, {
                dp: 24, id, type,
                validFrom: canonicalChinaTime(validFrom), validTo: canonicalChinaTime(validTo),
            });
            try {
                await nicki_ek.sendDataPointRaw(entity, 24, payload);
            } catch (e) {
                pendingTempPasswordOperation.delete(deviceKey);
                throw e;
            } finally {
                clearTempSecret(deviceKey);
            }
            return {state: {
                temp_password_create_execute: null,
                temp_password_value: '',
                temp_password_last_result: `已发送创建请求（ID ${id}），等待锁 MCU 返回结果`,
            }};
        }

        const manageId = normalizeTempId(getTempInput(stage, meta, 'temp_password_manage_id'), false);

        if (key === 'temp_password_update_execute') {
            if (value !== '修改') throw new Error('无效的临时密码修改触发值');
            // The target DP26 capture is a periodic-password edit. Do not silently generalize
            // one-time modification until we have a target capture for that operation.
            if (type !== '周期性') throw new Error('当前只开放已实机抓包验证的“周期性密码”修改');
            const password = getTempSecret(deviceKey);
            const payload = buildTargetTemp27(manageId, validFrom, validTo, type, password);
            pendingTempPasswordOperation.set(deviceKey, {
                dp: 26, id: manageId, type,
                validFrom: canonicalChinaTime(validFrom), validTo: canonicalChinaTime(validTo),
            });
            try {
                await nicki_ek.sendDataPointRaw(entity, 26, payload);
            } catch (e) {
                pendingTempPasswordOperation.delete(deviceKey);
                throw e;
            } finally {
                clearTempSecret(deviceKey);
            }
            return {state: {
                temp_password_update_execute: null,
                temp_password_value: '',
                temp_password_last_result: `已发送修改请求（ID ${manageId}），等待锁 MCU 返回结果`,
            }};
        }

        const actionMap = {
            temp_password_delete_execute: {value: '删除', dp: 25, label: '删除'},
            temp_password_freeze_execute: {value: '冻结', dp: 27, label: '冻结'},
            temp_password_unfreeze_execute: {value: '解冻', dp: 28, label: '解冻'},
        };
        const action = actionMap[key];
        if (action) {
            if (value !== action.value) throw new Error(`无效的临时密码${action.label}触发值`);
            pendingTempPasswordOperation.set(deviceKey, {dp: action.dp, id: manageId});
            try {
                await nicki_ek.sendDataPointRaw(entity, action.dp, buildTargetTempRef6(manageId));
            } catch (e) {
                pendingTempPasswordOperation.delete(deviceKey);
                throw e;
            }
            return {state: {
                [key]: null,
                temp_password_last_result: `已发送${action.label}请求（ID ${manageId}），等待锁 MCU 返回结果`,
            }};
        }
    },
};

// TARGET_SRPTWVAK DP24/25/26/27/28 reports are ref6 + status(1).
// Captures prove status 0x01 for success. Unknown statuses are shown as hex rather
// than assigned undocumented meanings.
const fzTempPasswordResult = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        const deviceKey = targetTempMsgDeviceKey(msg);
        let result;
        for (const d of dps) {
            if (![24,25,26,27,28].includes(d.dp)) continue;
            const b = Array.isArray(d.data) ? Buffer.from(d.data) : Buffer.from(d.data || []);
            const label = ({24: '创建', 25: '删除', 26: '修改', 27: '冻结', 28: '解冻'})[d.dp];
            if (b.length !== 7) {
                result = {temp_password_last_result: `${label}回包长度异常：${b.length}`};
                continue;
            }
            const id = (b[0] << 8) | b[1];
            const status = b[6];
            const success = status === 0x01;
            result = {
                temp_password_last_id: id,
                temp_password_last_result: success ? `${label}成功（ID ${id}）` :
                    `${label}返回状态 0x${status.toString(16).padStart(2, '0').toUpperCase()}（ID ${id}）`,
            };

            if (!success) {
                pendingTempPasswordOperation.delete(deviceKey);
                continue;
            }

            if (!tempPasswordUsedIds.has(deviceKey)) tempPasswordUsedIds.set(deviceKey, new Set());
            if (!tempPasswordRecords.has(deviceKey)) tempPasswordRecords.set(deviceKey, new Map());
            const ids = tempPasswordUsedIds.get(deviceKey);
            const records = tempPasswordRecords.get(deviceKey);
            const pending = pendingTempPasswordOperation.get(deviceKey);

            if (d.dp === 24) {
                ids.add(id);
                const p = pending && pending.dp === 24 && pending.id === id ? pending : {};
                records.set(id, {
                    id,
                    type: p.type || '未知', state: '启用',
                    validFrom: p.validFrom || '', validTo: p.validTo || '',
                });
            } else if (d.dp === 25) {
                ids.delete(id);
                records.delete(id);
            } else if (d.dp === 26) {
                ids.add(id);
                const old = records.get(id) || {id, type: '未知', state: '启用', validFrom: '', validTo: ''};
                const p = pending && pending.dp === 26 && pending.id === id ? pending : {};
                records.set(id, {
                    ...old,
                    type: p.type || old.type,
                    validFrom: p.validFrom || old.validFrom,
                    validTo: p.validTo || old.validTo,
                });
            } else if (d.dp === 27) {
                ids.add(id);
                const old = records.get(id) || {id, type: '未知', validFrom: '', validTo: ''};
                records.set(id, {...old, state: '冻结'});
            } else if (d.dp === 28) {
                ids.add(id);
                const old = records.get(id) || {id, type: '未知', validFrom: '', validTo: ''};
                records.set(id, {...old, state: '启用'});
            }
            pendingTempPasswordOperation.delete(deviceKey);
            Object.assign(result, makeTempRegistryState(deviceKey));
        }
        return result;
    },
};

// ---- TARGET_SRPTWVAK Stable v1.2 structured local-credential management ----
// Remote enrollment never carries the actual password/fingerprint/card data.  DP54 only
// asks the lock MCU to enter local enrollment mode; the user must then operate the physical
// lock.  Target captures prove request types 01=password, 02=card, 03=fingerprint.
//
// IMPORTANT: DP54 MCU report byte0 is OPAQUE on this target.  It is often 0x03 even when
// the actual operation is password or card.  Never infer credential type from report byte0.
// The active type below comes from the operation we initiated locally in Z2M.
const CREDENTIAL_ENROLL_TIMEOUT_MS = 60 * 1000;
const CREDENTIAL_TYPE_TO_CODE = {'长期密码': 0x01, '门卡': 0x02, '指纹': 0x03};
const CREDENTIAL_CODE_TO_TYPE = {1: '长期密码', 2: '门卡', 3: '指纹'};
const pendingCredentialEnrollment = new Map();
const pendingCredentialDelete = new Map();
const credentialUiState = new Map();

const getCredentialUiState = (deviceKey) => {
    if (!credentialUiState.has(deviceKey)) credentialUiState.set(deviceKey, {});
    return credentialUiState.get(deviceKey);
};

const buildTargetDp54 = (typeName, stage) => {
    const type = CREDENTIAL_TYPE_TO_CODE[typeName];
    if (!type) throw new Error('凭证类型必须是“长期密码 / 门卡 / 指纹”');
    if (stage !== 0x00 && stage !== 0xFE) throw new Error('DP54 只允许 start(00) 或 cancel(FE)');
    return Buffer.from([type, stage, 0x01, 0x00, 0x01, 0x03, 0xE7]);
};

const normalizeCredentialId = (v) => {
    const id = Number(v);
    if (!Number.isInteger(id) || id < 1 || id > 999) throw new Error('凭证 ID 必须是 1..999 的整数');
    return id;
};

const buildTargetDp55 = (typeName, idValue) => {
    const type = CREDENTIAL_TYPE_TO_CODE[typeName];
    if (!type) throw new Error('删除类型必须是“长期密码 / 门卡 / 指纹”');
    const id = normalizeCredentialId(idValue);
    return Buffer.from([type, 0x00, 0x01, 0x00, 0x01, (id >>> 8) & 0xFF, id & 0xFF, 0x01]);
};

const clearCredentialEnrollTimer = (deviceKey) => {
    const p = pendingCredentialEnrollment.get(deviceKey);
    if (p && p.timer) clearTimeout(p.timer);
    if (p) p.timer = null;
};

const sendCredentialCancelOnce = async (deviceKey, entity, typeName, reason) => {
    const p = pendingCredentialEnrollment.get(deviceKey);
    if (p && p.cancelSent) return;
    if (p) p.cancelSent = true;
    await nicki_ek.sendDataPointRaw(entity, 54, buildTargetDp54(typeName, 0xFE));
    if (p) p.cancelReason = reason || 'cancel';
};

const armCredentialEnrollTimeout = (deviceKey, entity, typeName) => {
    const p = pendingCredentialEnrollment.get(deviceKey);
    if (!p) return;
    clearCredentialEnrollTimer(deviceKey);
    p.timer = setTimeout(async () => {
        const current = pendingCredentialEnrollment.get(deviceKey);
        if (!current || current.type !== typeName || current.finished || current.cancelSent) return;
        try {
            await sendCredentialCancelOnce(deviceKey, entity, typeName, 'timeout');
        } catch (_) {
            // Do not retry automatically.  A later MCU report or an explicit user operation
            // will resolve/replace the pending context.
        }
    }, CREDENTIAL_ENROLL_TIMEOUT_MS);
};

const tzCredentialManagementSafe = {
    key: [
        'credential_enroll_type', 'credential_enroll_execute', 'credential_enroll_cancel',
        'credential_delete_type', 'credential_delete_id', 'credential_delete_execute',
    ],
    convertSet: async (entity, key, value, meta) => {
        const deviceKey = remoteUnlockDeviceKey(entity, meta);
        const ui = getCredentialUiState(deviceKey);

        if (key === 'credential_enroll_type') {
            if (!CREDENTIAL_TYPE_TO_CODE[value]) throw new Error('凭证类型必须是“长期密码 / 门卡 / 指纹”');
            ui.enrollType = value;
            return {state: {credential_enroll_type: value}};
        }

        if (key === 'credential_enroll_execute') {
            if (value !== '开始') throw new Error('无效的录入触发值');
            const typeName = ui.enrollType || (meta && meta.state && meta.state.credential_enroll_type);
            if (!CREDENTIAL_TYPE_TO_CODE[typeName]) throw new Error('请先选择要录入的凭证类型');

            clearCredentialEnrollTimer(deviceKey);
            pendingCredentialEnrollment.delete(deviceKey);
            await nicki_ek.sendDataPointRaw(entity, 54, buildTargetDp54(typeName, 0x00));
            pendingCredentialEnrollment.set(deviceKey, {
                type: typeName,
                startedAt: Date.now(),
                finished: false,
                cancelSent: false,
                timer: null,
            });
            armCredentialEnrollTimeout(deviceKey, entity, typeName);
            return {state: {
                credential_enroll_execute: null,
                credential_enroll_status: `已发送${typeName}录入请求，请在 60 秒内到物理锁面板完成操作`,
                credential_enroll_last_id: null,
            }};
        }

        if (key === 'credential_enroll_cancel') {
            if (value !== '取消') throw new Error('无效的取消触发值');
            const pending = pendingCredentialEnrollment.get(deviceKey);
            const typeName = pending && pending.type ? pending.type : (ui.enrollType || (meta && meta.state && meta.state.credential_enroll_type));
            if (!CREDENTIAL_TYPE_TO_CODE[typeName]) throw new Error('没有可取消的凭证录入类型');
            clearCredentialEnrollTimer(deviceKey);
            await sendCredentialCancelOnce(deviceKey, entity, typeName, 'manual');
            return {state: {
                credential_enroll_cancel: null,
                credential_enroll_status: `已发送${typeName}录入取消请求`,
            }};
        }

        if (key === 'credential_delete_type') {
            if (!CREDENTIAL_TYPE_TO_CODE[value]) throw new Error('删除类型必须是“长期密码 / 门卡 / 指纹”');
            ui.deleteType = value;
            return {state: {credential_delete_type: value}};
        }

        if (key === 'credential_delete_id') {
            const id = normalizeCredentialId(value);
            ui.deleteId = id;
            return {state: {credential_delete_id: String(id)}};
        }

        if (key === 'credential_delete_execute') {
            if (value !== '删除') throw new Error('无效的删除触发值');
            const typeName = ui.deleteType || (meta && meta.state && meta.state.credential_delete_type);
            const id = normalizeCredentialId(ui.deleteId != null ? ui.deleteId : (meta && meta.state && meta.state.credential_delete_id));
            if (!CREDENTIAL_TYPE_TO_CODE[typeName]) throw new Error('请先选择要删除的凭证类型');
            pendingCredentialDelete.set(deviceKey, {type: typeName, id});
            try {
                await nicki_ek.sendDataPointRaw(entity, 55, buildTargetDp55(typeName, id));
            } catch (e) {
                pendingCredentialDelete.delete(deviceKey);
                throw e;
            }
            return {state: {
                credential_delete_execute: null,
                credential_delete_result: `已发送删除请求：${typeName} ID ${id}，等待锁 MCU 回包`,
            }};
        }
    },
};

const formatHexByte = (n) => `0x${Number(n).toString(16).padStart(2, '0').toUpperCase()}`;

const fzCredentialManagementResult = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        const deviceKey = legacyCleanupDeviceKey(msg);
        let result;

        for (const d of dps) {
            if (d.dp !== 54 && d.dp !== 55) continue;
            const b = Array.isArray(d.data) ? Buffer.from(d.data) : Buffer.from(d.data || []);

            if (d.dp === 54) {
                if (b.length !== 9) {
                    result = {credential_enroll_status: `DP54 回包长度异常：${b.length}`};
                    continue;
                }
                const opaque0 = b[0];
                const stage = b[1];
                const candidateId = (b[5] << 8) | b[6];
                const enrollmentIndex = b[7];
                const status = b[8];
                const pending = pendingCredentialEnrollment.get(deviceKey);
                const typeName = pending && pending.type ? pending.type : '未知类型';
                const rawDetail = `stage=${formatHexByte(stage)}, raw0=${formatHexByte(opaque0)}, idx=${enrollmentIndex}, result=${formatHexByte(status)}`;

                if (stage === 0x00) {
                    result = {credential_enroll_status: `${typeName}录入已开始（${rawDetail}）`};
                } else if (stage === 0xFC) {
                    result = {credential_enroll_status: `${typeName}录入中（${rawDetail}）`};
                } else if (stage === 0xFF && status === 0x00) {
                    clearCredentialEnrollTimer(deviceKey);
                    if (pending) pending.finished = true;
                    pendingCredentialEnrollment.delete(deviceKey);
                    result = {
                        credential_enroll_status: `${typeName}录入成功，凭证 ID ${candidateId}`,
                        credential_enroll_last_id: candidateId,
                    };
                } else if (stage === 0xFD) {
                    clearCredentialEnrollTimer(deviceKey);
                    if (pending) pending.finished = true;
                    pendingCredentialEnrollment.delete(deviceKey);
                    result = {credential_enroll_status: `${typeName}录入失败/超时（${rawDetail}）`};
                } else {
                    result = {credential_enroll_status: `${typeName} DP54 状态（${rawDetail}）`};
                }
            } else {
                if (b.length !== 9) {
                    result = {credential_delete_result: `DP55 回包长度异常：${b.length}`};
                    continue;
                }
                const reportType = b[0];
                const id = (b[5] << 8) | b[6];
                const status = b[8];
                const pending = pendingCredentialDelete.get(deviceKey);
                const typeName = pending && pending.type ? pending.type : (CREDENTIAL_CODE_TO_TYPE[reportType] || `类型${formatHexByte(reportType)}`);
                const success = status === 0xFF;
                result = {
                    credential_delete_result: success ? `${typeName} ID ${id} 删除成功` :
                        `${typeName} ID ${id} 删除返回 ${formatHexByte(status)}`,
                    credential_delete_last_id: id,
                };
                pendingCredentialDelete.delete(deviceKey);
            }
        }
        return result;
    },
};

// ---- Readable lock-side credential ID lists (DP58/59/60) ----
// TARGET/legacy converter evidence shows these DPs use repeating shard/bitmap pairs:
//   [shard, bitmap], ID = shard*8 + bit for each set bit 0..7.
// DP58 = fingerprint hardware IDs, DP59 = local/long-term password hardware IDs,
// DP60 = card hardware IDs. These are NOT DP24 temporary-password reference IDs.
//
// v4 and older converters stored raw hex in update_all_finger/password/card. v5 introduced
// human-readable properties but did not migrate those cached raw states; if the lock did not
// emit a fresh DP58/59/60 after restart, the new fields stayed Null. v5.1 migrates that cache
// once on the first ordinary Tuya report, then future fresh DP58/59/60 reports remain authoritative.
const credentialListMigrationDone = new Set();

const bitmapBytes = (value) => {
    if (Buffer.isBuffer(value)) return value;
    if (Array.isArray(value) || ArrayBuffer.isView(value)) return Buffer.from(value);
    if (typeof value === 'string') {
        const x = value.trim().replace(/^0x/i, '').replace(/\s+/g, '');
        if (!x) return Buffer.alloc(0);
        if (!/^[0-9a-fA-F]+$/.test(x) || (x.length % 2) !== 0) return null;
        return Buffer.from(x, 'hex');
    }
    return null;
};

const parseShardBitmapIds = (value) => {
    const b = bitmapBytes(value);
    if (b === null) return {error: '不是有效字节数组/hex', ids: []};
    if (b.length % 2 !== 0) return {error: `长度异常 ${b.length}`, ids: []};
    const ids = [];
    for (let i = 0; i < b.length; i += 2) {
        const fragment = b[i];
        const mask = b[i + 1];
        for (let bit = 0; bit < 8; bit++) {
            if (mask & (1 << bit)) ids.push(fragment * 8 + bit);
        }
    }
    ids.sort((a, b2) => a - b2);
    return {ids};
};

const putReadableCredentialList = (result, kind, value) => {
    const parsed = parseShardBitmapIds(value);
    if (parsed.error) {
        result[`${kind}_id_list`] = `格式异常（${parsed.error}）`;
        result[`${kind}_id_count`] = 0;
        return;
    }
    result[`${kind}_id_list`] = parsed.ids.length ? parsed.ids.join(', ') : '无';
    result[`${kind}_id_count`] = parsed.ids.length;
};

const fzReadableCredentialIdLists = {
    cluster: 'manuSpecificTuya',
    type: ['commandDataResponse', 'commandDataReport', 'commandActiveStatusReport', 'commandActiveStatusReportAlt'],
    convert: (model, msg, publish, options, meta) => {
        const result = {};
        const dps = (msg.data && msg.data.dpValues) || [];

        // Fresh device reports are authoritative.
        for (const d of dps) {
            if (d.dp === 58) putReadableCredentialList(result, 'fingerprint', d.data);
            else if (d.dp === 59) putReadableCredentialList(result, 'password', d.data);
            else if (d.dp === 60) putReadableCredentialList(result, 'card', d.data);
        }

        // One-time migration from the raw state names used by v4/older converters.
        // meta.state is the already persisted device state before this incoming report is merged.
        const deviceKey = legacyCleanupDeviceKey(msg);
        if (!credentialListMigrationDone.has(deviceKey)) {
            credentialListMigrationDone.add(deviceKey);
            const oldState = (meta && meta.state) || {};
            if (result.fingerprint_id_list === undefined && oldState.update_all_finger != null) {
                putReadableCredentialList(result, 'fingerprint', oldState.update_all_finger);
            }
            if (result.password_id_list === undefined && oldState.update_all_password != null) {
                putReadableCredentialList(result, 'password', oldState.update_all_password);
            }
            if (result.card_id_list === undefined && oldState.update_all_card != null) {
                putReadableCredentialList(result, 'card', oldState.update_all_card);
            }
        }

        return Object.keys(result).length ? result : undefined;
    },
};

module.exports = [
    {
        fingerprint: [
            // Canonical identity of the validated TZLL TYZS5 firmware.
            // Do not match the historical SmartHomePlus/LCK-BI400 identity here:
            // that identity was also used by the upstream TYZS3 project and would
            // make this TYZS5-specific production converter over-match TYZS3 devices.
            {modelID: 'TY0A01-TYZS5', manufacturerName: 'Tuya'},
        ],
        model: 'TY0A01-TYZS5',
        vendor: 'Tuya',
        description: 'Tuya TY0A01-TYZS5 Zigbee 智能门锁（TYZS5 / srptwvak，Stable v1.2.1）',
        // OTA is intentionally not advertised. Stage 2G-R2 has no approved OTA write/install path.
        fromZigbee: [fzLegacyStateCleanup, fzCredentialManagementResult, fzTempPasswordResult, fzReadableCredentialIdLists, fzRemoteKeyProvisionResult, fzPasswordFreeUnlockResult, fzUnlockId, nicki_ek.fz.datapoints],
        toZigbee: [tzRemoteUnlockSafe, tzCredentialManagementSafe, tzTempPasswordSafe, tzRemoteKeyProvisionSafe, tzPasswordFreeUnlockSafe, nicki_ek.tz.datapoints],
        onEvent: nicki_ek.onEvent,
        configure: async (device, coordinatorEndpoint, logger) => {
            try { await nicki_ek.configureMagicPacket(device, coordinatorEndpoint, logger); } catch (e) {}
        },
        exposes: [
            e.battery()
                .withLabel('电池电量')
                .withDescription('门锁上报的剩余电量百分比（DP10）'),

            // srptwvak 实机没有观察到门磁/门位置传感器。
            // DP8 在开锁后可能长期保持 OPEN，因此只作为诊断信息，不能当可靠门磁使用。
            e.binary('door', ea.STATE, 'OPEN', 'CLOSE')
                .withLabel('DP8 门状态（非可靠门磁）')
                .withDescription('仅显示锁 MCU 的 DP8。该锁未观察到门磁传感器，OPEN 可能不会自动恢复；不要用于“门长时间未关”等安全自动化。')
                .withCategory('diagnostic'),

            e.action(UNLOCK_ACTIONS)
                .withLabel('最近事件（瞬时）')
                .withDescription(
                    '这是瞬时 action，发布后自动清空属于正常行为。事件值：unlock_fingerprint=指纹开锁，unlock_password=密码开锁，' +
                    'unlock_temporary=临时密码，unlock_dynamic=动态密码，unlock_card=门卡，' +
                    'unlock_face=人脸，unlock_key=机械钥匙，unlock_remote=远程开锁，' +
                    'doorbell=门铃，hijack=劫持告警，open_inside=室内开门。'),

            e.enum('alarm', ea.STATE, Object.values(alarmLookup))
                .withLabel('门锁告警')
                .withDescription(
                    'DP9 告警类型。机器值保持英文以兼容自动化；常见值包括：' +
                    'wrong_finger=指纹错误，wrong_password=密码错误，wrong_card=门卡错误，' +
                    'pry=防撬，low_battery=低电量等。'),

            e.binary('remote_result', ea.STATE, true, false)
                .withLabel('最近一次远程开锁结果')
                .withDescription('DP22：true=成功，false=失败。只表示最近一次远程开锁请求的结果，不代表门锁当前锁定状态。'),

            // Password editing is safe: blur/Enter only stages the value in converter RAM.
            e.text('remote_unlock_password', ea.STATE_SET)
                .withLabel('远程开锁密码')
                .withDescription('输入 6 位数字密码。输入、回车或离开输入框只会暂存密码，不会开锁；提交后 HA 只显示掩码“••••••”，真实密码仅保存在 converter RAM；点击“执行远程开锁”后输入框才会被明确清空，暂存值最长 60 秒。'),

            // A one-value SET-only enum is rendered by Z2M frontends as a stateless trigger/action.
            e.enum('remote_unlock_execute', ea.SET, ['执行'])
                .withLabel('执行远程开锁')
                .withDescription('明确执行一次 DP21 含密远程开锁。必须先输入 6 位密码；发送一次后会清除暂存密码，防止误触和重复发送。'),


            e.text('remote_key_value', ea.STATE_SET)
                .withLabel('免密远程密钥')
                .withDescription('输入 8 位数字密钥。输入、回车或离开输入框只会在 Z2M 内存中暂存，不会发送到门锁；提交后 HA 只显示掩码“••••••••”，真实密钥仅保存在 converter RAM；点击“配置/更新免密密钥”后输入框才会被明确清空，暂存值最长 120 秒。'),

            e.enum('remote_key_provision_execute', ea.SET, ['配置'])
                .withLabel('配置 / 更新免密密钥')
                .withDescription('明确执行一次 DP48 密钥配置。当前安全配置固定为 Key ID=1、无限使用次数（FFFF）、从当前 UTC 时间起有效 365 天；操作本身不会触发开锁。'),

            e.text('remote_key_provision_result', ea.STATE)
                .withLabel('最近密钥配置结果')
                .withDescription('锁 MCU 的 DP48 回包。成功表示锁 MCU 已接受并保存 Key ID；非零状态暂以十六进制状态码显示。')
                .withCategory('diagnostic'),

            e.numeric('remote_key_id', ea.STATE)
                .withLabel('免密密钥 ID')
                .withDescription('锁 MCU 在最近一次 DP48 回包中返回的 Key ID。当前 DP48/DP49 安全控制只使用 Key ID=1。')
                .withCategory('diagnostic'),


            e.text('password_free_unlock_key', ea.STATE_SET)
                .withLabel('免密开锁密钥')
                .withDescription('输入当前已经配置到锁 MCU 的 8 位数字密钥。输入、回车或离开输入框只会在 Z2M 内存中暂存，不会开锁；提交后 HA 只显示掩码“••••••••”，真实密钥仅保存在 converter RAM；点击“执行免密远程开锁”后输入框才会被明确清空，暂存值最长 60 秒。'),

            e.enum('password_free_unlock_execute', ea.SET, ['执行'])
                .withLabel('执行免密远程开锁')
                .withDescription('明确执行一次 DP49 免密远程开锁。固定 state=1、Key ID=1、method=0001；每次只发送一次，随后立即清除暂存密钥。'),

            e.text('password_free_unlock_key_result', ea.STATE)
                .withLabel('最近免密密钥校验结果')
                .withDescription('锁 MCU 的 DP49 回包。成功表示本次 DP49 的 Key ID/密钥被接受；最终是否成功开锁仍以“最近一次远程开锁结果”（DP22）为准。')
                .withCategory('diagnostic'),

            e.numeric('password_free_unlock_key_id', ea.STATE)
                .withLabel('最近免密开锁 Key ID')
                .withDescription('锁 MCU 在最近一次 DP49 回包中返回的 Key ID。')
                .withCategory('diagnostic'),

            // ---- Stage 2F-R 临时密码结构化管理 ----
            e.text('temp_password_value', ea.STATE_SET)
                .withLabel('临时密码')
                .withDescription('必须输入正好 6 位数字（不是 8 位动态密码）。提交后 HA 只显示掩码“••••••”，真实密码仅在 converter RAM 中暂存；点击“创建临时密码”或“修改周期性密码有效期”后输入框才会被明确清空，最长暂存 180 秒。'),

            e.enum('temp_password_type', ea.STATE_SET, ['一次性', '周期性'])
                .withLabel('临时密码类型')
                .withDescription('TARGET_SRPTWVAK 的 one_time 标志。当前“周期性”仅表示非一次性，重复星期规则尚未抓包，因此不开放重复计划。'),

            e.text('temp_password_valid_from', ea.STATE_SET)
                .withLabel('临时密码生效时间')
                .withDescription('可输入 YYYY-M-D HH:mm 或 YYYY-MM-DD HH:mm；会自动规范化，固定按中国标准时间 UTC+8 解释，与 Z2M 主机所在时区无关。'),

            e.text('temp_password_valid_to', ea.STATE_SET)
                .withLabel('临时密码失效时间')
                .withDescription('可输入 YYYY-M-D HH:mm 或 YYYY-MM-DD HH:mm；会自动规范化，且必须晚于生效时间。'),

            e.text('temp_password_create_id', ea.STATE_SET)
                .withLabel('创建用临时密码 ID')
                .withDescription('文本输入：0 / 自动 / auto = 自动分配，从 999 向下寻找 Z2M 已知的最高空闲 ID；也可直接输入 1..999。删除成功后 ID 可再次复用。'),

            e.enum('temp_password_create_execute', ea.SET, ['创建'])
                .withLabel('创建临时密码')
                .withDescription('明确执行一次 DP24。必须先输入密码、类型、生效/失效时间；只有收到锁 MCU 成功回包后才把 ID 加入 Z2M 已知列表。'),

            e.text('temp_password_manage_id', ea.STATE_SET)
                .withLabel('要管理的临时密码 ID')
                .withDescription('用于修改、冻结、解冻、删除。请输入 1..999；这是 DP24 临时密码 reference ID，不是 DP59 长期密码硬件 ID。'),

            e.enum('temp_password_update_execute', ea.SET, ['修改'])
                .withLabel('修改周期性密码有效期')
                .withDescription('明确执行 TARGET DP26。当前仅开放已实机抓包验证的周期性密码修改；需重新输入原 6 位密码以及新的有效时间，密码本身不会被保存。'),

            e.enum('temp_password_freeze_execute', ea.SET, ['冻结'])
                .withLabel('冻结临时密码')
                .withDescription('明确执行 TARGET DP27，仅发送所选 ID 的 6-byte reference。'),

            e.enum('temp_password_unfreeze_execute', ea.SET, ['解冻'])
                .withLabel('解冻临时密码')
                .withDescription('明确执行 TARGET DP28，仅发送所选 ID 的 6-byte reference。'),

            e.enum('temp_password_delete_execute', ea.SET, ['删除'])
                .withLabel('删除临时密码')
                .withDescription('明确执行 TARGET DP25。锁 MCU 成功回包后才从 Z2M 已知 ID 列表中移除该 ID。DP39 清空全部故意不开放。'),

            e.text('temp_password_last_result', ea.STATE)
                .withLabel('最近临时密码操作结果')
                .withDescription('DP24/25/26/27/28 的锁 MCU 回包结果。已实机确认 0x01 为成功；其他状态保留十六进制，不猜测。')
                .withCategory('diagnostic'),

            e.numeric('temp_password_last_id', ea.STATE)
                .withLabel('最近临时密码操作 ID')
                .withDescription('最近一次临时密码管理回包中的 reference ID。')
                .withCategory('diagnostic'),

            e.text('temp_password_ids', ea.STATE)
                .withLabel('Z2M 已知临时密码 ID')
                .withDescription('仅由本 converter 成功执行 DP24/25 后维护，用于 999 向下自动分配；这不是锁端“查询列表”，若曾由其他模块管理过锁内临时密码，请用手动 ID 避免冲突。'),

            e.text('temp_password_records', ea.STATE)
                .withLabel('Z2M 临时密码记录')
                .withDescription('只保存非敏感元数据：ID、类型、启用/冻结状态和有效期；绝不保存密码明文。'),

            // ---- Stage 2G 本地凭证录入 / 删除（普通用户槽位） ----
            e.enum('credential_enroll_type', ea.STATE_SET, ['长期密码', '门卡', '指纹'])
                .withLabel('本地凭证录入类型')
                .withDescription('选择后点击“开始录入”。远程请求只让锁进入录入模式；长期密码需在锁面板输入，指纹需在锁上按压，门卡需在锁前刷卡。APP/Z2M 不能远程创建锁本体管理员凭证。'),

            e.enum('credential_enroll_execute', ea.SET, ['开始'])
                .withLabel('开始录入本地凭证')
                .withDescription('发送一次 TARGET DP54 start。请在约 60 秒内到物理锁前完成操作；converter 到时会最多发送一次 FE cancel，不会自动重试 start。'),

            e.enum('credential_enroll_cancel', ea.SET, ['取消'])
                .withLabel('取消本地凭证录入')
                .withDescription('显式发送一次 TARGET DP54 FE cancel。不会删除已经成功完成的凭证。'),

            e.text('credential_enroll_status', ea.STATE)
                .withLabel('最近本地凭证录入状态')
                .withDescription('DP54 状态：开始 / 录入中 / 成功 / 失败。只有 FF + result 00 才把 byte5..6 认作最终凭证 ID；DP54 report byte0 保持 opaque，不用于判断类型。')
                .withCategory('diagnostic'),

            e.numeric('credential_enroll_last_id', ea.STATE)
                .withLabel('最近成功录入凭证 ID')
                .withDescription('仅在 DP54 完成 stage=FF 且 result=00 时更新；中间 stage 的 transient 数值不会写入这里。')
                .withCategory('diagnostic'),

            e.enum('credential_delete_type', ea.STATE_SET, ['长期密码', '门卡', '指纹'])
                .withLabel('要删除的本地凭证类型')
                .withDescription('DP55 单条删除。delete-all 方法明确不开放。'),

            e.text('credential_delete_id', ea.STATE_SET)
                .withLabel('要删除的本地凭证 ID')
                .withDescription('请输入 1..999 的锁端 credential ID，例如实际开锁事件 DP1/2/5 使用的 ID。不要填 DP58/59/60 的 bitmap 同步编号。'),

            e.enum('credential_delete_execute', ea.SET, ['删除'])
                .withLabel('删除本地凭证')
                .withDescription('明确执行一次 TARGET DP55 单条删除。必须先选择类型和 ID；不会发送 delete-all。'),

            e.text('credential_delete_result', ea.STATE)
                .withLabel('最近本地凭证删除结果')
                .withDescription('DP55 回包；已实机确认 result=FF 为成功，其他状态保留十六进制。')
                .withCategory('diagnostic'),

            e.numeric('credential_delete_last_id', ea.STATE)
                .withLabel('最近删除凭证 ID')
                .withDescription('最近一次 DP55 回包中的 credential ID。')
                .withCategory('diagnostic'),

            // DP58/59/60 are lock-side local credential hardware-ID bitmaps.
            e.text('fingerprint_id_list', ea.STATE)
                .withLabel('指纹同步编号（DP58）')
                .withDescription('DP58 shard/bitmap 的原始同步编号。实机已观察到它可能与 DP1/DP54/DP55 credential ID 存在偏移，因此这里不自动减 8、不把它当锁端用户编号。'),

            e.numeric('fingerprint_id_count', ea.STATE)
                .withLabel('指纹数量')
                .withDescription('由 DP58 bitmap 解码得到的同步编号数量。'),

            e.text('password_id_list', ea.STATE)
                .withLabel('长期密码同步编号（DP59）')
                .withDescription('DP59 shard/bitmap 的原始同步编号；与 DP24 临时密码 reference 不同，也暂不假定与 DP2/DP54/DP55 credential ID 是同一编号空间。'),

            e.numeric('password_id_count', ea.STATE)
                .withLabel('长期密码数量')
                .withDescription('由 DP59 bitmap 解码得到的同步编号数量。'),

            e.text('card_id_list', ea.STATE)
                .withLabel('门卡同步编号（DP60）')
                .withDescription('DP60 shard/bitmap 的原始同步编号；暂不自动应用 +8/-8 映射，等更多 target evidence 后再定。'),

            e.numeric('card_id_count', ea.STATE)
                .withLabel('门卡数量')
                .withDescription('由 DP60 bitmap 解码得到的同步编号数量。'),

            e.enum('kagel_power_mode', ea.STATE_SET, ['performance', 'balanced', 'saver'])
                .withLabel('省电模式')
                .withDescription('performance=性能（约1秒轮询）；balanced=均衡（约2秒，默认）；saver=省电（约6秒，远程命令延迟更高）。')
                .withCategory('config'),

            e.enum('last_unlock_credential_type', ea.STATE,
                ['finger', 'password', 'temp', 'dynamic', 'card', 'face', 'key'])
                .withLabel('最近开锁凭证类型')
                .withDescription('最近一次使用本地凭证成功开锁的类型。该状态会保持到下一次凭证开锁，不会随瞬时 action 自动清空。'),

            e.numeric('last_unlock_credential_id', ea.STATE)
                .withLabel('最近开锁凭证 ID')
                .withDescription('最近一次凭证开锁时锁 MCU 上报的原始事件值。指纹/长期密码/门卡通常对应 credential ID；临时密码 DP3 的 target 值（例如 899）不应解释为 DP24 reference ID。'),

            e.text('last_unlock_event', ea.STATE)
                .withLabel('最近开锁事件')
                .withDescription('每收到一次真实凭证开锁上报都会生成新的“类型 · ID/设备记录值 · 时间”文本。即使连续两次使用同一个凭证，这个状态也会因时间不同而变化，便于 Home Assistant Recorder 逐次记录。'),

            e.text('last_unlock_event_at', ea.STATE)
                .withLabel('最近开锁事件时间')
                .withDescription('本 converter 收到最近一次凭证开锁上报时生成的 ISO 时间戳。主要用于事件历史和自动化触发；连续使用相同凭证也会更新。'),

            e.text('firmware_version', ea.STATE)
                .withLabel('固件版本')
                .withDescription('TYZS5 模组固件版本（DP204，上线/入网时上报）')
                .withCategory('diagnostic'),

            e.text('lock_record', ea.STATE)
                .withLabel('原始门锁记录')
                .withDescription('DP92 原始十六进制记录，仅供协议调试。')
                .withCategory('diagnostic'),

            // 以下项目故意不放进日常 UI：
            // - remote_unlock_switch / DP23：当前固件不允许下发，而且原厂 APP 的同名开关属于更高层权限逻辑。
            // - DP24~28：已通过上方结构化 UI 开放；旧 raw hex 入口保持禁用。DP39 清空全部仍明确禁用。
            // - DP48：已通过上方专用两步 UI 开放；旧 raw hex 入口保持禁用。
            // - DP49：已通过上方专用两步 UI 开放；旧 raw hex 入口保持禁用。
            // - DP54/55：已通过上方 Stage 2G 结构化安全 UI 开放；旧 raw hex 入口保持禁用。
            // - DP68~70：离线密码管理，尚未开放控制。
            // - DP200：旧 converter 的手动同步入口；当前固件没有对应 EF00 DP200 控制路径，因此移除。
            // - DP205 / OTA：当前固件未开放 OTA 写入/安装。
            // - FC00 claim/auth：当前 TYZS5 固件已禁用/惰性化，因此生产 converter 不再注册该控制面。
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
                // DP21 is intentionally NOT exposed through nicki_ek.tz.datapoints.
                // The safe two-step tzRemoteUnlockSafe converter above owns DP21 transmission.
                [23, 'remote_unlock_switch', {from: (v) => (v ? 'ON' : 'OFF')}],
                // DP 202 = sleepy-poll power mode. Like DP200 it's module-local: the
                // firmware (app_zb_ef00_rx) intercepts it to reset the long-poll cadence
                // and does NOT forward it to the MCU. Sent as a 1-byte RAW value (array
                // return -> raw datapoint, exactly like rawHex) so the firmware reads
                // p[4] = the mode byte deterministically — no enum/int datatype guessing.
                [202, 'kagel_power_mode', {
                    to: (v) => [({performance: 0, balanced: 1, saver: 2})[v] ?? 1],
                    from: (v) => ({0: 'performance', 1: 'balanced', 2: 'saver'})[
                        Buffer.isBuffer(v) ? v[0] : (Array.isArray(v) ? v[0] : v)] ?? 'balanced',
                }],
                // DP 204 = firmware version (module -> hub, string, reported once per join).
                // Regen-free stand-in for genBasic swBuildId; the hub surfaces it as the
                // device 'firmware' field. Report-only (no `to`).
                [204, 'firmware_version', {from: (v) => (Buffer.isBuffer(v) ? v.toString('ascii') : String(v))}],
                // DP205 / OTA trigger intentionally absent in Stable v1.2.
                // DP48 is intentionally NOT exposed through nicki_ek.tz.datapoints.
                // tzRemoteKeyProvisionSafe owns DP48 transmission.
                // DP49 is intentionally NOT exposed through nicki_ek.tz.datapoints.
                // tzPasswordFreeUnlockSafe owns DP49 transmission.
                // ---- temp-password management ----
                // DP24/25/26/27/28 are owned by tzTempPasswordSafe + fzTempPasswordResult.
                // DP39 is deliberately disabled.
                // ---- offline passwords ----
                // DP68/69/70 offline-password controls intentionally absent in Stable v1.2.
                [91, 'password_offline_time', {from: (v) => String(v)}],
                // ---- enrollment management + sync ----
                // DP58/59/60 are decoded by fzReadableCredentialIdLists; raw hex is not stored.
                [93, 'update_all_face', rawHex],
                // ---- records ----
                [92, 'lock_record', rawHex],
            ],
        },
    },
];
