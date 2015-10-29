@echo off

:: Non-Food Items
if /I "%1"=="sword" goto NoEat
if /I "%1"=="armor" goto NoEat
if /I "%1"=="flint" goto NoEat

:: Actual Food Items
if /I "%1"=="crab" if "%crabmeat%" GEQ "1" goto Crab
if /I "%1"=="bread" if "%bread%" GEQ "1" goto Bread
if /I "%1"=="meat" if "%driedmeat%" GEQ "1" goto Dried-Meat
if /I "%1"=="the" eat %2

echo.
echo You cannot eat %1.
echo.
goto End

:Crab
echo.
set /a crabmeat=%crabmeat% - 1
echo You eat the crab.
echo Your health increased by 25!
echo.
set /a health=%health% + 25
if %health% GTR 150 set health=150
goto End

:Bread
echo.
set /a bread=%bread% - 1
echo You've eaten some bread,
echo Your health increased by 15!
echo.
set /a health=%health% + 15
if %health% GTR 150 set health=150
goto End 

:Dried-Meat
echo.
set /a driedmeat=%driedmeat% - 1
echo You eat the dried meat.
echo Your health increased by 35!
echo.
set /a health=%health% + 35
if %health% GTR 150 set health=150
goto End 


:NoEat
echo.
echo You cannot eat that...
echo.
goto End

:End