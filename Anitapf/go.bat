@echo off

set fire=0

:: Random Encounter Settings -------------------------------------------

:: Setting the random attack threshold
set /a attack_var=%random% * 5 / 32768 + 1

:: This increases the chance for attack each time the GO command is issued
if %place%==forest set /a rev=%rev% + 1
if %place%==beach1 set /a rev=%rev% + 1
if %place%==beach2 set /a rev=%rev% + 1
if %place%==hiram set /a rev=%rev% + 1
if %place%==canyon1 set /a rev=%rev% + 1

:: This sets the attack variable, meaning that a random encounter is going to happen
if %rev% GEQ %attack_var% set attack=1

:: This area calls the appropriate encounter based on the player's location
if %attack%==1 if %place%==forest call ForestEncounter.bat
:: Need to write the scripts for these ones:
if %attack%==1 if %place%==beach1 call BeachEncounter.bat
if %attack%==1 if %place%==beach2 call BeachEncounter.bat
if %attack%==1 if %place%==hiram call HiramEncounter.bat
if %attack%==1 if %place%==canyon1 call CanyonEncounter.bat


:: Place Settings ------------------------------------------------------

:: Place=Cave Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="cave" goto Cave-North
if /I "%1" == "South" if "%place%"=="cave" goto Cave-South
if /I "%1" == "West" if "%place%"=="cave" goto Cave-West
if /I "%1" == "East" if "%place%"=="cave" goto Cave-East

:: Place=CaveMouth Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="cavemouth" goto CaveMouth-North
if /I "%1" == "South" if "%place%"=="cavemouth" goto CaveMouth-South
if /I "%1" == "West" if "%place%"=="cavemouth" goto CaveMouth-West
if /I "%1" == "East" if "%place%"=="cavemouth" goto CaveMouth-East

:: Place=Forest Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="forest" goto Forest-North
if /I "%1" == "South" if "%place%"=="forest" goto Forest-South
if /I "%1" == "West" if "%place%"=="forest" goto Forest-East
if /I "%1" == "East" if "%place%"=="forest" goto Forest-East

:: Place=Beach1 Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="beach1" goto Beach1-North
if /I "%1" == "South" if "%place%"=="beach1" goto Beach1-South
if /I "%1" == "West" if "%place%"=="beach1" goto Beach1-West
if /I "%1" == "East" if "%place%"=="beach1" goto Beach1-East

:: Place=Beach2 Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="beach2" goto Beach2-North
if /I "%1" == "South" if "%place%"=="beach2" goto Beach2-South
if /I "%1" == "West" if "%place%"=="beach2" goto Beach2-West
if /I "%1" == "East" if "%place%"=="beach2" goto Beach2-East

:: Place=Hiram Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="hiram" goto Hiram-North
if /I "%1" == "South" if "%place%"=="hiram" goto Hiram-South
if /I "%1" == "West" if "%place%"=="hiram" goto Hiram-West
if /I "%1" == "East" if "%place%"=="hiram" goto Hiram-East

if /I "%1" == "Blacksmith" if "%place%"=="hiram" goto Hiram-Blacksmith
if /I "%1" == "Barnhouse" if "%place%"=="hiram" goto Hiram-Barnhouse
if /I "%1" == "Mill" if "%place%"=="hiram" goto Hiram-Mill

:: Blacksmith
if /I "%1" == "Workshop" if "%place%"=="hstorage" goto HWorkshop
if /I "%1" == "Storage" if "%place%"=="hworkshop" goto HStorage

if /I "%1" == "Out" if "%place%"=="hworkshop" goto Hiram-Out

:: Barnhouse
if /I "%1" == "Kitchen" if "%place%"=="hliving" goto hkitchen
if /I "%1" == "Kitchen" if "%place%"=="hcellar" goto hkitchen
if /I "%1" == "Living" if "%place%"=="hkitchen" goto hliving
if /I "%1" == "Living" if "%place%"=="hbedroom" goto hliving
if /I "%1" == "Bedroom" if "%place%"=="hliving" goto hbedroom
if /I "%1" == "Cellar" if "%place%"=="hkitchen" goto hcellar

if /I "%1" == "Out" if "%place%"=="hliving" goto Hiram-Out

:: Mill
if /I "%1" == "Lumber" if "%place%"=="hentrance" goto hlumber
if /I "%1" == "Entrance" if "%place%"=="hlumber" goto hentrance
if /I "%1" == "Entrance" if "%place%"=="hboard" goto hentrance
if /I "%1" == "Board" if "%place%"=="hentrance" goto hboardroom

if /I "%1" == "Out" if "%place%"=="hentrance" goto Hiram-Out

:: Place=Canyon1 Settings
:: ---------------------------------
if /I "%1" == "North" if "%place%"=="canyon1" goto Canyon1-North
if /I "%1" == "South" if "%place%"=="canyon1" goto Canyon1-South
if /I "%1" == "East" if "%place%"=="canyon1" goto Canyon1-East
if /I "%1" == "West" if "%place%"=="canyon1" goto Canyon1-West
if /I "%1" == "hut" if "%place%"=="canyon1" goto Canyon1-Hut

:: Place=Swamp1 Settings

echo.
echo Please include a cardnal direction (North, South, East, West)
echo or Building/Room location.
echo.
goto End

:: Directional Settings -------------------------------------------------------

:Cave-North
echo.
echo You cannot go North.
echo. 
goto End

