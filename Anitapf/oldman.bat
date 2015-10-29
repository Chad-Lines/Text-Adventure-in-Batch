@echo off

cls
echo.
echo The old man rolls his old, tired eyes.
:start
echo.
echo "What do you want?"
echo.
echo Ask where you are (1)
if %silverpearl%==1 echo Show him the pearl (2)
if %picture%==1 echo Ask him about the picture (3)
echo "Nothing, I'm sorry" (4)
echo.
set /p go=(1/2/3/4): 

if %go%==1 goto Place
if %go%==2 if %silverpearl%==1 goto Pearl
if %go%==3 if %picture% ==1 goto Picture
if %go%==4 goto End

echo Invalid selection
goto start

:Place
echo.
echo "I don't know where you're going with this, kid.
echo You're in Atinapf. You should know that."
echo.
goto start

:Pearl
echo.
echo The old man's eyes widen, and he snatches the pearl and \
echo studies it carefully.
echo.
echo    "I haven't seen one of these in years...
echo          No, no, no, this isn't just ANY pearl, don't you see?"
echo.
echo The old man hands places the pearl carefully into your hand.
echo.
echo    "You carry this with you. It is a HEALING Pearl. Keep it safe
echo    and it will serve you well..."
echo.
set silverpearltalk=1
goto End

:Picture
echo.
echo The old man holds the picture in his shaking hands, and his eyes
echo begin to water.
echo.
echo    "That's me. Don't you see? That's me, and my Lucy, and my Olivia."
echo.
echo He holds the picture close to his chest.
echo.
echo    "May I keep this?"
echo.
set /p give=(Y/N): 
if /I %give%==y goto Picture-Give
if /I %give%==n goto Picture-Keep

:Picture-Give
echo.
echo You let the old man keep the picture.
echo.
echo He reaches deep inside his pocket, brings something out 
echo and hands it to you. You see that it's a golden pearl.
echo.
echo   "That'll help you if you run into trouble."
echo.
goto End

:Picture-Keep
echo.
echo You refuse, and take the picture back.
echo.
echo The old man turns his head and refuses to look at you.
echo.
goto End

:End