@echo off

:: NEED TO FINISH MILL


if /I "%place%"=="cave" goto Cave
if /I "%place%"=="cavemouth" goto Cave-Mouth
if /I "%place%"=="forest" goto Forest
if /I "%place%"=="beach1" goto Beach1
if /I "%place%"=="beach2" goto Beach2
if /I "%place%"=="hiram" goto Hiram
:: HIRAM PLACES ----------------------------
if /I "%place%"=="hiram" goto Hiram
if /I "%place%"=="hworkshop" goto hworkshop
if /I "%place%"=="hstorage" goto hstorage
if /I "%place%"=="hliving" goto hliving
if /I "%place%"=="hkitchen" goto hkitchen
if /I "%place%"=="hbedroom" goto hbedroom
if /I "%place%"=="hcellar" goto hcellar
if /I "%place%"=="hentrance" goto hentrance
if /I "%place%"=="hboard" goto hboard
if /I "%place%"=="hlumber" goto hlumber
:: ------------------------------------------
if /I "%place%"=="canyon1" goto Canyon1
if /I %place%==chut goto Chut

:: Add iram

goto error

:: PLACE DESCRIPTIONS --------------------------------------------------

:Cave
cls
echo.
echo.
echo CAVE
echo You are in a dark and soggy cave. The air is damp and heavy. 
echo You don't seem to be injured, but you would like to find a
echo way out of here...
echo.
echo Type HELP to get a list of commands.
echo.
goto Exit

:Cave-Mouth
cls
echo.
echo.
echo CAVE MOUTH
echo You have reached the mouth of the cave. You shield your
echo eyes as you step into the bright sunlight. How long have
echo you been out?
echo.
echo The cave opens into a forest that borders the beach.
echo.
goto Exit

:Forest
cls
echo.
echo.
echo FOREST
echo You have entered the forest, darkened by a thick canope.
echo You grip your sword tightly as you hear rustling and
echo beastly noises all around you.
echo.
goto Exit

:Beach1
cls
echo.
echo.
echo BEACH
echo The beach is rugged, full of jagged rocks and large boulders.
echo You make your way along, careful not to cut your feet
echo or lose your footing.
echo.
goto Exit

:Beach2
cls
echo.
echo FAR BEACH
echo The beach continues in its vein. It's rugged and cold.
echo Not much to be seen
echo.
if "%giantcrab%"=="0" goto :Beach2-Fight
goto Exit

:Beach2-Fight
pause
cls
echo.
set giantcrab=1
echo Up ahead you see another giant crab, with something in
echo it's claw. You make your way carefully and see that it's
echo a Soldier!
echo.
echo You rush up and thrust your sword between it's eyes.
echo.
echo The crab drops lifelessly to the earth.
echo.
goto Exit

:Hiram 
cls
echo.
echo HIRAM
echo After traveling some distance, you come to the ruins of
echo an old village perched against a sheer cliff. Most of the 
echo buildings have been burnt to the ground, and there is no sign of life.
echo.
echo You can enter a building or room by using the GO [Location] command.
echo.
goto Exit

:: HIRAM BUILDINGS -----------------------------------------------------

:HWorkshop 
cls
echo.
echo BLACKSMITH WORKSHOP
echo The air is thick with dust, soot, and ash. The workshop is mostly
echo empty - the tools and merchandise evacuated, or later looted, long
echo ago. 
echo.
goto Exit

:HStorage
cls
echo.
echo BLACKSMITH STORAGE
echo The storage area is nearly empty. You're sure it has been looted.
echo After looking around for a little while, however, you have found a few
echo things.
echo.
goto Exit

:hliving
cls
echo.
echo BARN HOUSE
echo The house has been very badly burnt, and only a few rooms remain
echo intact. The front room is littered with broken and burnt 
echo furniture items.
echo.
goto Exit

:hkitchen
cls
echo.
echo KITCHEN
echo There is not much to see here. You can only imagine how this
echo used to be the lively part of the house, but now it is
echo left destitue.
echo.
goto Exit

:hbedroom
cls
echo.
echo BEDROOM
echo You are surprised to see the bedroom in such good shape.
echo However, it is also covered in ash and dust, and most of the
echo furniture and personal items have been looted.
echo.
goto Exit

:hcellar
cls
echo.
echo CELLAR
echo You are immediately aware of a strong putrid smell, and notice
echo an entaglement of human corpses. Otherwise the cellar is mostly
echo empty.
echo.
goto Exit

:hentrance
cls
echo.
echo LUMBER MILL
echo The main production room of the lumber mill is especially
echo dusty, and full of saw dust and wood chips. You can see
echo the massive table saw with the blade now missing.
echo.
goto Exit

:hboard
cls
echo.
echo BOARD ROOM
echo This looks like a gathering room of some kind. It's full
echo of dust and cobwebs, but otherwise is fairly well
echo preserved.
echo.
goto Exit

:hlumber
cls
echo.
echo LUMBER YARD
echo Aside from a few scattered wood chips, too small to be of
echo any use, the lumber yard is empty
echo.
goto Exit

