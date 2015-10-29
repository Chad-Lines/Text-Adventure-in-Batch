@echo off
echo.
echo Your health is %health%
echo.
echo Item Health:
if %sword%==1 echo  Sword health is %swordhealth%
if %armor%==1 echo  Armor health is %armorhealth%
echo.
goto End

:End