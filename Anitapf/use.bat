@echo off

if "%1"=="flint" goto Flint
if "%1"=="hammer" goto Hammer
if "%1"=="the" use 2%

goto Cant-Use

:Flint
if "%flint%" LSS "1" goto Not-Have
set /a flint=%flint%-1
set fire=1
echo.
echo You use the flint to make a small fire.
echo.
goto End

:: Hammer Mechanics ------------------------------------------

:Hammer
if "%hammer%" LSS "1" goto Not-Have
if "%fire%" LSS "1" goto No-Fire
if "%armor%"=="1" goto Fire-Choice
goto Repair-Sword

:Fire-Choice
echo.
echo Are you going to repair your Sword or 
set /p repair=your Armor? 
if /I %repair%==Sword goto Repair-Sword
if /I %repair%==Armor goto Repair-Armor

if /I %repair% NEQ Armor if /I %repair% NEQ Sword goto UnFound

:Repair-Sword
echo.
echo You use the Blacksmith's Hammer to repair
echo your sword!
echo.
set /a swordhealth="%swordhealth%" + 50
if /I "%swordhealth%" GEQ "100" set swordhealth=100
goto End

:Repair-Armor
echo.
echo You use the Blacksmith's Hammer to repair
echo your armor!
echo.
set /a armorhealth="%armorhealth%" + 50
if /I "%armorhealth%" GEQ "100" set armorhealth=100
goto End

:Unfound
echo.
echo %repair% is invalid input.
echo.
pause
goto Fire-Choice

:No-Fire
echo.
echo You need a fire in order to use the Black-
echo smith's hammer!
echo.
goto End

:: ------------------------------------------------------------

:Not-Have
echo.
echo You do not have that item right now
echo.
goto End

:Cant-Use
echo.
echo That item can't be used right now
echo.
goto End

:End
echo.
echo The warmth from the fire revitalizes you.
echo.
echo You have gained 50 health!
echo.
set /a health = %health% + 50 
if %health% GTR 