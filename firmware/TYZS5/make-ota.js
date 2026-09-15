#!/usr/bin/env node
// Wrap a Gecko GBL into a Zigbee OTA Upgrade file (.ota) that z2m serves.
// Usage: node make-ota.js <input.gbl> <output.ota> <fileVersionHex> [mfgCode] [imageType]
//   e.g. node make-ota.js kagel-lock.gbl kagel-lock.ota 0x01000001
// Must match the firmware OTA client: OTA_MFG_CODE 0x1002, OTA_IMAGE_TYPE 0x0001,
// and fileVersion strictly HIGHER than the running KAGEL_FW_VERSION_U32 or z2m won't offer it.
'use strict';
const fs = require('fs');

const [, , inGbl, outOta, verArg, mfgArg, typeArg] = process.argv;
if (!inGbl || !outOta || !verArg) {
  console.error('usage: node make-ota.js <in.gbl> <out.ota> <fileVersionHex> [mfgCode=0x1002] [imageType=0x0001]');
  process.exit(1);
}
const fileVersion = Number(verArg);
const mfgCode = mfgArg ? Number(mfgArg) : 0x1002;
const imageType = typeArg ? Number(typeArg) : 0x0001;

const gbl = fs.readFileSync(inGbl);

// ---- OTA header (no optional fields => field control 0) ----
const headerString = Buffer.alloc(32);           // 32-byte ASCII, zero-padded
headerString.write('Smart Home Plus Lock', 'ascii');
const HEADER_LEN = 4 + 2 + 2 + 2 + 2 + 2 + 4 + 2 + 32 + 4;   // = 56
const subElemLen = 2 + 4 + gbl.length;           // tagID + length + data
const totalSize = HEADER_LEN + subElemLen;

const h = Buffer.alloc(HEADER_LEN);
let o = 0;
h.writeUInt32LE(0x0BEEF11E, o); o += 4;          // OTA file identifier
h.writeUInt16LE(0x0100, o);     o += 2;          // header version
h.writeUInt16LE(HEADER_LEN, o); o += 2;          // header length
h.writeUInt16LE(0x0000, o);     o += 2;          // field control (no optional fields)
h.writeUInt16LE(mfgCode, o);    o += 2;          // manufacturer code
h.writeUInt16LE(imageType, o);  o += 2;          // image type
h.writeUInt32LE(fileVersion >>> 0, o); o += 4;   // file version
h.writeUInt16LE(0x0002, o);     o += 2;          // zigbee stack version (2 = Pro)
headerString.copy(h, o);        o += 32;         // header string
h.writeUInt32LE(totalSize, o);  o += 4;          // total image size

// ---- upgrade-image sub-element ----
const se = Buffer.alloc(6);
se.writeUInt16LE(0x0000, 0);                     // tag id 0x0000 = upgrade image
se.writeUInt32LE(gbl.length, 2);                 // length

const ota = Buffer.concat([h, se, gbl]);
fs.writeFileSync(outOta, ota);

console.log(`wrote ${outOta}: ${ota.length} bytes`);
console.log(`  mfgCode=0x${mfgCode.toString(16)} imageType=0x${imageType.toString(16)} fileVersion=0x${(fileVersion>>>0).toString(16).padStart(8,'0')}`);
console.log(`  gbl=${gbl.length} B, header=${HEADER_LEN} B, total=${totalSize} B`);
// z2m override-index entry:
console.log('\nz2m index.json entry:');
console.log(JSON.stringify([{ fileVersion: fileVersion >>> 0, fileSize: ota.length, manufacturerCode: mfgCode, imageType, sha512: null, url: `file://${require('path').resolve(outOta)}` }], null, 1));
