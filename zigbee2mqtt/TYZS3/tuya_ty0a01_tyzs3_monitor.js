// TZLL Zigbee2MQTT external converter — TYZS3 Monitor Edition.
// v0.1.0 — read-only integration for firmware identity Tuya / TY0A01-TYZS3-MON.
//
// Security boundary:
//   * No lock-control toZigbee converter is registered.
//   * Every exposed TZLL property is STATE/event only.
//   * The matching Monitor firmware independently rejects all externally-originated
//     lock-control DPs, so the integration and firmware provide defense in depth.
//
// Passive decoding is intentionally kept aligned with the validated TYZS3 Control
// converter for unlock events, battery, alarm, firmware version and credential lists.

const tuya = require('zigbee-herdsman-converters/lib/tuya');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const e = exposes.presets;
const ea = exposes.access;

const UNLOCK_ID_DP = {
    1: 'finger',
    2: 'password',
    3: 'temp',
    4: 'dynamic',
    5: 'card',
    6: 'face',
    7: 'key',
};

const UNLOCK_TYPE_CN = {
    finger: '指纹',
    password: '长期密码',
    temp: '临时密码',
    dynamic: '动态密码',
    card: '门卡',
    face: '人脸',
    key: '机械钥匙',
};

const ACTIONS = {
    1: 'unlock_fingerprint',
    2: 'unlock_password',
    3: 'unlock_temporary',
    4: 'unlock_dynamic',
    5: 'unlock_card',
    6: 'unlock_face',
    7: 'unlock_key',
    14: 'doorbell',
    35: 'hijack',
    36: 'open_inside',
    41: 'unlock_remote',
    45: 'unlock_hand',
    62: 'unlock_voice_remote',
};

const REPORT_TYPES = [
    'commandDataResponse',
    'commandDataReport',
    'commandActiveStatusReport',
    'commandActiveStatusReportAlt',
];

const toBytes = (value) => {
    if (Buffer.isBuffer(value)) return value;
    if (Array.isArray(value) || ArrayBuffer.isView(value)) return Buffer.from(value);
    return Buffer.from(value || []);
};

const fzUnlockId = {
    cluster: 'manuSpecificTuya',
    type: REPORT_TYPES,
    convert: (model, msg) => {
        const dps = (msg.data && msg.data.dpValues) || [];
        for (const d of dps) {
            const type = UNLOCK_ID_DP[d.dp];
            if (!type) continue;

            const bytes = toBytes(d.data);
            let id = 0;
            for (const x of bytes) id = (id << 8) | x;

            const eventAt = new Date().toISOString();
            const idText = (type === 'temp' || type === 'dynamic') ?
                `设备记录值 ${id}` : `凭证 ID ${id}`;

            return {
                last_unlock_credential_type: type,
                last_unlock_credential_id: id,
                last_unlock_event_at: eventAt,
                last_unlock_event: `${UNLOCK_TYPE_CN[type] || type} · ${idText} · ${eventAt}`,
            };
        }
        return undefined;
    },
};

const bitmapBytes = (value) => {
    if (Buffer.isBuffer(value)) return value;
    if (Array.isArray(value) || ArrayBuffer.isView(value)) return Buffer.from(value);
    if (typeof value === 'string') {
        const hex = value.trim().replace(/^0x/i, '').replace(/\s+/g, '');
        if (!hex) return Buffer.alloc(0);
        if (!/^[0-9a-fA-F]+$/.test(hex) || (hex.length % 2) !== 0) return null;
        return Buffer.from(hex, 'hex');
    }
    return null;
};

const parseShardBitmapIds = (value) => {
    const bytes = bitmapBytes(value);
    if (bytes === null) return {error: '不是有效字节数组/hex', ids: []};
    if ((bytes.length % 2) !== 0) return {error: `长度异常 ${bytes.length}`, ids: []};

    // Exact empty-list sentinel observed on the tested lock family.
    if (bytes.length === 2 && bytes[0] === 0 && bytes[1] === 0) return {ids: []};

    const ids = new Set();
    for (let i = 0; i < bytes.length; i += 2) {
        const fragment = bytes[i];
        const mask = bytes[i + 1];
        if (fragment === 0) {
            return {error: '分片号异常 0（该格式使用从 1 开始的分片号）', ids: []};
        }
        for (let bit = 0; bit < 8; bit++) {
            if (mask & (1 << bit)) ids.add((fragment - 1) * 8 + bit);
        }
    }
    return {ids: [...ids].sort((a, b) => a - b)};
};

