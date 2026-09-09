"""Validate Stage 1 protocol fixtures with only Python's standard library."""
from __future__ import annotations

import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent
FIXTURES = ROOT / "fixtures"
REQUIRED_CATEGORIES = {
    "wakeup",
    "remote_unlock",
    "normal_password_unlock",
    "card_unlock",
    "temporary_password",
    "dynamic_password",
    "credential_add",
    "credential_delete",
    "status_report",
    "unlock_record",
    "time_sync",
    "malformed",
}


def parse_hex(value: str) -> bytes:
    return bytes.fromhex(value)


def decode_frame(raw: bytes, offset: int = 0):
    frame = raw[offset:]
    if len(frame) < 9:
        return None
    if frame[:2] != b"\x55\xAA":
        return None
    data_len = int.from_bytes(frame[6:8], "big")
    if len(frame) != 9 + data_len:
        return None
    if sum(frame[:-1]) & 0xFF != frame[-1]:
        return None
    return {
        "raw": frame,
        "version": frame[2],
        "seq": int.from_bytes(frame[3:5], "big"),
        "command": frame[5],
        "data_len": data_len,
        "data": frame[8:-1],
        "checksum": frame[-1],
    }


def decode_dp(data: bytes, offset: int = 0):
    if len(data) - offset < 4:
        return None
    dp_id, dp_type = data[offset], data[offset + 1]
    value_len = int.from_bytes(data[offset + 2:offset + 4], "big")
    end = offset + 4 + value_len
    if end != len(data):
        return None
    return {
        "id": dp_id,
        "type": dp_type,
        "length": value_len,
        "value": data[offset + 4:end],
    }


def check_fixture(path: Path):
    item = json.loads(path.read_text(encoding="utf-8"))
    raw_hex = item.get("raw_hex")
    expected = item.get("expected", {})
    if raw_hex is None:
        if expected.get("status") != "NEEDS_HARDWARE_CAPTURE":
            return False, "missing raw_hex is not marked NEEDS_HARDWARE_CAPTURE"
        return None, "needs hardware capture"

    raw = parse_hex(raw_hex)
    offset = int(expected.get("frame_offset", 0))
    actual = decode_frame(raw, offset)
    should_be_valid = bool(expected.get("valid_frame", True))
    if (actual is not None) != should_be_valid:
        return False, f"valid={actual is not None}, expected={should_be_valid}"
    if actual is None:
        if "expected_checksum" in expected:
            frame = raw[offset:]
            if len(frame) < 1 or sum(frame[:-1]) & 0xFF != expected["expected_checksum"]:
                return False, "unexpected recomputed checksum"
        return True, "malformed frame rejected"

    for key in ("version", "seq", "command", "data_len", "checksum"):
        if key in expected and actual[key] != expected[key]:
            return False, f"{key}={actual[key]!r}, expected={expected[key]!r}"

    dp_expectation = expected.get("dp")
    if dp_expectation is not None:
        dp = decode_dp(actual["data"], int(dp_expectation.get("offset", 0)))
        if dp is None:
            return False, "DP unit is incomplete or has trailing bytes"
        for key in ("id", "type", "length"):
            if key in dp_expectation and dp[key] != dp_expectation[key]:
                return False, f"DP {key}={dp[key]!r}, expected={dp_expectation[key]!r}"
    return True, "valid frame"


def main() -> int:
    missing = sorted(name for name in REQUIRED_CATEGORIES
                     if not (FIXTURES / name).is_dir())
    if missing:
        print("FAIL: missing fixture categories: " + ", ".join(missing))
        return 1

    passed = failed = skipped = 0
    for path in sorted(FIXTURES.glob("**/*.json")):
        try:
            result, detail = check_fixture(path)
        except Exception as exc:  # fixture errors should be visible by filename
            result, detail = False, f"exception: {exc}"
        if result is True:
            passed += 1
            print(f"PASS {path.relative_to(ROOT)}: {detail}")
        elif result is None:
            skipped += 1
            print(f"SKIP {path.relative_to(ROOT)}: {detail}")
        else:
            failed += 1
            print(f"FAIL {path.relative_to(ROOT)}: {detail}")

    print(f"\nFIXTURES: {passed} passed, {failed} failed, {skipped} awaiting hardware")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
