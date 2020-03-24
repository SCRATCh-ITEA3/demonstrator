@echo off
:loop

cls

echo === NXP automatic SCRATCh deployment  ===
date /T
echo =========================================
echo.
docker run scratchitea3/demonstrator
echo.
echo.
echo.

docker pull scratchitea3/demonstrator
ping -n 5 127.0.0.1 > NUL

goto loop
