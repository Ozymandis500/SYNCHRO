@ECHO off
setlocal

SET "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""

FOR /f "usebackq delims=" %%I IN (`powershell %psCommand%`) DO SET  "path=%%I"

setlocal enabledelayedexpansion
ECHO %path%
endlocal
