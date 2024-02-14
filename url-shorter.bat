@echo off && title URL-Shorter_v0.2 [ConzZah]  
set c2c=%tmp%\copylink2clipboard.txt
echo  PASTE LINK ^& PRESS ENTER : && echo. && set /p user_url=
echo. && echo [FETCHING SHORTLINK ^& QR-CODE..] && echo. 
curl -s https://v.gd/create.php?format=simple^&url="%user_url%" >>"%c2c%"
type "%c2c%" && clip < "%c2c%" && echo. && echo. && curl qrenco.de/"%user_url%"
del /f /q "%c2c%" && pause >nul