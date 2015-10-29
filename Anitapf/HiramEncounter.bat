@echo off

echo.
echo Suddenly you hear a shuffling noise and turn to see 
echo rancid zombie shambling towards you
echo.
pause

::Resetting the Random Encounter Variables
set attack=0
set rev=0
set attack_var=0

:: Setting the zombie's Health
set zombiehealth=100
:: Setting zombie abilities
set /a zombie_scratch=%random% * 8 / 32768 + 1
set /a zombie_bite=%random% * 7 / 32768 + 2

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
echo The Zombie's Health is: %zombiehealth%
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
if /I %hit%==Slash set /a zombiehealth=%zombiehealth% - %slash_dmg%
if /I %hit%==Slash echo.
if /I %hit%==Slash echo You Slash at the zombie for %slash_dmg% damage!
if /I %hit%==Stab if %stab%==1 set /a zombiehealth=%zombiehealth% - %stab_dmg%
if /I %hit%==Stab if %stab%==1 echo.
if /I %hit%==Stab if %stab%==1 echo You Stab the zombie for %stab_dmg% damage!
if /I %hit%==Stab if %stab%==0 echo.
if /I %hit%==Stab if %stab%==0 echo Your Stab missed!
:: This section tests for invalid input 
:: if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" set spot=Beach1-Fight-Hero
if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" goto UNFOUND
:: Determines if the zombie is dead or not
if /I %zombiehealth% LEQ 0 goto MobDead
echo.
echo The zombie's Health is at: %zombiehealth%
echo.
pause>nul
if /I %hit%==Stab if %stab%==1 set /a swordhealth="%swordhealth%" - 3
if /I %hit%==Slash set /a swordhealth="%swordhealth%" - 3
if %swordhealth% LEQ 0 goto Sword-Fail
goto Forest-Fight-zombie

:Forest-Fight-zombie
:: Here we're setting a random number between 1-10 which will be used
:: to determine what type of attack the zombie does
set /a zombie_spell_num=%random% * 10 / 32768 + 1

:: This resets the damage done by the mob's two spells
:: The zombie_scratch spell will do random damage between 1-5
set /a zombie_scratch=%random% * 7 / 32768 + 3
:: The zombie_bite spell will do random damage between 10-40
set /a zombie_bite=%random% * 15 / 32768 + 5

:: This uses the random number to determine which attak the mob will
:: use. Right now it's a 70/30 chance between them
if /I %zombie_spell_num% LEQ 7 set crab_attack=%zombie_scratch%
if /I %zombie_spell_num% GTR 7 set crab_attack=%zombie_bite%
if %armor%==1 set /a armorhealth=%armorhealth% - 3

cls
echo.
echo.
echo Your Health is: %health%
echo.
echo The Zombie's Health is: %zombiehealth%
echo --------------------------------
echo.
if /I %crab_attack%==%zombie_scratch% echo The Zombie scratches you for %zombie_scratch% damage!
if /I %crab_attack%==%zombie_scratch% set /a health=%health% - %zombie_scratch%
if /I %crab_attack%==%zombie_bite% echo The Zombie bites you for %zombie_bite% damage!
if /I %crab_attack%==%zombie_bite% set /a health=%health% - %zombie_bite%
echo.
if %armor%==1 if %armorhealth% GEQ 1 set /a health=%health% + 3
if /I %health% LEQ 0 goto Dead
if %armor%==1 if %armorhealth% GEQ 1 echo Your Armor blocked 3 damage!
echo Your Health is now: %health%
echo.
pause>nul
if %armor%==1 set /a armorhealth=%armorhealth% - 3
goto Forest-Fight-Hero

:MobDead
set /a lootvar=%random% * 10 / 32798 + 1
if %lootvar% GEQ 3 set meatvar=3
if %lootvar% GEQ 5 set /a flint=%flint% + 1

if %meatvar%==3 set /a driedmeat=%driedmeat% + 3
if %meatvar% NEQ 3 set /a driedmeat=%driedmeat% + 1
echo You have defeated the rancid zombie!
echo.
echo You recieve:
echo - %meatvar% dried meat
if %lootvar% GEQ 5 echo - 1 flint
goto End

:Sword-Fail
echo.
echo Your sword has broken at the hilt. Without a means of
echo protecting yourself, the rancid zombie eats you
echo with ease.
echo.
pause
goto Dead

:No-Sword
echo.
echo Without a means of protecting yourself, the rancid zombie 
echo eats you with ease.
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