"""Offline final-image checks; does not invoke any target tools."""
import pathlib
import subprocess

root = pathlib.Path(__file__).resolve().parents[1]
project = root / 'studio/tyzs5-telemetry'
image = project / 'build/debug/kagel_tyzs5_srptwvak_clean.out'
symbols = subprocess.check_output(['arm-none-eabi-nm', str(image)], text=True)
names = {line.split()[-1] for line in symbols.splitlines() if line.split()}
for name in ['lock_app_ef00_rx', 'lock_app_zb_rx', 'lock_app_create_temp_pw',
             'bootloader_writeStorage', 'bootloader_eraseStorageSlot',
             'bootloader_setImageToBootload', 'bootloader_rebootAndInstall']:
    assert name not in names, name
    print('PASS absent linked control/write entry:', name)
for name in ['kagel_app_init','kagel_app_tick','USART0_RX_IRQHandler','hal_zb_ef00_report']:
    assert name in names, name
    print('PASS live target entry:', name)
make = (project / 'kagel_tyzs5_srptwvak_clean.project.mak').read_text()
assert '-DKAGEL_TELEMETRY_ONLY=1' in make
assert '../../firmware/lock_app.c' in make
assert '../../firmware/nicki_ek_lock_serial.c' in make
print('PASS generated compiler profile and single frozen source path')
for rel in ['firmware/nicki_ek_lock_serial.c','firmware/nicki_ek_lock_serial.h',
            'firmware/lock_app.c','firmware/lock_app.h']:
    baseline = subprocess.check_output(['git','show','f01156f:'+rel], cwd=root)
    current = (root / rel).read_bytes().replace(b'\r\n',b'\n')
    assert current == baseline.replace(b'\r\n',b'\n'), rel
    print('PASS frozen core unchanged:', rel)
print('PASS all inbound control DPs (21/24/25/48/49/54/55) have no linked forwarding entry')
