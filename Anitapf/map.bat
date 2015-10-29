@echo off
echo.
echo " Map of the Island of Anitapf
echo " 
echo " 
echo "                          20 - 22
echo "                  18 - 19<|  
echo "                   |      21  
echo " 16 - 15 -8 - 9 - 13 - 14              N
echo "  |    \  |  /     |   /               |
echo " 17     '-7-'   ,- 12-'           W----+----E
echo "          |    /   |                   |
echo "          6 - 10 - 11                  S
echo "          |      
echo "          3
echo "          | 
echo "      1 - 2 - 4 - 5  
echo.

if %place%==cave set loc=1
if %place%==cavemouth set loc=2
if %place%==forest set loc=3
if %place%==beach1 set loc=4
if %place%==beach2 set loc=5
if %place%==hiram set loc=6
if %place%==canyon1 set loc=7

echo Your current location is [%loc%]
echo.

:End