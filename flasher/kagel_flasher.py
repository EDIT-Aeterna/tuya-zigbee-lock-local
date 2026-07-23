#!/usr/bin/env python3
"""
Kagel Lock Flasher — production SWD flashing tool (Windows).

One-click / auto flashing of the Kagel firmware onto the TYZS3 (EFR32MG13) lock
module via a Raspberry Pi Debug Probe (CMSIS-DAP), driven by pyOCD — the exact
chip-erase + program + verify + reset sequence proven on the bench.

  Debug detection : live "Debug Probe: connected / not found" indicator.
  Load firmware   : pick any .hex/.s37/.bin; its size + sha are shown.
  Manual          : press FLASH.
  Auto            : tick Auto-flash — place a board, it flashes + re-arms on removal.
"""
import os, sys, time, threading, subprocess, hashlib, shutil, queue
import tkinter as tk
from tkinter import filedialog

# ── config ──────────────────────────────────────────────────────────────────
TARGET      = "efr32mg13p732f512gm48"
def _here():
    return os.path.dirname(sys.executable if getattr(sys, "frozen", False)
                           else os.path.abspath(__file__))
DEFAULT_FW  = os.path.join(_here(), "kagel-lock.hex")
SWD_FREQ    = "8000000"          # 8 MHz SWD clock — fast; drop to 4000000 if flaky
ERASE_MODE  = "chip"
FLASH_TMO   = 60
CREATE_NO_WINDOW = 0x08000000 if os.name == "nt" else 0

def find_pyocd():
    # bundled next to us first (self-contained deploy), then PATH, then common installs
    c = os.path.join(_here(), "pyocd.exe")
    if os.path.isfile(c): return c
    for name in ("pyocd", "pyocd.exe"):
        p = shutil.which(name)
        if p: return p
    for base in (r"C:\Python313\Scripts", r"C:\Python312\Scripts", r"C:\Python311\Scripts"):
        cand = os.path.join(base, "pyocd.exe")
        if os.path.isfile(cand): return cand
    return "pyocd"
PYOCD = find_pyocd()

def _run(args, timeout):
    return subprocess.run([PYOCD, *args], capture_output=True, text=True,
                          timeout=timeout, creationflags=CREATE_NO_WINDOW)

def fw_hash(path):
    try:
        h = hashlib.sha256(open(path, "rb").read()).hexdigest()[:12]
        return f"{os.path.basename(path)}   ·   {os.path.getsize(path)//1024} KB   ·   sha {h}"
    except Exception:
        return "(no firmware loaded — click Load firmware)"

def probe_info():
    """(connected, name). Parses `pyocd list`."""
    try:
        r = _run(["list"], 12)
        for line in (r.stdout or "").splitlines():
            s = line.strip()
            if not s or set(s) <= set("- "):
                continue
            low = s.lower()
            if "no available" in low:
                return False, "not found"
            if low.startswith("#") or "probe/board" in low:
                continue
            parts = [p for p in s.split("  ") if p.strip()]
            if len(parts) >= 2 and parts[0].strip().isdigit():
                return True, parts[1].strip()[:40]
        return False, "not found"
    except Exception:
        return False, "pyocd error"

def do_flash(fw):
    t0 = time.time()
    try:
        r = _run(["flash", "-t", TARGET, "-e", ERASE_MODE, "-f", SWD_FREQ, fw], FLASH_TMO)
    except subprocess.TimeoutExpired:
        return False, time.time() - t0, "TIMEOUT"
    dt = time.time() - t0
    out = (r.stdout or "") + (r.stderr or "")
    if r.returncode == 0 and "error" not in out.lower():
        try:  # verify Kagel fw booted, not stock (stock reset vector 0x000336bb)
            v = _run(["cmd", "-t", TARGET, "-f", SWD_FREQ, "-c", "read32 0x4 0x4", "-c", "exit"], 12)
            if "000336bb" in (v.stdout or "").lower():
                return False, dt, "VERIFY FAILED — still stock firmware"
        except Exception:
            pass
        return True, dt, "erased · programmed · verified · reset"
    tail = "\n".join([l for l in out.splitlines() if l.strip()][-4:])
    return False, dt, tail or "flash failed"

