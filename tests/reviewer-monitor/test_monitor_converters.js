'use strict';

const assert = require('assert');
const fs = require('fs');
const Module = require('module');
const path = require('path');

const EA = {STATE: 1, SET: 2, STATE_SET: 3, ALL: 7};

function chainable(kind, property, access, values) {
    return {
        kind, property, access, values,
        withDescription(v) { this.description = v; return this; },
        withLabel(v) { this.label = v; return this; },
        withCategory(v) { this.category = v; return this; },
        withUnit(v) { this.unit = v; return this; },
        withValueMin(v) { this.value_min = v; return this; },
        withValueMax(v) { this.value_max = v; return this; },
    };
}

const exposesStub = {
    access: EA,
    presets: {
        action: (values) => chainable('action', 'action', EA.STATE, values),
        battery: () => chainable('numeric', 'battery', EA.STATE),
        text: (property, access) => chainable('text', property, access),
        numeric: (property, access) => chainable('numeric', property, access),
        enum: (property, access, values) => chainable('enum', property, access, values),
    },
};

const tuyaStub = {
    fz: {datapoints: {name: 'stub-tuya-datapoints'}},
};

const originalLoad = Module._load;
Module._load = function(request, parent, isMain) {
    if (request === 'zigbee-herdsman-converters/lib/exposes') return exposesStub;
    if (request === 'zigbee-herdsman-converters/lib/tuya') return tuyaStub;
    return originalLoad.call(this, request, parent, isMain);
};

function load(name) {
    const file = path.join(__dirname, name);
    delete require.cache[require.resolve(file)];
    const defs = require(file);
    assert(Array.isArray(defs) && defs.length === 1, `${name}: expected one definition`);
    return {file, def: defs[0]};
}

function dpMsg(dp, data) {
    return {data: {dpValues: [{dp, data: Buffer.from(data)}]}};
}

function runCustom(def, index, msg) {
    const converter = def.fromZigbee[index];
    assert(converter && typeof converter.convert === 'function');
    return converter.convert(def, msg, () => {}, {}, {});
}

function assertReadOnly(file, def, expectedModel) {
    assert.deepStrictEqual(def.fingerprint, [{manufacturerName: 'Tuya', modelID: expectedModel}]);
    assert.strictEqual(def.model, expectedModel);
    assert(Array.isArray(def.toZigbee) && def.toZigbee.length === 0, `${expectedModel}: toZigbee must be empty`);
    for (const expose of def.exposes) {
        assert.strictEqual(expose.access, EA.STATE, `${expectedModel}: writable expose ${expose.property}`);
    }

    const source = fs.readFileSync(file, 'utf8');
    for (const forbidden of ['sendDataPoint', 'convertSet:', 'ea.SET', 'ea.STATE_SET', 'ea.ALL']) {
        assert(!source.includes(forbidden), `${expectedModel}: forbidden token ${forbidden}`);
    }
}

const t3 = load('tuya_ty0a01_tyzs3_monitor.js');
const t5 = load('tuya_ty0a01_tyzs5_monitor.js');

assertReadOnly(t3.file, t3.def, 'TY0A01-TYZS3-MON');
assertReadOnly(t5.file, t5.def, 'TY0A01-TYZS5-MON');

// Fingerprints are mutually exclusive and cannot match Control identities.
assert.notStrictEqual(t3.def.fingerprint[0].modelID, 'TY0A01-TYZS3');
assert.notStrictEqual(t5.def.fingerprint[0].modelID, 'TY0A01-TYZS5');
assert.notStrictEqual(t3.def.fingerprint[0].modelID, t5.def.fingerprint[0].modelID);

// The second custom fromZigbee converter is the credential bitmap decoder.
let r = runCustom(t5.def, 1, dpMsg(58, [0x01, 0x0A, 0x03, 0x02]));
assert.strictEqual(r.fingerprint_id_list, '1, 3, 17');
assert.strictEqual(r.fingerprint_id_count, 3);

r = runCustom(t3.def, 1, dpMsg(58, [0x01, 0x04, 0x02, 0x6C]));
assert.strictEqual(r.fingerprint_id_list, '2, 10, 11, 13, 14');
assert.strictEqual(r.fingerprint_id_count, 5);

r = runCustom(t3.def, 1, dpMsg(59, [0x01, 0x01, 0x02, 0x80]));
assert.strictEqual(r.password_id_list, '0, 15');
assert.strictEqual(r.password_id_count, 2);

r = runCustom(t3.def, 1, dpMsg(60, [0x02, 0x10, 0x03, 0x01]));
assert.strictEqual(r.card_id_list, '12, 16');
assert.strictEqual(r.card_id_count, 2);

r = runCustom(t3.def, 1, dpMsg(93, [0x02, 0x40]));
assert.strictEqual(r.face_id_list, '14');
assert.strictEqual(r.face_id_count, 1);

r = runCustom(t5.def, 1, dpMsg(58, [0x00, 0x00]));
assert.strictEqual(r.fingerprint_id_list, '无');
assert.strictEqual(r.fingerprint_id_count, 0);

r = runCustom(t5.def, 1, dpMsg(58, [0x00, 0x01]));
assert(r.fingerprint_id_list.startsWith('格式异常'));
assert.strictEqual(r.fingerprint_id_count, 0);

// The first custom fromZigbee converter preserves credential ID from unlock reports.
r = runCustom(t5.def, 0, dpMsg(2, [0x00, 0x11]));
assert.strictEqual(r.last_unlock_credential_type, 'password');
assert.strictEqual(r.last_unlock_credential_id, 17);
assert(r.last_unlock_event.includes('凭证 ID 17'));
assert(r.last_unlock_event_at);

// Verify mapped passive DPs only; no command/control DP is present in tuyaDatapoints.
const t3Mapped = new Set(t3.def.meta.tuyaDatapoints.map((x) => x[0]));
const t5Mapped = new Set(t5.def.meta.tuyaDatapoints.map((x) => x[0]));
for (const dp of [21,24,25,26,27,28,48,49,54,55,68,69,70,200,202,205]) {
    assert(!t3Mapped.has(dp), `TYZS3 Monitor unexpectedly maps control DP${dp}`);
    assert(!t5Mapped.has(dp), `TYZS5 Monitor unexpectedly maps control DP${dp}`);
}

console.log('PASS: Monitor converter structural/read-only checks');
console.log('PASS: credential bitmap vectors and empty sentinel');
console.log('PASS: unlock credential ID event decoding');
console.log('PASS: no Control DP mappings or toZigbee writers');
