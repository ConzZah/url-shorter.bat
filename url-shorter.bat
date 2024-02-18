@echo off && title URL-Shorter_v0.2.3 [ConzZah] && rem done @ 17:58 am / 18.02.2024
set c2c=%tmp%\copylink2clipboard.txt
echo  PASTE LINK ^& PRESS ENTER : && echo. && set /p user_url=
echo. && echo [FETCHING SHORTLINK ^& QR-CODE..]
curl -s https://v.gd/create.php?format=simple^&url="%user_url%" >>"%c2c%"
cls && echo ~~~~~~~~~~~~~ && echo ORIGINAL URL: && echo %user_url% && echo.
echo ~~~~~~~~ && echo QR-CODE: && curl https://qrenco.de/"%user_url%"
echo ~~~~~~~~~~ && echo SHORTLINK: && type "%c2c%" && clip < "%c2c%" && del /f /q "%c2c%"
:saveprompt
echo. && echo. && echo ~~~~~~~~~~~~~~~~~~~~~~~ && echo SAVE QR-CODE AS .PNG ? && echo.
echo [1] + [ENTER] = YES && echo.
echo [ENTER] = NO && echo.
set /p saveprompt= 
if "%saveprompt%"=="1" goto saveqrcode
if not "%saveprompt%"=="1" goto end
:end
echo ~~~ PRESS [ENTER] TO EXIT. ~~~ && pause >nul && exit
:saveqrcode
set savefolder=url-shorter_QR-CODES
set savepath=%USERPROFILE%\Downloads\
cd "%savepath%" && if not exist "%savefolder%" mkdir "%savefolder%"  
cd "%savefolder%" && echo ~~~~~~~~~~~~~~~~~~~~~~~ && echo ENTER NAME FOR QR-CODE: && set /p saveqr_name=
curl -s http://api.qrserver.com/v1/create-qr-code/?data="%user_url%" -o "%saveqr_name%".png && echo.
echo [ QR-CODE SAVED AS: "%saveqr_name%.png" ] 
echo [ QR-CODE SAVED TO: "%cd%" ] && echo. && goto end