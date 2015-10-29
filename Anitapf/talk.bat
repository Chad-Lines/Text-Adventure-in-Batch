@echo off

if %place%==beach2 if /I "%1" NEQ "Soldier" echo Who would you like to talk to?
if %place%==beach2 if /I "%1"=="Soldier" goto Soldier
if %place%==beach2 goto End

if %place%==chut if /I %1 NEQ old if /I %1 NEQ man echo Who would you like to talk to?
if %place%==chut if /I %1==man if /I %1==old call oldman.bat
if %place%==chut goto End

echo.
echo There is no one here to talk to 
echo.
goto End

:Soldier
echo.
echo You ask the Soldier where he came from.
echo.
echo "I come from Mileaus," he says, between gasps of
echo pain. "Our ship capsized during the storm...
echo ... I don't know how I wound up here..."
echo.
echo He looks at you earnestly, and then the life fades
echo from his eyes and he lies motionless.
echo.
set soldierdead=1
goto End

:End
