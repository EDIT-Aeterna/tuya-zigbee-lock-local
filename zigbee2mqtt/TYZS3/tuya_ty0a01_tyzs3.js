// TYZS3 converter v0.1.0 — Initial validated TYZS3 integration.
// Tested product binding ujcjk46o / MCU 1.0.0; only DP21/54/55 writes.
// Structured staging/builders retained from reviewed TYZS5 v1.2.2.
// Face type 4 is an observed extension; use only on a supporting lock MCU.
const nicki_ek = require('zigbee-herdsman-converters/lib/tuya');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const e = exposes.presets;
const ea = exposes.access;
const legacyCleanupDeviceKey = (msg) => msg.device?.ieeeAddr || msg.endpoint?.deviceIeeeAddress || 'single-device-fallback';
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

const CREDENTIAL_ENROLL_TIMEOUT_MS = 60 * 1000;
const CREDENTIAL_TYPE_TO_CODE = {'长期密码': 0x01, '门卡': 0x02, '指纹': 0x03, '人脸': 0x04};
const CREDENTIAL_CODE_TO_TYPE = {1: '长期密码', 2: '门卡', 3: '指纹', 4: '人脸'};
const pendingCredentialEnrollment = new Map();
const pendingCredentialDelete = new Map();
const credentialUiState = new Map();

const getCredentialUiState = (deviceKey) => {
    if (!credentialUiState.has(deviceKey)) credentialUiState.set(deviceKey, {});
    return credentialUiState.get(deviceKey);
};

const buildTargetDp54 = (typeName, stage) => {
    const type = CREDENTIAL_TYPE_TO_CODE[typeName];
    if (!type) throw new Error('凭证类型必须是“长期密码 / 门卡 / 指纹 / 人脸”');
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
    if (!type) throw new Error('删除类型必须是“长期密码 / 门卡 / 指纹 / 人脸”');
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
            if (!CREDENTIAL_TYPE_TO_CODE[value]) throw new Error('凭证类型必须是“长期密码 / 门卡 / 指纹 / 人脸”');
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
            if (!CREDENTIAL_TYPE_TO_CODE[value]) throw new Error('删除类型必须是“长期密码 / 门卡 / 指纹 / 人脸”');
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
    // Exact empty-list sentinel observed on the tested TYZS3 lock MCU.
    if (b.length === 2 && b[0] === 0 && b[1] === 0) return {ids: []};
    const ids = new Set();
    for (let i = 0; i < b.length; i += 2) {
        const fragment = b[i];
        const mask = b[i + 1];
        if (fragment === 0) return {error: '分片号异常 0（该格式使用从 1 开始的分片号）', ids: []};
        for (let bit = 0; bit < 8; bit++) {
            if (mask & (1 << bit)) ids.add((fragment - 1) * 8 + bit);
        }
    }
    return {ids: [...ids].sort((a, b2) => a - b2)};
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
            else if (d.dp === 93) putReadableCredentialList(result, 'face', d.data);
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
            if (oldState.update_all_face != null) {
                if (result.face_id_list === undefined) {
                    putReadableCredentialList(result, 'face', oldState.update_all_face);
                }
                result.update_all_face = null;
            }
        }

        return Object.keys(result).length ? result : undefined;
    },
};


const actions = {1:'unlock_fingerprint',2:'unlock_password',3:'unlock_temporary',4:'unlock_dynamic',
    5:'unlock_card',6:'unlock_face',7:'unlock_key',41:'unlock_remote',45:'unlock_hand',
    62:'unlock_voice_remote',14:'doorbell',35:'hijack',36:'open_inside'};
