@echo off
cd %prevcd%
set originalname=%~1
set newname=%~2
:start
cls
setlocal enabledelayedexpansion
echo [41mCONFIRM RENAMEING OF %originalname% TO %newname%???[0m
set /p confirm=
if %confirm% equ "" goto start
if %confirm%==y rename %originalname% %newname% &&exit /b
if %confirm%==n exit /b
echo [101;31mY/N???[0m
goto start
endlocal