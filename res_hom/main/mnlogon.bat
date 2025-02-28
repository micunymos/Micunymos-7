@echo off
cls
title $main\mnlogon.mcu
cd /d %~dp0
cd ..
type graphics\res_generic\bgd
:logon
	set "mnuser="
	set "mnpass="
	echo [0;0H
	echo  __________________________________________________________________________
	echo I - Log in -                                                             - I
	echo I~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~I
	echo I Username:                                                                I
	echo I ------------------------------------------------------------------------ I
	echo I Password:                                                                I
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	set /p mnuser=[5;13H
	if not "%mnuser%" equ "%mnuser: =%" goto logon
	set /p passwd=<users\%mnuser%\NTUSER
	set /p mnpass=[7;13H
	if not "%mnpass%" equ "%mnpass: =%" goto logon
	if "%mnpass%" equ "%passwd%" (
		call main\main.bat
	)
	goto logon