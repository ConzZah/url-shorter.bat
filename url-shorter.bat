@echo off && title URL-Shorter_v0.2.2 [ConzZah] rem done @ 2:01 am / 17.02.2024
set c2c=%tmp%\copylink2clipboard.txt
echo  PASTE LINK ^& PRESS ENTER : && echo. && set /p user_url=
echo. && echo [FETCHING SHORTLINK ^& QR-CODE..] && echo.
curl -s https://v.gd/create.php?format=simple^&url="%user_url%" >>"%c2c%"
cls && type "%c2c%" && clip < "%c2c%" && del /f /q "%c2c%" && echo. && echo.
curl https://qrenco.de/"%user_url%"
:saveprompt
echo. && echo SAVE QR-CODE AS .PNG FILE ? &&echo.
echo [ENTER] = NO && echo.
echo [1] + [ENTER] = YES
set /p saveprompt= 
if "%saveprompt%"=="1" goto saveqrcode
if not "%saveprompt%"=="1" goto end
:end
echo. && echo PRESS [ENTER] TO EXIT. && pause >nul && exit
:saveqrcode
echo. && echo ENTER NAME FOR QR-CODE: && set /p saveqr_name=
curl -s http://api.qrserver.com/v1/create-qr-code/?data="%user_url%" -o "%saveqr_name%".png
echo [ QR-CODE SAVED AS: "%saveqr_name%.png" ] && goto end