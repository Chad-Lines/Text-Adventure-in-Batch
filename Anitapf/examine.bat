@echo off

:: The "Examine" action is primarily applied to items whereas the 
:: "Look" action is primarily applied to places...

if [%1]==[] look
if /I "%1"=="fire" goto Fire

:: Based on Place 
:: ---------------------------------------------------------------

:: CAVE Items
if /I "%1"=="sword" goto Sword
if /I "%1"=="bread" goto Bread
if /I "%1"=="water" goto Water
if /I "%1"=="wreckage" goto Wreckage

:: CAVE-MOUTH Items
if /I "%1"=="North" goto North-Path
if /I "%1"=="East" goto East-Path

:: FOREST Items
if /I "%1"=="Bush" goto Forest-Bush
if /I "%1"=="Rocks" if "%place%"=="forest" goto Forest-Rocks
if /I "%1"=="Remains" goto Forest-Remains
if /I "%1%"=="Necklace" goto Forest-Necklace
if /I "%1"=="Body" if "%place%"=="forest" goto Forest-Beast
if /I "%1%"=="Beast" goto Forest-Beast

:: BEACH1 Items
if /I "%1"=="Rocks" if "%place%"=="beach1" goto Beach1-Rocks
if /I "%1"=="Body" if "%place%"=="beach1" goto Beach1-Crab
if /I "%1"=="boulders" if "%place%"=="beach1" goto Beach1-Boulders
if /I "%1"=="Crab" if "%place%"=="beach1" goto Beach1-Crab
if /I "%1"=="crab-meat" if "%place%"=="beach1" goto Beach1-CrabMeat
if /I "%1"=="flint" if "%place%"=="beach1" goto Beach1-Flint

:: BEACH2 Items
if /I "%1"=="Soldier" if "%place%"=="beach2" goto Beach2-Soldier
if /I "%1"=="Rocks" goto Beach1-Rocks
if /I "%1"=="crab" if "%place%"=="beach2" goto Beach2-Crab
if /I "%1"=="Body" if "%place%"=="beach2" goto Beach2-Crab

:: HIRAM PLACES --------------------------------------------------------

:: Blacksmith Items
if /I "%1"=="Table" if "%place%"=="hworkshop" goto Blacksmith-Table
if /I "%1"=="Anvil" if "%place%"=="hworkshop" goto Blacksmith-Anvil
if /I "%1"=="Hammer" if "%place%"=="hstorage" goto Blacksmith-Hammer
if /I "%1"=="Hilt" if "%place%"=="hstorage" goto Blacksmith-Hilt

:: Barn house Items
if /I "%1"=="Picture" if "%place%"=="hliving" goto Barnhouse-Picture
if /I "%1"=="Bench" if "%place%"=="hliving" goto Barnhouse-Bench
if /I "%1"=="Book" if "%place%"=="hliving" goto Barnhouse-Book

if /I "%1"=="Table" if "%place%"=="hkitchen" goto Barnhouse-Table
if /I "%1"=="Cupboard" if "%place%"=="hkitchen" goto Barnhouse-Cupboard

if /I "%1"=="Bed" if "%place%"=="hbedroom" goto Barnhouse-Bed
if /I "%1"=="Table" if "%place%"=="hbedroom" goto Barnhouse-Table2
if /I "%1"=="Blanket" if "%place%"=="hbedroom" goto Barnhouse-Blanket
if /I "%1"=="Doll" if "%place%"=="hbedroom" goto Barnhouse-Doll

if /I "%1"=="Corpses" if "%place%"=="hcellar" goto Cellar-Corpses
if /I "%1"=="Corpse" if "%place%"=="hcellar" goto Cellar-Corpses
if /I "%1"=="Meat" if "%place%"=="hcellar" goto Cellar-Meat

:: Mill Items
if /I "%1"=="Desk" if "%place%"=="hentrance" goto Entrance-Desk

if /I "%1"=="Chair" if "%place%"=="hboard" goto Board-Chair
if /I "%1"=="Safe" if "%place%"=="hboard" goto Board-Safe

if /I "%1"=="Chips" if "%place%"=="hlumber" goto Lumber-Chips

:: ------------------------------------------------------------
if /I %1==rocks if %place%==canyon1 goto canyon1-rocks
if /I %1==dust if %place%==canyon1 goto canyon1-dust
if /I %1==hut if %place%==canyon1 goto canyon1-hut

if /I %1==bench if %place%==chut goto chut-bench
if /I %1==man if %place%==chut goto chut-oldman
if /I %1==old if %place%==chut goto chut-oldman
if /I %1==oldman if %place%==chut goto chut-oldman


:: ------------------------------------------------------------
if "%1" == "the" examine %2
goto Cant-See



