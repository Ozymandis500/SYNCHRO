TIMEOUT 5
COLOR 0B
SET dirt=c:\SYNCHRO\
REM GETS DATA FOR CONFIGURING TIME AND DATE FOR THE LOG FILE  \
SET CUR_YYYY=%date:~6,4%
SET CUR_MM=%date:~3,3%
SET CUR_DD=%date:~0,2%
SET CUR_HH=%time:~0,2%
	IF %CUR_HH% lss 10 (SET CUR_HH=0%time:~1,1%)	    
SET CUR_NN=%time:~3,2%
SET CUR_SS=%time:~6,2%
SET CUR_MS=%time:~9,2%
SET FL_NAME=%CUR_DD%%CUR_MM%%CUR_YYYY%_%CUR_HH%-%CUR_NN%-%CUR_SS%
SET TIMESTAMP=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
REM HANDS THE REST TO "config.bat" TO GET  DETAILS

	CALL %dirt%\config.bat
	
SET LOCAL_PATH= %c_path%
SET SERVER_PATH=%s_path%
SET LOG_FILE=%SERVER_PATH%\BACKUP_LOG


ECHO======================================================
ECHO BACKUP STARTED \
ECHO======================================================

REM ROBOCOPY IS USED FOR COPYING
ROBOCOPY %LOCAL_PATH%  %SERVER_PATH% /E /J /ETA /XD $RECYCLE.BIN "System Volume Information" /R:5 /W:3  /LOG+:%LOG_FILE%\BACKUP_%FL_NAME%.log /TEE
NET use %SERVER%\ipc$ /DEL

ECHO======================================================
ECHO BACKUP COMPLETED /
ECHO======================================================

ECHO ## Todays TIME Stamp %TIMESTAMP%
REM THE BACKUP FUNCTION ENDS HERE
ECHO.
REM SHOWS THE NAME OF THE CREATOR

ECHO======================================================
ECHO THE CODE WAS CREATED BY UNKNOWNENTITY
ECHO======================================================

REM AUTOMATICALLY OPENS THE LOG FILE AFTER THE BACKUP IS DONE 
START %LOG_FILE%\BACKUP_%FL_NAME%.log
