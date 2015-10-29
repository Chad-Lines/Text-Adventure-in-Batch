@echo off

:: Blacksmith Items
if /I "%1"=="Table" if "%place%"=="hworkshop" goto Blacksmith-Table
if /I "%1"=="Anvil" if "%place%"=="hworkshop" goto Blacksmith-Anvil
if /I "%1"=="Hammer" if "%place%"=="hstorage" goto Blacksmith-Hammer
if /I "%1"=="Hilt" if "%place%"=="hstorage" goto Blacksmith-Hilt

:: Barnhous Items
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