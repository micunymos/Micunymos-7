@echo off
cls
cd /d %~dp0
title $boot\ntldr.mcu
goto init
:halt
	echo [0;0H
	pause >nul
	goto halt
:init
	echo [40;37m
	for /f "tokens=*" %%a in (..\options) do (
		set "%%a"
	)
	goto main
:main
	cls
	type ..\graphics\res_generic\bgd
	goto biosentercheck
:biosentercheck
	echo [32;33H Press %setupbtn% to enter Setup . . .
	choice /t 3 /c %setupbtn%m /n /d m >nul
	if %errorlevel%==1 goto bios
	goto launchoptioncheck
:launchoptioncheck
	echo [32;33H Press %launchswitchbtn% for Special launch options to be available . . .
	set nl=0
	choice /t 3 /c %launchswitchbtn%m /n /d m >nul
	if %errorlevel%==1 goto opt
	set nl=1
	goto launch
:bios
	cls
	goto o1
:o1
	echo [41m
	cls
	echo Micunymos Setup Utility
	echo [47;30mInformation[41;37m Boot Exit
	echo [47;30mNTLDR Version:                                                                                            0.1
	echo Virtual "RAM":                                                                                             0B
	echo Installed version:                                                                   Micunymos 7 Professional
	choice /c Dd /n /cs
	if %errorlevel%==1 goto o2
	if %errorlevel%==2 goto o2
:o2
	echo [41m
	cls
	echo Micunymos Setup Utility
	echo [41;37mInformation [47;30mBoot[41;37m Exit
	echo [47;30mBoot options:                                                                    nocursor, textmode, safemode
	echo Trigger key for setup:                       (W)                                                            %setupbtn%
	echo Trigger key for boot options:                (S)                                                            %launchswitchbtn%
	choice /c wasd /n
	if %errorlevel%==1 (
		set /p setupbtn=[3;19H - Enter a key to make the setup trigger! ^(0-9, A-Z^) ^> 
		goto o2
	)
	if %errorlevel%==2 goto o1
	if %errorlevel%==3 (
		set /p launchswitchbtn=[3;19H - Enter a key to make the boot option menu trigger! ^(0-9, A-Z^) ^> 
		goto o2
	)
	if %errorlevel%==4 goto o3
:o3
	echo [41m
	cls
	echo Micunymos Setup Utility
	echo [41;37mInformation Boot [47;30mExit[41;37m
	echo [47;30mDiscard changes and quit                     (W)                                                             
	echo -------------------------------------------------------------------------------------------------------------
	echo Save changes and quit                        (S)                                                             
	choice /c was /n
	if %errorlevel%==1 (
		goto init
	)
	if %errorlevel%==2 goto o2
	if %errorlevel%==3 (
		echo resolution^=^%resolution%>options
		echo setupbtn^=^%setupbtn%>>options
		echo launchswitchbtn^=^%launchswitchbtn%>>options
		goto main
	)
:opt
	echo [32;32HPlease enter your launch switch below.                                                               
	set /p lopt=[33;33H ^> 
	goto launch
:launch
	if %nl%==0 if not "%lopt%" equ "nocursor" if not "%lopt%" equ "textmode" goto opt
	set nc=0
	set tm=0
	set sm=0
	if "%lopt%" equ "nocursor" (
		set nc=1
	)
	if "%lopt%" equ "textmode" (
		set tm=1
	)
	cls
	title Micunymos 7
	call bootanim.bat
:eof