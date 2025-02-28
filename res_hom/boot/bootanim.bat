@echo off
cls
for /d %%a in (..\mods) do (
	call %%a
)
type ..\graphics\res_generic\bgd
ping localhost -n 3 >nul
if %tm%==1 ..\programs\command\micunymos.bat
if %tm%==0 call ..\main\mnlogon.bat