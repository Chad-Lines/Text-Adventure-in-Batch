@echo off

if /I "%1%"=="Pearl" goto Take-Pearl
if /I "%1%"=="sword" goto Take-Sword
if /I "%1%"=="bread" goto Take-Bread
if /I "%1%"=="milk" goto Take-Milk
if /I "%1%"=="necklace" goto Take-Necklace
if /I "%1%"=="rocks" goto Cant-Take
if /I "%1%"=="bush" goto Cant-Take
if /I "%1%"=="flint" goto Take-Flint
if /I "%1%"=="armor" goto Take-Armor

:: HIRAM ITEMS -----------------------
if /I "%1"=="hammer" goto Take-Hammer
if /I "%1%"=="Hilt" goto Take-Hilt
if /I "%1%"=="Picture" goto Take-Picture
if /I "%1%"=="Book" goto Take-Book
if /I "%1%"=="Blanket" goto Take-Blanket
if /I "%1%"=="Doll" goto Take-Doll
if /I "%1%"=="Meat" goto Take-Meat
if /I "%1%"=="Key" goto Take-Key


::------------------------------------
::if /I "%1"=="the" call take "%2"
goto Cant-Take



:: ITEMS --------------------------------------

::PEARLS---------------------
:Take-Pearl
if "%silverpearl%"=="1" if %place%==hboard goto Already-Got
if "%place%" NEQ "hboard" goto Cant-See
if %place%==hboard set silverpearl=1

:: Input additional Pearl item here

goto Take
:: --------------------------

:Take-Sword
if "%sword%"=="1" goto Already-Got
if "%place%" NEQ "cave" goto Cant-See
set sword=1
goto Take

:Take-Bread
if "%bread%"=="1" goto Already-Got
if "%place%" NEQ "cave" goto Cant-See
set bread=1
set takebread=1
echo You can eat food with the EAT command
goto Take

:Take-Milk
if "%milk%"=="1" goto Already-Got
if "%place%" NEQ "cave" goto Cant-See
set milk=1
goto Take

:Take-Necklace
if "%necklace%"=="1" goto Already-Got
if "%place%" NEQ "forest" goto Cant-See
set necklace=1
goto Take

:Take-Flint
if "%place%"=="beach1" if %beachflint%==1 goto Already-Got
if "%place%" NEQ "beach1" goto Cant-See
set beachflint=1
set /a flint=%flint% + 1
goto take

:Take-Armor
if "%armor%"=="1" goto Already-Got
if "%soldierdead%"==0 goto Cant-See
if "%place%" NEQ "beach2" goto Cant-See
set armor=1
set /a health=%health% + 70
if %health% GEQ 150 set health=150
goto Take

:: HIRAM ITEMS----------------------------------

:Take-Hammer
if "%hammer%"=="1" goto Already-Got
if "%place%" NEQ "hstorage" goto Cant-See
set hammer=1
goto Take

:Take-Hilt
if "%hilt%"=="1" goto Already-Got
if "%place%" NEQ "hstorage" goto Cant-See
set hilt=1
goto Take

:Take-Picture
if "%picture%"=="1" goto Already-Got
if "%place%" NEQ "hliving" goto Cant-See
set picture=1
goto Take

:Take-Book
if "%book1%"=="1" goto Already-Got
if "%place%" NEQ "hliving" goto Cant-See
set book1=1
goto Take

:Take-Blanket
if "%blanket%"=="1" goto Already-Got
if "%place%" NEQ "hbedroom" goto Cant-See
set blanket=1
goto Take

:Take-Doll
if "%doll%"=="1" goto Already-Got
if "%place%" NEQ "hbedroom" goto Cant-See
set doll=1
goto Take

:Take-Meat
if "%driedmeat%"=="1" goto Already-Got
if "%place%" NEQ "hcellar" goto Cant-See
set driedmeat=1
goto Take

:Take-Key
if "%boardkey%"=="1" goto Already-Got
if "%place%" NEQ "hentrance" goto Cant-See
set boardkey=1
goto Take


:: -------------------------------------------

:Already-Got
echo.
echo You are already carrying that.
echo.
goto Exit

:Cant-See
echo.
echo You can't see that here...
echo.
goto Exit

:Cant-Take
echo.
echo You cant take that
echo.
goto Exit

:Take
echo.
echo You take the %1.
echo.
goto Exit

:Exit