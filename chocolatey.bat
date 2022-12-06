@echo OFF

NET SESSION >nul 2>&1

IF %ERRORLEVEL% EQU 0 (

   ECHO.

) ELSE (

   ECHO.-----------------------------------------------------------------

   ECHO ERROR: YOU NEED TO RUN THIS SCRIPT WITH ADMINISTRATOR PRIVILEGES.

   ECHO.-----------------------------------------------------------------

   PAUSE

   EXIT /B 1

)

CLS

ECHO ..........................................
ECHO "Chocolatey Batch Installer made by Gixo"

:MENU
ECHO ...........................................
ECHO SELECT ACTION:
ECHO ...........................................
ECHO.
ECHO 1 - Install apps
ECHO 2 - Upgrade apps
ECHO 3 - Exit
ECHO ...........................................


SET /P M=Type 1, 2 or 3 then press ENTER:
IF %M%==1 GOTO INS
IF %M%==2 GOTO UPG
IF %M%==3 GOTO EXT

:INS
setlocal EnableDelayedExpansion

SET i=0
FOR /F %%a IN (%~dp0\packages.txt) do (
   SET /A i+=1
   SET array[!i!]=%%a
)
SET n=%i%

FOR /L %%i IN (1,1,%n%) DO choco install !array[%%i]! -y

ECHO .....................
ECHO Installation is done.
ECHO .....................
PAUSE
CLS
GOTO MENU

:UPG
choco upgrade all
ECHO ..................
ECHO Upgrading is done.
ECHO ..................
PAUSE
CLS
GOTO MENU


:EXT
EXIT