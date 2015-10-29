@echo off

if %1==letter type MillsDaughter.txt
if %1==letter goto End

echo.
echo You can't read that.
echo.

:End