:Canyon1
cls
echo.
echo CANYON GULF
echo You descend into the depths of the canyon. It is chilling and
echo grey here. There is little vegitation and the lifeless nature 
echo of this island is beginning to take its toll on you...
echo.
goto Exit

:Chut
cls
echo.
echo THE HUT
echo The hut is rundown and nearly empty. Sitting in a broken chair
echo is an old man who looks at you without the slightest hint of
echo surprise.
echo.
goto Exit






:Error
echo.
echo.
echo ERROR: UNDEFINED PLACE
goto LastExit

:: ITEMS SEEN -----------------------------------------------------

:Exit
echo.
echo You can see:

:: Cave Items
if "%place%"=="cave" echo Rocks
if "%place%"=="cave" if "%takebread%"=="0" echo Bread Crumbs
if "%place%"=="cave" if %sword%==0 echo An old, rusted Sword
if "%place%"=="cave" echo Wreckage
if "%place%"=="cave" goto LastExit

:: Cave Mouth Items 
if "%place%"=="cavemouth" echo A path leading North into the Forest
if "%place%"=="cavemouth" echo A rocky path leading East towards the Beach
if "%place%"=="cavemouth" goto LastExit

:: Forest Items
if "%place%"=="forest" echo A Bush
if "%place%"=="forest" echo Rocks
if "%place%"=="forest" echo Remains of Some Animal
if "%place%"=="forest" if %necklace%==0 if %seenecklace%==1 echo A Necklace
if "%place%"=="forest" if %ff1%==1 echo The Body of the Beast
if "%place%"=="forest" goto LastExit

:: Beach1 Items
if "%place%"=="beach1" echo Rocks
if "%place%"=="beach1" echo Boulders
if "%place%"=="beach1" if %beachflint%==0 echo A small piece of Flint
if "%place%"=="beach1" if %bf1%==1 echo The Body of the Crab
if "%place%"=="beach1" goto LastExit

:: Beach2 Items
if "%place%"=="beach2" echo Rocks
if "%place%"=="beach2" if %soldierdead%==1 echo lifeless Soldier
if "%place%"=="beach2" if %soldierdead%==0 echo wounded Soldier
if "%place%"=="beach2" echo Body of the Crab
if "%place%"=="beach2" goto LastExit

:: HIRAM PLACES --------------------------------------------------

:: Hiram Town Places
if "%place%"=="hiram" echo Blacksmith (BUILDING)
if "%place%"=="hiram" echo Barnhouse (BUILDING)
if "%place%"=="hiram" echo Mill (BUILDING)
if "%place%"=="hiram" goto LastExit

:: Blacksmith Places
if "%place%"=="hworkshop" echo Table
if "%place%"=="hworkshop" echo Anvil
if "%place%"=="hworkshop" echo Storage (ROOM)

if "%place%"=="hstorage" if %hammer%==0 echo blacksmith Hammer
if "%place%"=="hstorage" if %hilt%==0 echo sword Hilt
if "%place%"=="hstorage" echo Workshop(ROOM)

:: Barnhouse Places
if "%place%"=="hliving" if %picture%==0 echo Picture frame
if "%place%"=="hliving" echo Bench
if "%place%"=="hliving" if %book1%==0 echo Book
if "%place%"=="hliving" echo Kitchen (ROOM)
if "%place%"=="hliving" echo Bedroom (ROOM)

if "%place%"=="hkitchen" echo Table
if "%place%"=="hkitchen" echo Cupboard
if "%place%"=="hkitchen" echo Cellar (ROOM)
if "%place%"=="hkitchen" echo Living Room (ROOM)

if "%place%"=="hbedroom" echo Bed
if "%place%"=="hbedroom" echo end Table
if "%place%"=="hbedroom" if %blanket%==0 echo Blanket
if "%place%"=="hbedroom" if %doll%==0 echo small Doll
if "%place%"=="hbedroom" echo Living Room (ROOM)

if "%place%"=="hcellar" echo Corpses
if "%place%"=="hcellar" if %driedmeat%==0 echo dried Meat
if "%place%"=="hcellar" echo Kitchen (ROOM)

:: Mill Places
if "%place%"=="hentrance" echo Desk
if "%place%"=="hentrance" echo Board room (ROOM)
if "%place%"=="hentrance" echo Lumber yard (ROOM)
if "%place%"=="hentrance" goto LastExit

if "%place%"=="hboard" echo Chair
if "%place%"=="hboard" echo Safe
if "%place%"=="hboard" echo Entrance (ROOM)
if "%place%"=="hboard" goto LastExit

if "%place%"=="hlumber" if %chips%==0 echo wood Chips
if "%place%"=="hlumber" echo Entrance (ROOM)
if "%place%"=="hlumber" goto LastExit
:: --------------------------------------------------------------------------

:: Canyon1 Items
if %place%==canyon1 echo Rocks 
if %place%==canyon1 echo Dust
if %place%==canyon1 echo Hut (BUILDING)

if %place%==chut echo old Man
if %place%==chut echo bench


:LastExit
if "%fire%"=="1" echo The Fire
echo.