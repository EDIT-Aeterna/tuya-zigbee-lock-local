"""Four-way host access tests, including edition-independent internal wire traces."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]


def compiler():
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


p = argparse.ArgumentParser()
p.add_argument("--output", default="artifacts/t3-4a/access-tests")
a = p.parse_args()
out = root / a.output
out.mkdir(parents=True, exist_ok=True)

env = os.environ.copy()
env["PYTHONUTF8"] = "1"
gcc = compiler()
results = {}

with tempfile.TemporaryDirectory(prefix="tzll-access-") as temp:
    for module, selector in [("TYZS5", 1), ("TYZS3", 2)]:
        traces = []
        for edition, mode in [("CONTROL", 0), ("MONITOR", 1)]:
            name = module + "-" + edition
            exe = Path(temp) / (name + (".exe" if os.name == "nt" else ""))
            cmd = [
                gcc, "-std=c99", "-Wall", "-Wextra", "-Werror",
                str(root / "tests/access_edition_test.c"),
                *map(str, (root / "firmware/common").glob("*.c")),
                "-I" + str(root / "firmware/common"),
                "-I" + str(root / "firmware/TYZS5"),
                "-DKAGEL_TELEMETRY_ONLY=1",
                "-DKAGEL_PROFILE=" + str(selector),
                "-DTZLL_ACCESS_EDITION=" + str(mode),
                "-o", str(exe),
            ]
            if module == "TYZS3":
                cmd += ["-DLOCK_PROFILE_UJCJK46O=1"]
            build = subprocess.run(cmd, env=env, capture_output=True, text=True, errors="replace")
            if build.returncode:
                raise RuntimeError(build.stderr)
            run = subprocess.run([str(exe)], env=env, capture_output=True, text=True, errors="replace")
            (out / (name + ".log")).write_text(run.stdout + run.stderr, encoding="utf-8")
            assert run.returncode == 0, run.stdout + run.stderr
            traces.append(next(line for line in run.stdout.splitlines() if line.startswith("INTERNAL")))
            results[name] = "PASS"
            print(name, run.stdout, flush=True)
        assert traces[0] == traces[1], "Monitor altered internal protocol traffic"

(out / "results.json").write_text(json.dumps(results, indent=2) + "\n", encoding="utf-8")