module.exports = [{
    fingerprint: [{manufacturerName:'Tuya',modelID:'TY0A01-TYZS3'}],
    model:'TY0A01-TYZS3',vendor:'Tuya',
    description:'Initial validated TYZS3 integration v0.1.0, ujcjk46o (DP21/54/55 only)',
    fromZigbee:[fzUnlockId,fzCredentialManagementResult,fzReadableCredentialIdLists,nicki_ek.fz.datapoints],
    toZigbee:[tzRemoteUnlockSafe,tzCredentialManagementSafe],
    exposes:[
        e.action(Object.values(actions)),e.battery(),
        e.text('alarm',ea.STATE).withDescription('Optional MCU-reported alarm code'),
        e.text('firmware_version',ea.STATE).withDescription('Module DP204 version; not MCU product-info version'),
        e.text('remote_unlock_password',ea.SET).withDescription('Stage six ASCII digits in RAM; execute within 60 seconds'),
        e.enum('remote_unlock_execute',ea.SET,['执行']).withDescription('One explicit DP21 command; clears staged secret'),
            e.enum('credential_enroll_type', ea.STATE_SET, ['长期密码', '门卡', '指纹', '人脸'])
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

            e.enum('credential_delete_type', ea.STATE_SET, ['长期密码', '门卡', '指纹', '人脸'])
                .withLabel('要删除的本地凭证类型')
                .withDescription('DP55 单条删除。delete-all 方法明确不开放。'),

            e.text('credential_delete_id', ea.STATE_SET)
                .withLabel('要删除的本地凭证 ID')
                .withDescription('请输入锁端 credential ID（本控制仍接受 1..999）。可参考对应 DP58/59/60/93 解码后的凭证 ID 列表，并确保选择正确的凭证类型。'),

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

            e.text('fingerprint_id_list', ea.STATE)
                .withLabel('指纹 credential ID 列表（DP58）')
                .withDescription('DP58 shard 从 1 开始；测试锁上与本地开锁事件及 DP54/55 使用相同硬件 credential ID。能力取决于锁 MCU。'),
            e.numeric('fingerprint_id_count', ea.STATE)
                .withLabel('指纹数量')
                .withDescription('由 DP58 bitmap 解码得到的凭证 ID 数量。'),

            e.text('password_id_list', ea.STATE)
                .withLabel('长期密码 credential ID 列表（DP59）')
                .withDescription('DP59 shard 从 1 开始；测试锁上与本地开锁事件及 DP54/55 使用相同硬件 credential ID。能力取决于锁 MCU。'),
            e.numeric('password_id_count', ea.STATE)
                .withLabel('长期密码数量')
                .withDescription('由 DP59 bitmap 解码得到的凭证 ID 数量。'),

            e.text('card_id_list', ea.STATE)
                .withLabel('门卡 credential ID 列表（DP60）')
                .withDescription('DP60 shard 从 1 开始；测试锁上与本地开锁事件及 DP54/55 使用相同硬件 credential ID。能力取决于锁 MCU。'),
            e.numeric('card_id_count', ea.STATE)
                .withLabel('门卡数量')
                .withDescription('由 DP60 bitmap 解码得到的凭证 ID 数量。'),

            e.text('face_id_list', ea.STATE)
                .withLabel('人脸 credential ID 列表（DP93）')
                .withDescription('DP93 为实机确认扩展 DP； shard 从 1 开始；测试锁上与本地开锁事件及 DP54/55 使用相同硬件 credential ID。能力取决于锁 MCU。'),
            e.numeric('face_id_count', ea.STATE)
                .withLabel('人脸数量')
                .withDescription('由 DP93 bitmap 解码得到的凭证 ID 数量。'),


        e.text('last_unlock_credential_type',ea.STATE),
        e.numeric('last_unlock_credential_id',ea.STATE),
        e.text('last_unlock_event',ea.STATE),
        e.text('last_unlock_event_at',ea.STATE),
        e.text('remote_result',ea.STATE),
    ],
    meta:{tuyaDatapoints:[
        ...Object.entries(actions).map(([dp,action])=>[Number(dp),'action',{from:()=>action}]),
        [10,'battery',{from:(v)=>v}],
        [9,'alarm',{from:(v)=>'alarm_'+v}],
        [22,'remote_result',{from:(v)=>String(v)}],
        [204,'firmware_version',{from:(v)=>Buffer.isBuffer(v)?v.toString('ascii'):String(v)}],
    ]},
}];
