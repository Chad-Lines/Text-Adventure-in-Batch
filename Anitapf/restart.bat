@echo off

:: TODO LIST:
:: - Remove Cooking function [X]
:: - Code Random Encounter System [X]

::Setting Game Global Variables -----------

::Places
set place=cave

:: ----------------------

::Random Encounter Variables:
set rev=0
set attack_var=0
set attack=0


:: Single Items 
set sword=0
set armor=0
set necklace=0
set seenecklace=0
set beachflint=0
set beachhealth=0
set letter=0

:: Hiram Items ----------
set hilt=0
set hammer=0
set picture=0
set book1=0
set blanket=0
set doll=0
set driedmeat=0
set boardkey=0
set chips=0
set silverpearl=0

:: ----------------------

set takebread=0
set soldierdead=0
set seeletter=0
set seehammer=0
set giantcrab=0

:: Food
set crabmeat=0
set crabmeattaken=0
set bread=0
set cookedcrabmeat=0

:: Variable Items
set water=0
set flint=0
set fire=0

:: Health and Energy
set health=75
set energy=25

:: Tool Health
set swordhealth=60
set armorhealth=75

:: Fight Scenes
set ff1=0
set bf1=0
set cf1=0

set silverpearltalk=0

set dps=NO

cls
echo.
echo.
echo.
echo       D I S G L E I R I O   P E R L O G  
echo      -----------------------------------
echo.
echo.           
echo.
pause
cls
call look

:: NOTES ON COMMANDS -----------------------

:: Your available commands are as follows:
:: - Look              
:: - Examine [item]    
:: - Take [item]       
:: - Use [item]
:: - Go [direction]
:: - Wait 
:: - Help
:: - Information
:: - 

:: * NOT IMPLEMENTED YET

:: -------------------------------------------

:: AREAS:
:: - cave  X
:: - cavemouth X
:: - forest
:: - beach