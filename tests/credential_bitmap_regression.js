'use strict';

// Standalone regression reference for TZLL credential bitmap decoding.
// This mirrors the intended pure parser semantics for converter v1.2.2.

function parseShardBitmapIds(hex) {
    const x = String(hex).trim().replace(/^0x/i, '').replace(/\s+/g, '');
    if (!x) return {ids: []};
    if (!/^[0-9a-fA-F]+$/.test(x) || (x.length % 2) !== 0) {
        return {error: 'invalid hex/odd length', ids: []};
    }

    const b = Buffer.from(x, 'hex');
    if ((b.length % 2) !== 0) {
        return {error: 'odd byte length', ids: []};
    }
    const ids = new Set();

    for (let i = 0; i < b.length; i += 2) {
        const fragment = b[i];
        const mask = b[i + 1];

        if (fragment === 0) {
            return {error: 'fragment 0', ids: []};
        }

        for (let bit = 0; bit < 8; bit++) {
            if (mask & (1 << bit)) {
                ids.add((fragment - 1) * 8 + bit);
            }
        }
    }

    return {ids: [...ids].sort((a, b) => a - b)};
}

const valid = [
    ['', []],
    ['010a0302', [1, 3, 17]],
    ['0104026c', [2, 10, 11, 13, 14]],
    ['01010280', [0, 15]],
    ['02100301', [12, 16]],
    ['0240', [14]],
];

for (const [hex, expected] of valid) {
    const got = parseShardBitmapIds(hex);
    if (got.error || JSON.stringify(got.ids) !== JSON.stringify(expected)) {
        throw new Error(`${hex}: got ${JSON.stringify(got)}, expected ${JSON.stringify(expected)}`);
    }
}

for (const hex of ['01', '0001', 'zz']) {
    const got = parseShardBitmapIds(hex);
    if (!got.error) throw new Error(`${hex}: expected error, got ${JSON.stringify(got)}`);
}

console.log('credential bitmap regression vectors: PASS');
