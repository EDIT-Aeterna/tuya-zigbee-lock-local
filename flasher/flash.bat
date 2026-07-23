@echo off
REM Command-line flash of the TYZS3 lock module: chip-erase + program + verify + reset.
REM Same result as the GUI. Wire + power the module first (see ../docs/HARDWARE.md).
setlocal
set TGT=efr32mg13p732f512gm48
set "PY=py"
cd /d "%~dp0"

echo ==== connect check (current vector table) ====
%PY% -m pyocd cmd -t %TGT% -f 1000000 -c "halt" -c "read32 0x0 0x8"
if errorlevel 1 (echo Could not reach the chip -- check wiring/power, NOT flashing. & exit /b 1)

echo.
echo ==== flashing kagel-lock.hex ====
%PY% -m pyocd flash -t %TGT% -f 1000000 --erase chip kagel-lock.hex
if errorlevel 1 (echo Flash failed. & exit /b 2)

echo.
echo ==== reset + verify ====
%PY% -m pyocd cmd -t %TGT% -f 1000000 -c "reset halt" -c "read32 0x0 0x8"
echo ==== done ====