:Cave-South
echo.
echo You cannot go South.
echo. 
goto End

:Cave-West
echo.
echo You cannot go West.
echo.
goto End

:Cave-East
echo.
echo You go east and it seems that you can
echo see a Light.
echo.
set place=cavemouth
pause>nul
call Look.bat
goto End

:CaveMouth-North
echo.
echo You go North, following the path into the
echo forest.
echo.
set place=forest
pause>nul
call Look.bat
goto End

:CaveMouth-South
echo.
echo There are only rocks and boulders that way.
echo There is no way through.
echo.
goto End

:CaveMouth-West 
echo.
echo You turn back, entering again into the
echo darkness of the cave.
echo.
set place=cave
pause>nul
call Look.bat
goto End

:CaveMouth-East
echo.
echo You go East, climbing over boulders, and over the
echo sharp rocks as you go until, at last, you reach
echo the beach.
echo.
set place=beach1
pause>nul
call Look.bat
goto End

:Forest-North
echo.
echo You move quietly and cautiously North through
echo the tangled vines, and thick brush of the dark
echo Forest.
echo.
set place=hiram
pause>nul
call Look.bat
goto End

:Forest-South
echo.
echo You turn back, going the way that you came until
echo again reaching the entrance of the cave.
echo.
set place=cavemouth
pause>nul
call Look.bat
goto End

:Forest-East
echo.
echo The thick foliage and dense vines prevent you from
echo going that way.
echo.
goto end

:Beach1-North
echo.
echo The boulders and steep cliffs prevent you from
echo going up that way.
echo.
goto End

:Beach1-South
echo.
echo You go out into the water and wade for a few minutes
echo before returning to the beach. You feel somewhat
echo revitalized.
echo.
if %beachhealth%==0 set /a healh=%health% + 50
if %beachhealth%==0 set beachhealth=1
goto End

:Beach1-East
echo.
echo You climb over the boulders and the jagged
echo rocks, continuing further down the beach.
echo.
set place=beach2
pause>nul
call Look.bat
goto End

:Beach1-West
echo.
echo You turn back, going the way that you came until
echo again reaching the entrance of the cave.
echo.
set place=cavemouth
pause>nul
call Look.bat
goto End

:Beach2-North
echo.
echo The boulders and steep cliffs prevent you from
echo going up that way.
echo.
goto End

:Beach2-South
echo.
echo The current is stronger, and the rocks deadlier out
echo here on the far beach. You don't dare go wading.
echo.
goto End

:Beach2-East
echo.
echo The beach breaks up into sheer cliffs and long
echo drops. There is no way to cross that way.
echo.
goto End

:Beach2-West
echo.
echo Seeing that there is no other way, you turn back
echo and head toward towards the mouth of the cave.
echo.
set place=beach1
pause>nul
call Look.bat
goto End

:Hiram-North
echo.
echo You decide to leave this place behind, and continue on
echo the road heading due North.
echo.
set place=canyon1
pause>nul
call Look.bat
goto End

:Hiram-South
echo.
echo Discouraged by all you've seen, you turn back. Going back
echo towards the woods from which you came.
echo.
set place=forest
pause>nul
call Look.bat
goto End

:Hiram-West
echo.
echo You turn towards the West, but the steep cliffs provide
echo no adequte path and you are forced to turn back.
echo.
goto End

:Hiram-East
echo.
echo Gathering your supplies, you decide to leave the road in
echo favor of a small, overgrown path. 
echo.
set place=swamp1
pause>nul
call Look.bat
goto end

:: HIRAM BUILDINGS
:: ---------------------------------------------------------------

:Hiram-Out
echo.
echo You leave, and head back into the street of Hiram.
echo.
set place=hiram
pause>nul
call Look.bat
goto End

:Hiram-Blacksmith
echo.
echo You go to the blacksmith
echo.
set place=hworkshop
pause>nul
call Look.bat
goto End

:Hiram-Barnhouse
echo.
echo You go to the barnhouse
echo.
set place=hliving
pause>nul
call Look.bat
goto End

:Hiram-Mill
echo.
echo You go to the mill
echo.
set place=hentrance
pause>nul
call Look.bat
goto End

:HWorkshop
echo.
echo You go into the workshop
echo.
set place=hworkshop
pause>nul
call Look.bat
goto end

:HStorage
echo.
echo You go into the storage
echo.
set place=hstorage
pause>nul
call Look.bat
goto end

:hliving
echo.
echo You go into the living room
echo.
set place=hliving
pause>nul
call Look.bat
goto end

:hkitchen
echo.
echo You go into the kitchen
echo.
set place=hkitchen
pause>nul
call Look.bat
goto end

:hbedroom
echo.
echo You go into the bedroom
echo.
set place=hbedroom
pause>nul
call Look.bat
goto end

:hcellar
echo.
echo You go into the cellar
echo.
set place=hcellar
pause>nul
call Look.bat
goto end

:hentrance
echo.
echo You go to the entrance
echo.
set place=hentrance
pause>nul
call Look.bat
goto end

:hboardroom
echo.
echo You go to the board room
echo.
set place=hboard
pause>nul
call Look.bat
goto end


:hlumber
echo.
echo You go to the lumber yard
echo.
set place=hlumber
pause>nul
call Look.bat
goto end

:: --------------------------------------------------------------------------------

:Canyon1-Hut
echo.
echo You go into the Hut
echo.
set place=chut
pause>nul
call Look.bat
goto End







:End
