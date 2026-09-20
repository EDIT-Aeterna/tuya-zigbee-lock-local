"""Run the current TZLL host/converter CI gate on Windows or Linux.

Historical superseded reviewer tests are intentionally excluded here; see
tests/historical/README.md. The older run_t3_host_tests.py remains available
for release archaeology and baseline reproduction.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]

CURRENT_C_TESTS = {
    "stage11_lock_app_time_integration_test.c": ("srptwvak",),
    "stage2br_adapter_test.c": ("srptwvak",),
    "stage2dr_ef00_integration_test.c": ("srptwvak",),
    "stage2fr_ef00_integration_test.c": ("srptwvak",),
    "stage2g_ef00_credential_integration_test.c": ("srptwvak",),
    "stage2g_legacy_control_gate_test.c": ("srptwvak",),
    "t3_common_core_test.c": ("srptwvak", "ujcjk46o"),
    "platform_characterization_test.c": ("srptwvak", "ujcjk46o"),
    "platform_binding_test.c": ("srptwvak", "ujcjk46o"),
}
HISTORICAL_C_TESTS = {
    "stage2dr_control_gate_test.c",
    "stage2ea_ef00_integration_test.c",
    "stage2eb_ef00_integration_test.c",
    "stage2f_ef00_integration_test.c",
}


def compiler() -> str:
    env_cc = os.environ.get("CC")
    candidates = [
        env_cc,
        r"C:\msys64\ucrt64\bin\gcc.exe",
        shutil.which("gcc"),
        shutil.which("cc"),
    ]
    for candidate in candidates:
        if candidate and (Path(candidate).exists() or shutil.which(candidate)):
            return str(candidate)
    raise RuntimeError("No C compiler found. Install GCC or set CC.")


def run_logged(name: str, cmd: list[str], out: Path, env: dict[str, str]) -> None:
    result = subprocess.run(cmd, cwd=ROOT, env=env, capture_output=True, text=True, errors="replace")
    (out / f"{name}.log").write_text(result.stdout + result.stderr, encoding="utf-8")
    if result.returncode:
        raise RuntimeError(f"{name} failed with exit {result.returncode}; see {out / (name + '.log')}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", default="artifacts/current-ci")
    args = parser.parse_args()

    out = ROOT / args.output
    out.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    env["PYTHONUTF8"] = "1"
    cc = compiler()
    common = sorted((ROOT / "firmware/common").glob("*.c"))
    results: dict[str, str] = {}

    unexpected = {p.name for p in (ROOT / "tests").glob("stage*.c")} - set(CURRENT_C_TESTS) - HISTORICAL_C_TESTS
    if unexpected:
        raise RuntimeError("Unclassified stage tests: " + ", ".join(sorted(unexpected)))

    with tempfile.TemporaryDirectory(prefix="tzll-current-ci-") as temporary:
        temp = Path(temporary)
        for filename, profiles in CURRENT_C_TESTS.items():
            test = ROOT / "tests" / filename
            for profile in profiles:
                name = f"{test.stem}-{profile}"
                exe = temp / (name + (".exe" if os.name == "nt" else ""))
                cmd = [
                    cc, "-std=c99", "-Wall", "-Wextra", "-Werror",
                    str(test), *map(str, common),
                    "-I", str(ROOT / "firmware/common"),
                    "-I", str(ROOT / "firmware/TYZS5"),
                    "-o", str(exe),
                ]
                if profile == "ujcjk46o":
                    cmd.append("-DLOCK_PROFILE_UJCJK46O=1")
                build = subprocess.run(cmd, cwd=ROOT, env=env, capture_output=True, text=True, errors="replace")
                if build.returncode:
                    (out / f"{name}.log").write_text(build.stdout + build.stderr, encoding="utf-8")
                    raise RuntimeError(f"{name} compile failed")
                run = subprocess.run([str(exe)], cwd=ROOT, env=env, capture_output=True, text=True, errors="replace")
                (out / f"{name}.log").write_text(build.stdout + build.stderr + run.stdout + run.stderr, encoding="utf-8")
                if run.returncode:
                    raise RuntimeError(f"{name} failed")
                results[name] = "PASS"

        host = ROOT / "firmware/TYZS5/host_selftest.c"
        exe = temp / ("host_selftest" + (".exe" if os.name == "nt" else ""))
        cmd = [
            cc, "-std=c99", "-Wall", "-Wextra", "-Werror",
            str(host), *map(str, common),
            "-I", str(ROOT / "firmware/common"),
            "-I", str(ROOT / "firmware/TYZS5"),
            "-o", str(exe),
        ]
        build = subprocess.run(cmd, cwd=ROOT, env=env, capture_output=True, text=True, errors="replace")
        if build.returncode:
            raise RuntimeError(build.stderr)
        run = subprocess.run([str(exe)], cwd=ROOT, env=env, capture_output=True, text=True, errors="replace")
        (out / "host_selftest.log").write_text(build.stdout + build.stderr + run.stdout + run.stderr, encoding="utf-8")
        if run.returncode:
            raise RuntimeError("host_selftest failed")
        results["host_selftest"] = "PASS"

    commands = [
        ("fixtures", [sys.executable, "tests/run_fixtures.py"]),
        ("credential_bitmap", ["node", "tests/credential_bitmap_test.js"]),
        ("credential_bitmap_reference", ["node", "tests/credential_bitmap_regression.js"]),
        ("tyzs3_converter", ["node", "tests/tyzs3_converter_test.js"]),
        ("access_editions", [sys.executable, "tools/test_access_editions.py", "--output", str((out / "access").relative_to(ROOT))]),
        ("monitor_release", [sys.executable, "tools/test_monitor_release.py"]),
        ("tyzs5_control_syntax", ["node", "--check", "zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5.js"]),
        ("tyzs5_monitor_syntax", ["node", "--check", "zigbee2mqtt/TYZS5/tuya_ty0a01_tyzs5_monitor.js"]),
        ("tyzs3_control_syntax", ["node", "--check", "zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3.js"]),
        ("tyzs3_monitor_syntax", ["node", "--check", "zigbee2mqtt/TYZS3/tuya_ty0a01_tyzs3_monitor.js"]),
    ]
    for name, cmd in commands:
        run_logged(name, cmd, out, env)
        results[name] = "PASS"

    (out / "results.json").write_text(json.dumps(results, indent=2) + "\n", encoding="utf-8")
    print(f"CURRENT CI: {len(results)} checks PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
