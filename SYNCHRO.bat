@ECHO off
CLS
REM                                                                                                                        BACKUP USING ROBOCOPY
REM                      																											by UNKNOWNENTITY
REM																																				v1.0
REM 	THE ROBOCOPY OPTION IS SET TO COPY ALL FILES ASWELL AS MODIFIED FILES AND DELECTED FILES ARE ALSO KEPT SAFE UNLESS YOU DELETE IT MANUALLY
REM 																							ANY BODY CAN MODIFY THE CODE FOR SUTING THE NEEDS
COLOR 0D

REM DEFAFULT FILE PATH IS SAVED IN "config.bat"
SET dirt=c:\SYNCHRO\

	CALL %dirt%\config.bat
	
SET LOCAL_NAME=%client%
SET SERVER_NAME= %server%

		:TEST
			REM PINGS THE SERVER TO MAKE SURE THE SERVER IS ONLINE.
			PING -n 1 %SERVER_NAME%
			
IF ERRORLEVEL 1 (
    GOTO RETRY
) ELSE (
    GOTO DOSTUFF
)

		:RETRY
			PING %SERVER_NAME% -n 11>NUL
			GOTO TEST

		:DOSTUFF
			CALL %dirt%\main.bat
			TIMEOUT 10
			EXIT
REM                                                                                                                        BACKUP USING ROBOCOPY
