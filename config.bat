@ECHO off
SET config=c:\SYNCHRO\


IF EXIST %config%\Containers\*.inf (
GOTO EXISTING
) ELSE (
GOTO NEW
 )
		:EXISTING
			REM USES THE EXIXTING SAVED DATAS FROM THE .INF FILE
			FOR /F "delims=|" %%f   IN (%config%\Containers\client.inf) DO SET client=%%f
			FOR /F "delims=|" %%g  IN (%config%\Containers\server.inf) DO SET server=%%g
			FOR /F "delims=|" %%h  IN (%config%\Containers\client_path.inf) DO SET c_path=%%h
			FOR /F "delims=|" %%i   IN (%config%\Containers\server_path.inf) DO SET s_path=%%i
			GOTO END



		:NEW
			REM CALLS FOR ENTRING THE CLIENT SYSTEM NAME OR IP ADDRESS
			ECHO ENTRE THE CLIENT SYSTEM NAME OR IP ADDRESS
			CALL %config%\com_name.bat
			SET client=%COM_NAME%
			ECHO %client%>>%config%\Containers\client.inf
			REM CALL FOR ENTERING THE SERVER SYSTEM NAME OR IP ADDRESS 
			ECHO ENTRE THE SERVER SYSTEM NAME OR IP ADDRESS
			CALL %config%\com_name.bat
			SET server=%COM_NAME%
			ECHO %server%>>%config%\Containers\server.inf
			REM ASKES FOR THE NETWORK ATTACHED CLIENT DIRECTORY	
			ECHO WHERE IS THE CLIENT SIDE DIRECTORY TO BE BACK UP FROM
			@FOR /F "tokens=*" %%i IN ('%config%\Path_Finder.bat') DO SET link=%%i
			SET c_path=%link%
			ECHO %c_path%>>%config%\Containers\client_path.inf
			 REM ASKES FOR THE NETWORK ATTACHED SERVER DIRECTORY
			ECHO WHERE IS THE SERVER SIDE DIRECTORY TO BE BACK UP ONTO
			@FOR /F "tokens=*" %%i IN ('%config%\Path_Finder.bat') DO SET link=%%i
			SET s_path=%link%
			ECHO %s_path%>>%config%\Containers\server_path.inf

		:END