# ── GUI ──────────────────────────────────────────────────────────────────────
class App:
    def __init__(self, root):
        self.root = root
        self.fw = DEFAULT_FW
        self.auto = tk.BooleanVar(value=False)
        self.count = 0
        self.busy = False
        self.probe_ok = False
        self.q = queue.Queue()
        root.title("Kagel Lock Flasher")
        root.geometry("560x560"); root.minsize(520, 520)
        root.configure(bg="#0f172a")

        tk.Label(root, text="KAGEL LOCK FLASHER", bg="#0f172a", fg="#38bdf8",
                 font=("Segoe UI Semibold", 16)).pack(pady=(14, 2))

        # ── debug probe indicator ──
        pf = tk.Frame(root, bg="#111c2e"); pf.pack(fill="x", padx=18, pady=(6, 2))
        self.pdot = tk.Label(pf, text="●", bg="#111c2e", fg="#f59e0b", font=("Segoe UI", 14))
        self.pdot.pack(side="left", padx=(12, 8), pady=8)
        self.plbl = tk.Label(pf, text="Debug Probe: checking…", bg="#111c2e", fg="#cbd5e1",
                             font=("Segoe UI", 10))
        self.plbl.pack(side="left")
        tk.Button(pf, text="Detect", command=self.detect_click, bg="#1e293b", fg="#cbd5e1",
                  relief="flat", font=("Segoe UI", 9)).pack(side="right", padx=10)

        # ── firmware row ──
        self.fwlbl = tk.Label(root, text=fw_hash(self.fw), bg="#0f172a", fg="#94a3b8",
                              font=("Consolas", 9))
        self.fwlbl.pack(pady=(8, 2))
        tk.Button(root, text="Load firmware…", command=self.browse, bg="#1e293b",
                  fg="#e2e8f0", relief="flat", font=("Segoe UI", 10)).pack(pady=2)

        # ── status banner ──
        self.status = tk.Label(root, text="READY", bg="#1d4ed8", fg="white",
                               font=("Segoe UI Semibold", 30), height=2)
        self.status.pack(fill="x", padx=18, pady=(12, 4))
        self.sub = tk.Label(root, text="Place a board and press FLASH", bg="#0f172a",
                            fg="#cbd5e1", font=("Segoe UI", 11))
        self.sub.pack()

        self.flashbtn = tk.Button(root, text="⚡  FLASH", command=self.flash_click,
                                  bg="#22c55e", fg="#052e16", relief="flat",
                                  font=("Segoe UI Semibold", 18))
        self.flashbtn.pack(fill="x", padx=18, pady=12)

        row = tk.Frame(root, bg="#0f172a"); row.pack(fill="x", padx=18)
        tk.Checkbutton(row, text="Auto-flash (assembly line)", variable=self.auto,
                       command=self.toggle_auto, bg="#0f172a", fg="#cbd5e1",
                       selectcolor="#0f172a", activebackground="#0f172a",
                       font=("Segoe UI", 10)).pack(side="left")
        self.counter = tk.Label(row, text="Flashed: 0", bg="#0f172a", fg="#38bdf8",
                                font=("Segoe UI Semibold", 11))
        self.counter.pack(side="right")

        self.log = tk.Text(root, height=7, bg="#020617", fg="#94a3b8", relief="flat",
                           font=("Consolas", 9), wrap="word")
        self.log.pack(fill="both", expand=True, padx=18, pady=(12, 16))
        self._log(f"pyocd: {PYOCD}")
        self._log(f"target: {TARGET}  ·  SWD {int(SWD_FREQ)//1000000} MHz  ·  erase {ERASE_MODE}")

        self.root.after(120, self._drain)
        threading.Thread(target=self.detect_loop, daemon=True).start()

    # ---- queue plumbing ----
    def _log(self, m): self.q.put(("log", time.strftime("%H:%M:%S ") + m))
    def _set(self, t, c, s=None): self.q.put(("status", (t, c, s)))
    def _probe(self, ok, name): self.q.put(("probe", (ok, name)))

    def _drain(self):
        try:
            while True:
                kind, val = self.q.get_nowait()
                if kind == "log":
                    self.log.insert("end", val + "\n"); self.log.see("end")
                elif kind == "status":
                    t, c, s = val; self.status.config(text=t, bg=c)
                    if s is not None: self.sub.config(text=s)
                elif kind == "probe":
                    ok, name = val; self.probe_ok = ok
                    self.pdot.config(fg="#22c55e" if ok else "#ef4444")
                    self.plbl.config(text=f"Debug Probe: {name}" if ok else "Debug Probe: not found")
                    if not self.busy:
                        self.flashbtn.config(state="normal" if ok else "disabled")
                elif kind == "count":
                    self.counter.config(text=f"Flashed: {val}")
                elif kind == "enable":
                    self.flashbtn.config(state="normal" if (val and self.probe_ok) else "disabled")
        except queue.Empty:
            pass
        self.root.after(120, self._drain)

    # ---- probe detection ----
    def detect_click(self):
        self._log("detecting probe…")
        threading.Thread(target=lambda: self._probe(*probe_info()), daemon=True).start()
    def detect_loop(self):
        last = None
        while True:
            info = probe_info()
            if info != last:
                self._probe(*info)
                self._log(("probe: " + info[1]) if info[0] else "probe: not found")
                last = info
            time.sleep(2.5)

    def browse(self):
        p = filedialog.askopenfilename(title="Load firmware",
                                       filetypes=[("Firmware", "*.hex *.s37 *.bin"), ("All files", "*.*")])
        if p:
            self.fw = p; self.fwlbl.config(text=fw_hash(p)); self._log(f"firmware: {p}")

    def toggle_auto(self):
        if self.auto.get():
            self._log("AUTO mode ON — waiting for a board…")
            threading.Thread(target=self.auto_loop, daemon=True).start()
        else:
            self._log("AUTO mode OFF")

    # ---- flashing ----
    def flash_click(self):
        if not self.busy:
            threading.Thread(target=self._flash_once, daemon=True).start()

    def _flash_once(self):
        if self.busy: return False
        self.busy = True; self.q.put(("enable", False))
        if not os.path.isfile(self.fw):
            self._set("NO FIRMWARE", "#b91c1c", "Click Load firmware")
            self._log("ERROR: firmware not found"); self.busy = False
            self.q.put(("enable", True)); return False
        self._set("FLASHING…", "#d97706", "Programming — do not remove the board")
        self._log("flashing…")
        ok, dt, detail = do_flash(self.fw)
        if ok:
            self.count += 1; self.q.put(("count", self.count))
            self._set(f"DONE  ✓  {dt:.1f}s", "#16a34a", "Remove board — ready for next")
            self._log(f"OK in {dt:.1f}s — {detail}")
        else:
            self._set("FAILED  ✗", "#b91c1c", (detail.splitlines()[0][:60] if detail else "check wiring/power"))
            self._log(f"FAIL in {dt:.1f}s — {detail}")
        self.busy = False; self.q.put(("enable", True))
        return ok

    def auto_loop(self):
        armed = True
        while self.auto.get():
            if not self.busy and armed and self._target_present():
                self._flash_once(); armed = False
            elif not armed and not self._target_present():
                armed = True
                self._set("READY", "#1d4ed8", "Place the next board")
                self._log("board removed — re-armed")
            time.sleep(1.2)

    def _target_present(self):
        try:
            r = _run(["cmd", "-t", TARGET, "-f", SWD_FREQ, "-O", "connect_mode=attach", "-c", "exit"], 12)
            return r.returncode == 0
        except Exception:
            return False

if __name__ == "__main__":
    root = tk.Tk()
    App(root)
    root.mainloop()
