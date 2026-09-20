'use strict';
// Release supplement: real definition mappings with dependency stubs, no radio.
const assert = require('assert'), fs = require('fs'), path = require('path'), vm = require('vm');
function load(module, monitor) {
    const file = path.join(__dirname, '../zigbee2mqtt', module, `tuya_ty0a01_${module.toLowerCase()}${monitor ? '_monitor' : ''}.js`);
    const expose = (name, access) => {
        const e = {name, access};
        for (const m of ['withLabel', 'withDescription', 'withCategory', 'withUnit', 'withValueMin', 'withValueMax', 'withValueStep']) e[m] = (v) => {e[m.slice(4).toLowerCase()] = v; return e;};
        return e;
    };
    const context = {Buffer, Map, Set, Date, console, module: {exports: {}}, setTimeout: () => 1, clearTimeout: () => {}, require: (name) => {
        if (name.endsWith('/tuya')) return {fz: {datapoints: {}}, tz: {datapoints: {}}};
        if (name.endsWith('/exposes')) return {access: {STATE: 1, SET: 2, STATE_SET: 3, ALL: 7}, presets: {text: expose, numeric: expose, enum: expose, binary: expose, action: () => expose('action', 1), battery: () => expose('battery', 1)}};
        throw Error(name);
    }};
    vm.runInNewContext(fs.readFileSync(file, 'utf8'), context);
    return context.module.exports[0];
}
const definitions = [];
for (const module of ['TYZS3', 'TYZS5']) {
    const d = load(module, true);
    definitions.push(d, load(module, false));
    const decode = (dp, value) => d.meta.tuyaDatapoints.find((v) => v[0] === dp)[2].from(value);
    assert.strictEqual(decode(10, 73), 73);
    for (const [dp, action] of [[1, 'unlock_fingerprint'], [2, 'unlock_password'], [5, 'unlock_card'], [6, 'unlock_face'], [14, 'doorbell'], [35, 'hijack'], [36, 'open_inside']]) assert.strictEqual(decode(dp, 1), action);
    for (const [dp, kind] of [[1, 'finger'], [2, 'password'], [3, 'temp'], [4, 'dynamic'], [5, 'card'], [6, 'face'], [7, 'key']]) {
        const r = d.fromZigbee[0].convert(null, {data: {dpValues: [{dp, data: Buffer.from([0, 17])}]}});
        assert.strictEqual(r.last_unlock_credential_type, kind); assert.strictEqual(r.last_unlock_credential_id, 17);
    }
    for (const [dp, kind] of [[58, 'fingerprint'], [59, 'password'], [60, 'card'], [93, 'face']]) {
        for (const [bytes, list, count] of [[[1, 10, 3, 2], '1, 3, 17', 3], [[0, 0], '无', 0], [[2, 128], '15', 1]]) {
            const r = d.fromZigbee[1].convert(null, {data: {dpValues: [{dp, data: Buffer.from(bytes)}]}});
            assert.strictEqual(r[kind + '_id_list'], list); assert.strictEqual(r[kind + '_id_count'], count);
        }
    }
    assert.strictEqual(decode(204, Buffer.from(module === 'TYZS5' ? '1.0.2-MON' : 'T3-1-MON')), module === 'TYZS5' ? '1.0.2-MON' : 'T3-1-MON');
    if (module === 'TYZS5') {
        const alarms = ['wrong_finger', 'wrong_password', 'wrong_card', 'wrong_face', 'tongue_bad', 'too_hot', 'unclosed_time', 'tongue_not_out', 'pry', 'key_in', 'low_battery'];
        alarms.forEach((v, i) => assert.strictEqual(decode(9, i), v));
        assert.strictEqual(decode(9, 255), 'alarm_255'); assert.strictEqual(decode(8, 1), '1');
        const dp8 = d.exposes.find((e) => e.name === 'open_close');
        assert.strictEqual(dp8.access, 1); assert.strictEqual(dp8.category, 'diagnostic');
        assert(dp8.description.includes('Not a reliable independent physical door-contact sensor'));
    } else { assert.strictEqual(decode(9, 8), 'alarm_8'); }
}
for (const model of ['TY0A01-TYZS3', 'TY0A01-TYZS3-MON', 'TY0A01-TYZS5', 'TY0A01-TYZS5-MON']) {
    const matched = definitions.filter((d) => d.fingerprint.some((f) => f.manufacturerName === 'Tuya' && f.modelID === model));
    assert.strictEqual(matched.length, 1, model);
}
console.log('PASS: four fingerprints isolated; Monitor battery/events/IDs/lists/alarms/DP8/version vectors');