:: Specific Items 
:: ------------------------------------------------------------

:Sword
if "%sword%" NEQ "1" if "%place%" NEQ "cave" goto Cant-See
echo.
echo The sword is old and rusty but it will have to do...
echo.
goto End

:Bread
if "%bread%" NEQ "1" if "%place%" NEQ "cave" goto Cant-See
echo.
echo The bread crumbs are soggy with spots of mold here
echo and there, but they're better than nothing if you get
echo hungry.
echo.
goto End

:Water
if "%water%" LSS "1" goto Cant-See
echo.
echo The water at least looks clean and drinkable.
echo.
goto End

:Wreckage
if "%place%" NEQ "cave" goto Cant-See
if "%flint%"=="0" goto Wreckage-Flint
echo.
echo The wreckage appears very much unchanged.
echo.
goto End

:Wreckage-Flint
set /a flint=%flint% + 1
echo.
echo Your memory starts to come back. You remember sailing
echo in the boat, and you think you remember the storm.
echo. 
echo Outside the cave you can hear the water gurgling and
echo splashing. The boat must have washed ashore here
echo somehow.
echo.
echo You browse the wreckage and find a piece of flint!
echo This can be used to start a fire later on.
echo.
goto End

:Fire
if "%fire%" == "0" goto Cant-see
echo.
echo You stare into the burning embers, thinking of the
echo life that used to be...
echo.
goto End

:North-Path
if "%place%" NEQ "cavemouth" goto Cant-See
echo.
echo The north path leads into the woods. It lookes dark
echo but the way looks safest.
echo.
goto End

:East-Path
if "%place%" NEQ "cavemouth" goto Cant-See
echo.
echo The east path leads down to the beach. The path is
echo rocky and looks dangerous.
echo.
goto End

:Forest-Bush
echo.
if %ff1%==0 call ForestFight1
echo The bush is empty now.
echo.
goto End

:Forest-Rocks
echo.
echo The rocks are large, and burried beaneath a 
echo heavy layer of dirt and debris.
echo.
goto End

:Forest-Remains
echo.
echo You lean in close those the rotting remains.
echo They almost look...human.
echo.
if %necklace%==0 echo You see the dim sunlight glint off of a Necklace
if %necklace%==0 echo made of fine metal.
set seenecklace=1
echo.
goto End

:Forest-Necklace
if %seenecklace%==0 goto Cant-See
echo.
echo The necklace is very finely crafted. The owner must
echo have been very well off.
echo.
goto End

:Forest-Beast
if %ff1%==0 goto Cant-See
echo.
echo You bend down and examine the fowl beast you have
echo slain. With its human features, you are sure that it is
echo a chimera of some kind - an abomination. You were right
echo to slay it.
echo.
goto End

:Beach1-Rocks
echo.
echo The rocks here are jagged and sharp.
echo.
goto End

:Beach1-Boulders
echo.
if %bf1%==0 call BeachFight1
echo The boulders stand motionless
echo.
goto End

:Beach1-Crab
if %bf1%==0 goto Cant-See
echo.
echo The body of the crab lies hunched over and lifeless
echo before you. 
echo.
if "%crabmeattaken%"=="0" goto :Beach1-CrabMeat-Take
goto End

:Beach1-CrabMeat-Take
echo.
echo There is a lot of meat on this crab that can be
echo eaten to reclaim health.
echo.
set /p take=Will you take some?(Y/N): 
if /I %take%==Y set crabmeat=1
if /I %take%==Y set crabmeattaken=1
if /I %take%==Y goto End
if /I %take%==N goto End


:Beach1-CrabMeat-Take
if %crabmeat%=0 goto Cant-See
echo.
echo The crabmeat looks juicy and clean. It makes
echo your mouth water.
echo.
goto End

:Beach1-Flint
echo.
echo Flint is used to start fires.
echo.
goto End

:Beach2-Soldier
if %soldierdead%==0 goto Beach2-SoldierLive
if %soldierdead%==1 goto Beach2-SoldierDead
goto End
:Beach2-SoldierLive
echo.
echo The Soldier writhes in the surf. He is clearly
echo in a great deal of pain. You examine his wounds and it
echo is clear that his time is short.
echo.
echo HINT: You can use the TALK command to ascertain infortmation
echo from people around you. Type HELP for more information.
echo.
goto End
:Beach2-SoldierDead
echo.
echo The lifeless body of the Soldier lies limp in the 
echo cold surf.
echo.
echo Unfortunatly he doesn't have any weapons. However,
echo his armor is lightly damaged, but it still may be
echo of use to you.
echo.
goto End

