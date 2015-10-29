@echo off

echo.
echo You bend in close to see what is russling the
echo bush.
echo.
echo Suddenly a beast, in the form of a very large
echo and fur-covered man, jumps out of the weeds
echo and charges you with a ferocious howl!
echo.
pause
set ff1=1

:: Setting the Gorilla's Health
set gorillahealth=100
:: Setting gorilla abilities
set /a gorilla_beat=%random% * 8 / 32768 + 1
set /a gorilla_charge=%random% * 7 / 32768 + 2

:: Setting Hero's Health
set health=%health%
:: Setting Hero's Abilities
set /a slash_dmg=%random% * 10 / 32798 + 1
set /a stab_dmg=%random% * 15 / 32798 + 5

:Forest-Fight-Hero
if %sword%==0 goto No-Sword
:: Setting Hero's Abilities
set /a slash_dmg=%random% * 15 / 32798 + 5
set /a stab_dmg=%random% * 20 / 32798 + 5
:: Setting the chance of landing a stab
set /a stab=0
set /a stab_chance=%random% * 100 /32798 + 1
if /I %stab_chance% LEQ 60 set stab=1
cls
echo.
echo.
echo Your Health is: %health%
echo.
echo The Beast's Health is: %gorillahealth%
echo --------------------------------
echo.
echo What would you like to do?
echo.
echo ATTACK       DAMAGE          CHANCE OF HIT
echo -------------------------------------------
echo SLASH         1-15            100  
echo.
echo STAB          5-20             60
echo.   
set /p hit= : 
:: This section specifies the damage mechanics
if /I %hit%==Slash set /a gorillahealth=%gorillahealth% - %slash_dmg%
if /I %hit%==Slash echo.
if /I %hit%==Slash echo You Slash at the Beast for %slash_dmg% damage!
if /I %hit%==Stab if %stab%==1 set /a gorillahealth=%gorillahealth% - %stab_dmg%
if /I %hit%==Stab if %stab%==1 echo.
if /I %hit%==Stab if %stab%==1 echo You Stab the Beast for %stab_dmg% damage!
if /I %hit%==Stab if %stab%==0 echo.
if /I %hit%==Stab if %stab%==0 echo Your Stab missed!
:: This section tests for invalid input 
:: if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" set spot=Beach1-Fight-Hero
if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" goto UNFOUND
:: Determines if the gorilla is dead or not
if /I %gorillahealth% LEQ 0 echo You have defeated the vile beast
if /I %gorillahealth% LEQ 0 goto End
echo.
echo The Beast's Health is at: %gorillahealth%
echo.
pause>nul
if /I %hit%==Stab if %stab%==1 set /a swordhealth="%swordhealth%" - 3
if /I %hit%==Slash set /a swordhealth="%swordhealth%" - 3
if %swordhealth% LEQ 0 goto Sword-Fail
goto Forest-Fight-Gorilla

:Forest-Fight-Gorilla
:: Here we're setting a random number between 1-10 which will be used
:: to determine what type of attack the gorilla does
set /a gorilla_spell_num=%random% * 10 / 32768 + 1

:: This resets the damage done by the mob's two spells
:: The wolf_slash spell will do random damage between 1-5
set /a gorilla_beat=%random% * 7 / 32768 + 3
:: The wolf_charge spell will do random damage between 10-40
set /a gorilla_charge=%random% * 15 / 32768 + 5

:: This uses the random number to determine which attak the mob will
:: use. Right now it's a 70/30 chance between them
if /I %gorilla_spell_num% LEQ 7 set gorilla_attack=%gorilla_beat%
if /I %gorilla_spell_num% GTR 7 set gorilla_attack=%gorilla_charge%
if %armor%==1 set /a armorhealth=%armorhealth% - 3

cls
echo.
echo.
echo Your Health is: %health%
echo.
echo The Beast's Health is: %gorillahealth%
echo --------------------------------
echo.
if /I %gorilla_attack%==%gorilla_beat% echo The Beast Strikes you for %gorilla_beat% damage!
if /I %gorilla_attack%==%gorilla_beat% set /a health=%health% - %gorilla_beat%
if /I %gorilla_attack%==%gorilla_charge% echo The Beast Charges you for %gorilla_charge% damage!
if /I %gorilla_attack%==%gorilla_charge% set /a health=%health% - %gorilla_charge%
echo.
if %armor%==1 if %armorhealth% GEQ 1 set /a health=%health% + 3
if /I %health% LEQ 0 goto Dead
if %armor%==1 if %armorhealth% GEQ 1 echo Your Armor blocked 3 damage!
echo Your Health is now: %health%
echo.
pause>nul
if %armor%==1 set /a armorhealth=%armorhealth% - 3
goto Forest-Fight-Hero

:Sword-Fail
echo.
echo Your sword has broken at the hilt. Without a means of
echo protecting yourself, the vile beast beats you to death
echo with ease.
echo.
pause
goto Dead

:No-Sword
echo.
echo Without a means of protecting yourself, the vile beast 
echo beats you to death with ease.
echo.
goto Dead

:Dead
echo.
echo You have died. 
echo.
pause
exit

:UNFOUND
echo.
echo.
echo %go% is not valid
echo.
echo.
pause
echo.
goto Forest-Fight-Hero

:End