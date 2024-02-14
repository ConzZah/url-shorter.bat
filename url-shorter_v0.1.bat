@echo off && title url-shorter_v0.1 && color 0a
set c2c=%tmp%\copylink2clipboard.txt
if exist "%c2c%" del /f /q "%c2c%"
echo PASTE URL : && echo. && set /p user_url=
cls && echo # [GENERATING SHORTLINK..] && echo. 
curl -s https://v.gd/create.php?format=simple^&url="%user_url%" >>"%c2c%"
type "%c2c%" && clip < "%c2c%" && echo. && echo. && echo # [LINK COPIED TO CLIPBOARD.] && pause >nul