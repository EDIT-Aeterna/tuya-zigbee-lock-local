"""Run the unchanged reviewer test beside byte-exact canonical copies."""
from pathlib import Path
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]
with tempfile.TemporaryDirectory(prefix='tzll-monitor-review-') as temporary:
    dest = Path(temporary)
    for module in ('TYZS3', 'TYZS5'):
        src = root / 'zigbee2mqtt' / module / ('tuya_ty0a01_' + module.lower() + '_monitor.js')
        shutil.copyfile(src, dest / src.name)
        subprocess.run(['node', '--check', str(src)], check=True)
    test = root / 'tests/reviewer-monitor/test_monitor_converters.js'
    shutil.copyfile(test, dest / test.name)
    subprocess.run(['node', str(dest / test.name)], check=True)
subprocess.run(['node', str(root / 'tests/monitor_passive_release_test.js')], check=True)
