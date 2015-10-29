@echo off

set /a millipedequest=%millipedequest% + 1
if %millipedequest% GEQ 4 goto NoMore
if %place% NEQ cave goto NoMore

echo.
echo You attack a giant millipede.
echo.
pause>nul

:: Setting the Mob's Health
set millepedehealth=50
:: Setting Mob's abilities
set /a millepede_snap=%random% * 3 / 32768 + 1
set /a millepede_bite=%random% * 4 / 32768 + 2

:: Setting Hero's Health
set health=%health%
:: Setting Hero's Abilities
set /a slash_dmg=%random% * 10 / 32798 + 1
set /a stab_dmg=%random% * 15 / 32798 + 5

:Beach1-Fight-Hero
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
echo The Millepede's Health is: %millepedehealth%
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
if /I %hit%==Slash set /a millepedehealth=%millepedehealth% - %slash_dmg%
if /I %hit%==Slash echo.
if /I %hit%==Slash echo You Slash at the Millepede for %slash_dmg% damage!
if /I %hit%==Stab if %stab%==1 set /a millepedehealth=%millepedehealth% - %stab_dmg%
if /I %hit%==Stab if %stab%==1 echo.
if /I %hit%==Stab if %stab%==1 echo You Stab the Millepede for %stab_dmg% damage!
if /I %hit%==Stab if %stab%==0 echo.
if /I %hit%==Stab if %stab%==0 echo Your Stab missed!
:: This section tests for invalid input 
:: if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" set spot=Beach1-Fight-Hero
if /I "%hit%" NEQ "Slash" if /I "%hit%" NEQ "Stab" goto UNFOUND
:: Determines if the Millepede is dead or not
if /I %millepedehealth% LEQ 0 echo You have defeated the giant Millepede
if /I %millepedehealth% LEQ 0 goto Drop
echo.
echo The Millepede's Health is at: %millepedehealth%
echo.
pause>nul
if /I %hit%==Stab if %stab%==1 set /a swordhealth="%swordhealth%" - 3
if /I %hit%==Slash set /a swordhealth="%swordhealth%" - 3
if %swordhealth% LEQ 0 goto Sword-Fail
goto Beach1-Fight-Millepede

:Beach1-Fight-Millepede
:: Here we're setting a random number between 1-10 which will be used
:: to determine what type of attack the Millepede does
set /a Millepede_spell_num=%random% * 10 / 32768 + 1

:: This resets the damage done by the mob's two spells
:: The wolf_slash spell will do random damage between 1-5
set /a millepede_snap=%random% * 7 / 32768 + 3
:: The wolf_charge spell will do random damage between 10-40
set /a millepede_bite=%random% * 9 / 32768 + 5

:: This uses the random number to determine which attak the mob will
:: use. Right now it's a 70/30 chance between them
if /I %Millepede_spell_num% LEQ 7 set Millepede_attack=%millepede_snap%
if /I %Millepede_spell_num% GTR 7 set Millepede_attack=%millepede_bite%

cls
echo.
echo.
echo Your Health is: %health%
echo.
echo The Millepede's Health is: %millepedehealth%
echo --------------------------------
echo.
if /I %Millepede_attack%==%millepede_snap% echo The Millepede Snaps at you with it's massive claw for %millepede_snap% damage!
if /I %Millepede_attack%==%millepede_snap% set /a health=%health% - %millepede_snap%
if /I %Millepede_attack%==%millepede_bite% echo The Millepede Bites you for %millepede_bite% damage!
if /I %Millepede_attack%==%millepede_bite% set /a health=%health% - %millepede_bite%
echo.
if %armor%==1 set /a health=%health% + 3
if /I %health% LEQ 0 goto Dead
if %armor%==1 echo Your Armor blocked 3 damage!
echo Your Health is now: %health%
echo.
pause>nul
if %armor%==1 set /a armorhealth=%armorhealth% - 3
goto Beach1-Fight-Hero

:Drop
set /a droprate=%random% * 10 / 32768 + 1
if %droprate% LEQ 3 set /a millipedemeat=%millipedemeat% + 1
if %droprate% LEQ 3 echo.
if %droprate% LEQ 3 echo You have retrieved a piece of fresh millipede meat
if %droprate% LEQ 3 echo.
goto End

:Sword-Fail
echo.
echo Your sword has broken at the hilt. Without a means of
echo protecting yourself, the giant Millepede beats you to death
echo with ease.
echo.
pause>nul
goto Dead

:No-Sword
echo.
echo Without a means of protecting yourself, the giant Millepede 
echo snaps you to death with ease.
echo.
goto Dead

:Dead
echo.
echo You have died. 
echo.
pause>nul
exit

:UNFOUND
echo.
echo.
echo %go% is not valid
echo.
echo.
pause>nul
echo.
goto Beach1-Fight-Hero

:NoMore
echo.
echo There are no millipedes here.
echo.
goto End


:End


