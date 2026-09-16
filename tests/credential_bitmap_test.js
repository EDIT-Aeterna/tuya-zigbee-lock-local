'use strict';
const fs = require('fs');
const path = require('path');
const vm = require('vm');
const assert = require('assert');
const source = fs.readFileSync(path.join(__dirname, '../zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js'), 'utf8');
const start = source.indexOf('const credentialListMigrationDone');
const end = source.indexOf('module.exports', start);
assert(start > 0 && end > start);
const context = {Buffer, legacyCleanupDeviceKey: (msg) => msg.device.ieeeAddr};
vm.createContext(context);
vm.runInContext(source.slice(start, end) + '\nthis.parse = parseShardBitmapIds; this.decode = fzReadableCredentialIdLists.convert;', context);
const vectors = [['', []], ['010a0302', [1,3,17]], ['0104026c', [2,10,11,13,14]], ['01010280', [0,15]], ['02100301', [12,16]], ['0240', [14]], ['0302010a0302', [1,3,17]]];
const supplied = require('./credential_bitmap_test_vectors.json');
for (const v of supplied.valid) vectors.push([v.hex, v.expected_ids]);
for (const [hex, expected] of vectors) {
    for (const value of [hex, Buffer.from(hex, 'hex'), [...Buffer.from(hex, 'hex')], new Uint8Array(Buffer.from(hex, 'hex'))]) {
        assert.strictEqual(JSON.stringify(context.parse(value)), JSON.stringify({ids: expected}));
    }
}
assert.strictEqual(JSON.stringify(context.parse('0x01 0a 03 02').ids), '[1,3,17]');
for (const bad of ['01', '0001', 'zz', '01010001', ...supplied.invalid.map((v) => v.hex)]) {
    assert(context.parse(bad).error);
    assert.strictEqual(JSON.stringify(context.parse(bad).ids), '[]');
}
const report = (device, dpValues, state = {}) => context.decode(null, {device: {ieeeAddr: device}, data: {dpValues}}, null, null, {state});
for (const [dp, kind] of [[58, 'fingerprint'], [59, 'password'], [60, 'card'], [93, 'face']]) {
    const result = report(String(dp), [{dp, data: Buffer.from('0240', 'hex')}]);
    assert.strictEqual(result[kind + '_id_list'], '14');
    assert.strictEqual(result[kind + '_id_count'], 1);
}
const migrated = report('migration', [], {update_all_face: '0240'});
assert.strictEqual(migrated.face_id_list, '14');
assert.strictEqual(migrated.face_id_count, 1);
assert.strictEqual(migrated.update_all_face, null);
assert.strictEqual(report('migration', [], {update_all_face: '0240'}), undefined);
const fresh = report('fresh', [{dp: 93, data: Buffer.from('0101', 'hex')}], {update_all_face: '0240'});
assert.strictEqual(fresh.face_id_list, '0');
assert.strictEqual(fresh.update_all_face, null);
assert(!source.includes("[93, 'update_all_face', rawHex]"));
assert(source.includes("e.text('face_id_list', ea.STATE)"));
assert(source.includes("e.numeric('face_id_count', ea.STATE)"));
// Pin write-side invariance to the reviewed alpha.1 release, including all
// control builders, validators, handlers and the generic datapoint metadata.
const {execFileSync} = require('child_process');
const baseline = execFileSync('git', ['show', 'v1.0.0-alpha.1:zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js'], {cwd: path.join(__dirname, '..'), encoding: 'utf8'});
const normalize = (s) => s.replace(/\r\n/g, '\n');
const writeRegion = (s) => normalize(s.slice(s.indexOf('// Writable controls'), s.indexOf('// ---- Readable lock-side')));
assert.strictEqual(writeRegion(source), writeRegion(baseline), 'Control implementation changed');
assert.strictEqual(source.match(/toZigbee: \[[^\n]+/)[0], baseline.match(/toZigbee: \[[^\n]+/)[0]);
const metadata = (s) => normalize(s.slice(s.indexOf('        meta:'))).replace(/^.*\/\/.*$/gm, '').replace(/^.*\[93, 'update_all_face', rawHex\],.*$/gm, '').replace(/\s+/g, '');
assert.strictEqual(metadata(source), metadata(baseline), 'Datapoint policy changed');
console.log('Production credential bitmap parser, DP58/59/60/93 reports and migration: ALL PASS');