const putCredentialList = (result, kind, value) => {
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
    type: REPORT_TYPES,
    convert: (model, msg) => {
        const result = {};
        const dps = (msg.data && msg.data.dpValues) || [];
        for (const d of dps) {
            if (d.dp === 58) putCredentialList(result, 'fingerprint', d.data);
            else if (d.dp === 59) putCredentialList(result, 'password', d.data);
            else if (d.dp === 60) putCredentialList(result, 'card', d.data);
            else if (d.dp === 93) putCredentialList(result, 'face', d.data);
        }
        return Object.keys(result).length ? result : undefined;
    },
};

const firmwareVersion = {
    from: (value) => Buffer.isBuffer(value) ? value.toString('ascii') : String(value),
};

const definitions = [{
    fingerprint: [{manufacturerName: 'Tuya', modelID: 'TY0A01-TYZS3-MON'}],
    model: 'TY0A01-TYZS3-MON',
    vendor: 'Tuya',
    description: 'TZLL TYZS3 Monitor Edition v0.1.0 — read-only Zigbee2MQTT integration',

    fromZigbee: [fzUnlockId, fzReadableCredentialIdLists, tuya.fz.datapoints],
    toZigbee: [],

    exposes: [
        e.action(Object.values(ACTIONS)),
        e.battery(),
        e.text('alarm', ea.STATE)
            .withDescription('Optional MCU-reported alarm code.'),
        e.text('firmware_version', ea.STATE)
            .withDescription('TZLL module DP204 version; not the lock MCU Product Info version.')
            .withCategory('diagnostic'),

        e.text('fingerprint_id_list', ea.STATE)
            .withLabel('指纹 credential ID 列表（DP58）')
            .withDescription('DP58 bitmap，分片号从 1 开始；能力取决于锁 MCU。'),
        e.numeric('fingerprint_id_count', ea.STATE)
            .withLabel('指纹数量')
            .withDescription('由 DP58 bitmap 解码得到。'),
        e.text('password_id_list', ea.STATE)
            .withLabel('长期密码 credential ID 列表（DP59）')
            .withDescription('DP59 bitmap，分片号从 1 开始；能力取决于锁 MCU。'),
        e.numeric('password_id_count', ea.STATE)
            .withLabel('长期密码数量')
            .withDescription('由 DP59 bitmap 解码得到。'),
        e.text('card_id_list', ea.STATE)
            .withLabel('门卡 credential ID 列表（DP60）')
            .withDescription('DP60 bitmap，分片号从 1 开始；能力取决于锁 MCU。'),
        e.numeric('card_id_count', ea.STATE)
            .withLabel('门卡数量')
            .withDescription('由 DP60 bitmap 解码得到。'),
        e.text('face_id_list', ea.STATE)
            .withLabel('人脸 credential ID 列表（DP93）')
            .withDescription('DP93 为实机确认扩展 DP；bitmap 分片号从 1 开始；能力取决于锁 MCU。'),
        e.numeric('face_id_count', ea.STATE)
            .withLabel('人脸数量')
            .withDescription('由 DP93 bitmap 解码得到。'),

        e.text('last_unlock_credential_type', ea.STATE)
            .withLabel('最近开锁凭证类型'),
        e.numeric('last_unlock_credential_id', ea.STATE)
            .withLabel('最近开锁凭证 ID'),
        e.text('last_unlock_event', ea.STATE)
            .withLabel('最近开锁事件'),
        e.text('last_unlock_event_at', ea.STATE)
            .withLabel('最近开锁事件时间'),
    ],

    meta: {
        tuyaDatapoints: [
            ...Object.entries(ACTIONS).map(([dp, action]) => [Number(dp), 'action', {from: () => action}]),
            [10, 'battery', {from: (value) => value}],
            [9, 'alarm', {from: (value) => `alarm_${value}`}],
            [204, 'firmware_version', firmwareVersion],
        ],
    },
}];

module.exports = definitions;
