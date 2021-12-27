chcp 1255
color f0
cls
@echo off
title 7z Password Retriever
copy "C:\Program Files\7-Zip\7z.exe"
SET PASS=0
:7z
cls
echo.
SET/P "NAME=File name  : "
IF "%NAME%"=="" goto ProblemDetected
goto GPATH
:ProblemDetected
echo Please enter file name.
pause
goto 7z
:GPATH
SET/P "PATH= (For example C:\Users\Admin\Desktop) enter full fath : "
IF "%PATH%"=="" goto PERROR
goto NEXT
:PERROR
echo Please enter path
pause
goto 7z
:NEXT
IF EXIST "%PATH%\%NAME%" GOTO SP
goto PATH
:PATH
cls
echo File not found Please make sure the name of the file you inserted includes an extension
pause
goto 7z
:SP
echo.
echo המסיס שפחמ...
echo.
:START
title Processing...
7z.exe x -p%PASS% "%PATH%\%NAME%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO NEXT
:NEXT
title Processing...
SET /A PASS=%PASS%+1
7z.exe x -p%PASS% "%PATH%\%NAME%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO NEXT
:FINISH
Del 7z.exe
cls
title 1 Password Found
echo.
echo File = %NAME%
echo Stable Password= %PASS%
echo.
echo Press any key to exit.
pause>NUL
exit
