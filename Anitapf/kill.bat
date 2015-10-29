@echo off

if /I %1==soldier if %place%==beach2 goto Kill-Soldier

goto Cant-See

:Kill-Soldier
set soldierdead=1
echo.
echo You have mercilessly killed the soldier
echo.
goto End

:Cant-Kill
echo.
echo You cannot kill that.
echo.
goto End

:Cant-See
echo.
echo That cannot be seen.
echo.
goto End

:End