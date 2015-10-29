@echo off

if %1==crab call crabfight.bat
if %1==crab goto End

if %1==boar call boarfight.bat
if %1==boar goto End

if %1==bat call batfight.bat
if %1==bat goto End

if %1==howler call howlerfight.bat
if %1==howler goto End

if %1==millipede call millipedefight.bat
if %1==millipede goto End

echo.
echo You cannot fight that
echo.
goto End

:End