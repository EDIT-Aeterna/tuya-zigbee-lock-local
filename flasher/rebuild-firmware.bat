@echo off
set "GCCBIN=C:\SiliconLabs\SimplicityStudio\v5\developer\toolchains\gnu_arm\12.2.rel1_2023.7\bin"
set "MAKEBIN=C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin"
set "PATH=%GCCBIN%;%MAKEBIN%;%PATH%"
cd /d "C:\Users\Main\SimplicityStudio\v5_workspace\kagel-lock\GNU ARM v12.2.1 - Default"
echo ==== which gcc / make ====
where arm-none-eabi-gcc
where make
echo ==== building ====
make -j4 all
echo ==== EXITCODE %ERRORLEVEL% ====
