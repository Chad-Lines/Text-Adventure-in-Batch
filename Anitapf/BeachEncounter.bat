@echo off

echo.
echo Suddenly you hear the crackling of rocks and pebbles. You 
echo turn, and a giant crab looms above you.
echo.
pause

::Resetting the Random Encounter Variables
set attack=0
set rev=0
set attack_var=0

:: Setting the Crab's Health
set crabhealth=100
:: Setting Crab abilities
set /a crab_pinch=%random% * 8 / 32768 + 1
set /a crab_bite=%random% * 7 / 32768 + 2

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
echo The Crab's Health is: %crabhealth%
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
if /I %hit%==Slash set /a crabhealth=%crabhealth% - %slash_dmg%
if /I %hit%==Slash echo.
if /I %hit%==Slash echo You Slash at the Crab for %slash_dmg% damage!
if /I %hit%==Stab if %stab%==1 set /a crabhealth=%crabhealth% - %stab_dmg%
if /I %hit%==Stab if %stab%==1 echo.
if /I %hit%==Stab if %stab%==1 echo You Stab the Crab for %stab_dmg% damage!
if /I %hit%==Stab if %stab%==0 echo.
if /I %hit%==Stab if %stab%==0 echo Your Stab missed!
:: This section tests for invalid input 
:: if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" set spot=Beach1-Fight-Hero
if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" goto UNFOUND
:: Determines if the Crab is dead or not
if /I %crabhealth% LEQ 0 goto MobDead
echo.
echo The Crab's Health is at: %crabhealth%
echo.
pause>nul
if %swordhealth% LEQ 0 goto Sword-Fail
goto Forest-Fight-Crab

:Forest-Fight-Crab
:: Here we're setting a random number between 1-10 which will be used
:: to determine what type of attack the Crab does
set /a crab_spell_num=%random% * 10 / 32768 + 1

:: This resets the damage done by the mob's two spells
:: The crab_pinch spell will do random damage between 1-5
set /a crab_pinch=%random% * 7 / 32768 + 3
:: The crab_bite spell will do random damage between 10-40
set /a crab_bite=%random% * 15 / 32768 + 5

:: This uses the random number to determine which attak the mob will
:: use. Right now it's a 70/30 chance between them
if /I %crab_spell_num% LEQ 7 set crab_attack=%crab_pinch%
if /I %crab_spell_num% GTR 7 set crab_attack=%crab_bite%
if %armor%==1 set /a armorhealth=%armorhealth% - 3

cls
echo.
echo.
echo Your Health is: %health%
echo.
echo The Crab's Health is: %crabhealth%
echo --------------------------------
echo.
if /I %crab_attack%==%crab_pinch% echo The Crab Strikes you for %crab_pinch% damage!
if /I %crab_attack%==%crab_pinch% set /a health=%health% - %crab_pinch%
if /I %crab_attack%==%crab_bite% echo The Crab Charges you for %crab_bite% damage!
if /I %crab_attack%==%crab_bite% set /a health=%health% - %crab_bite%
echo.
if %armor%==1 if %armorhealth% GEQ 1 set /a health=%health% + 3
if /I %health% LEQ 0 goto Dead
if %armor%==1 if %armorhealth% GEQ 1 echo Your Armor blocked 3 damage!
echo Your Health is now: %health%
echo.
pause>nul
if %armor%==1 set /a armorhealth=%armorhealth% - 1
goto Forest-Fight-Hero

:MobDead
set /a lootvar=%random% * 10 / 32798 + 1
if %lootvar% GEQ 3 set crabvar=3
if %lootvar% GEQ 5 set /a flint=%flint% + 1

if %crabvar%==3 set /a crabmeat=%crabmeat% + 3
if %crabvar% NEQ 3 set /a crabmeat=%crabmeat% + 1
echo You have defeated the giant Crab!
echo.
echo You recieve:
echo - %crabvar% Crab meat
if %lootvar% GEQ 5 echo - 1 flint
goto End

:Sword-Fail
echo.
echo Your sword has broken at the hilt. Without a means of
echo protecting yourself, the giant Crab crushes you to death
echo with ease.
echo.
pause
goto Dead

:No-Sword
echo.
echo Without a means of protecting yourself, the giant Crab 
echo crushes you to death with ease.
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