:Beach2-Crab
echo.
echo The body of the crab lies hunched over and lifeless
echo before you. 
echo.
if "%crabmeat2taken%"=="0" goto :Beach2-CrabMeat-Take
goto End
:Beach2-CrabMeat-Take
echo.
echo There is a lot of meat on this crab that can be cooked
echo over a hot fire.
echo.
set /p take=Will you take some?(Y/N): 
if /I %take%==Y set crabmeat=1
if /I %take%==Y set crabmeat2taken=1
if /I %take%==Y goto End
if /I %take%==N goto End

:: HIRAM PLACES ----------------------------------------------

:Blacksmith-Table
echo.
echo The table is covered in dust and debris. You remove most of the
echo large debris and see a marking on the desk.
echo.
echo You clear away the dust and the marking becomes clear.
echo Crudely carved is the word: KHANET'A
echo.
goto End

:Blacksmith-Anvil
echo.
echo Aside from the dust and soot, the anvil is in good condition.
echo It is clear that the blacksmith took great care with his tools.
echo.
goto End

:Blacksmith-Hammer
echo.
echo The hammer appears in good condition, and very
echo sturdy. Perhaps it could be used for repairing armor and
echo weapons.
echo.
goto End

:Blacksmith-Hilt
echo.
echo The hilt is finely and meticulously crafted. You reget that
echo there is not a blade attached.
echo.
goto End

:Barnhouse-Picture
echo.
echo The picture is badly burnt, but you can see that it is of
echo a man, his wife, and their young daughter.
echo.
echo On the back is written: "My dearest Iohann, know, my dear
echo that we are with you, and you are continually in our hearts
echo forever - your loving wife, Lucy"
echo.
goto End

:Barnhouse-Bench
echo.
echo You sit on the bench and rest for a few minutes.
echo.
goto End

:Barnhouse-Book
echo.
echo The title of the book is "Istor hefo Maikin"
echo.
echo You open the book and look through it, but you 
echo are unable to read the language.
echo.
echo On the inside of the front cover is written:
echo "Property of I. Yelhker Ciadda"
echo.
goto End

:Barnhouse-Table
echo.
echo The table is covered in dust, and various, useless
echo dishes.
echo.
goto End

:Barnhouse-Cupboard
echo.
echo You open the cupboards but they are bare.
echo.
goto End

:Barnhouse-Bed
echo.
echo You wipe some of the dust off of the old matress and lay down.
echo It feels good to rest for a little bit.
echo.
goto End

:Barnhouse-Table2
echo.
echo You open the drawer of the end table, and find it 
echo empty.
echo.
goto End

:Barnhouse-Blanket
echo.
echo The blanket is dusty and old, but soft and heavy.
echo.
goto End

:Barnhouse-Doll
echo.
echo You take the doll in your hands. It reminds you of
echo something, but you can't recall...
echo.
echo You set it back down reverently, thinking of the 
echo little girl that it must have once belonged to.
echo.
goto End

:Cellar-Corpses
echo.
echo You see a tangle of corpses. They are old and badly
echo burnt. It's impossible to tell if it is the bodies
echo of the family that once lived here.
echo.
goto End

:Cellar-Meat
echo.
echo The dried meat is burnt, but doesn't smell
echo too bad.
echo.
goto End

:Entrance-Desk
echo.
echo The desk is old and worn.
if "%boardkey%"=="0" echo You open a drawer to see a small key...
echo.
goto End

:Board-Chair
echo.
echo The chair is sturdy. You sit in it and rest for a few
echo minutes.
echo.
goto End

:Board-Safe
echo.
if %boardkey%==0 echo The safe is locked and requires a key
if %boardkey%==1 echo You use the key from the desk to open the safe.
if %boardkey%==1 echo Inside it is empty except for what appears to be
if %boardkey%==1 echo a small, silver Pearl.
echo.
goto End

:Lumber-Chips
echo.
echo There are many small wood chips scattereda around.
echo.
goto End
::---------------------------------------------------------------------------------

:canyon1-rocks
echo.
echo The rocks are gray and tough.
echo.
goto End

:canyon1-dust
echo.
echo The dust is everwhere. It seems to clogg your lungs,
echo it plugs your nose, making it hard to breath.
echo.
goto End

:canyon1-hut
echo.
echo The hut is small and run-down.
echo.
goto End

:chut-bench
echo.
echo You sit on the bench, and try to ignore the glances of
echo the old man.
echo.
goto End

:chut-oldman
echo.
echo The man's eyes are sunk deep, and his face is covered in deep wrinkles.
echo He stares at you and you imagine you can see a glint in his eyes.
echo.
goto End


:Cant-See
echo.
echo That is nowhere to be seen
echo.
goto End

:End
echo.