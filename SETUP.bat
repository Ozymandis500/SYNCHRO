@ECHO off
CLS
COLOR 06
SET default=%~dp0

MKDIR "c:\SYNCHRO"

XCOPY "%default%\"  "c:\SYNCHRO\"      /F

MKDIR "c:\SYNCHRO\Containers"

CALL shortcutJS.bat -linkfile "%userprofile%\Desktop\SYNCHRO.lnk" -target  "c:\SYNCHRO\SYNCHRO.bat" -iconlocation  "c:\SYNCHRO\icon.ico"
CALL shortcutJS.bat -linkfile "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\SYNCHRO.lnk" -target  "c:\\SYNCHRO\SYNCHRO.bat" -iconlocation  "c:\SYNCHRO\icon.ico"
TIMEOUT 5
CALL "c:\SYNCHRO\SYNCHRO.bat"

