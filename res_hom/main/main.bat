@echo off
set return=0
:start
	if %extcrstrue%==1 (
		for /f "tokens=*" %%a in (..\mods\crs) do (
			set "%%a"
		)
	)
	setlocal enabledelayedexpansion
	cd /d %~dp0
	cd ..
	set pcd=%CD%
	title Micunymos 7
	for /f "tokens=*" %%a in (options) do (
		set %%a
	)
	if not %nc%==1 (
		set /a x=%step%+1
		set /a y=%step%+1
	)
	echo [4%clr1%;3%clr2%m
	cls
	goto main
:halt
	echo [0;0H
	pause >nul
	goto halt
:main
	if %resolution%==1 (
		echo [4%clr1%m
		echo [0;0H
		type graphics\res_1080\bgd
		echo [4%tskclr%m
		echo [64;0H
		type graphics\res_1080\taskbar
		echo [0;0H
	)
	if %resolution%==2 (
		echo [4%clr1%m
		echo [0;0H
		type graphics\res_1440\bgd
		echo [4%tskclr%m
		echo [86;0H
		type graphics\res_1440\taskbar
		echo [0;0H
	)
	echo [4%clr1%m
	set repeated=0
	set offset=0
	for /f "tokens=*" %%a in (users\%mnuser%\desktop) do (
		if %repeated%==8 (
			set repeated=0
			set offset=%offset%+18
		)
		for /f "tokens=*" %%i in (programs\%%a\dskicon) do (
			echo [%offset%C%%i
		)
		echo.
		set /a repeated=%repeated%+1
	)
	set repeated=
	set offset=
:cursor
	if not %nc%==1 (
		echo [%y%;%x%H[4%xclr%m[3%xclr%mI
		echo [4%clr1%;3%clr2%m
	)
	echo [0;0H
	choice /c xwasd0 /n
	if %errorlevel%==1 call users\%mnuser%\interpreter.bat
	if not "%nc%"=="1" (
		if %resolution%==1 (
			set maxy=68
			set maxx=237
		)
		if %resolution%==2 (
			set maxy=90
			set maxx=318
		)
		set miny=0
		set minx=0
		set /a safeyn=%miny%+%step%+1
		set /a safexn=%minx%+%step%+1
		set /a safeyp=%maxy%-%step%-1
		set /a safexp=%maxx%-%step%-1
		if not %y% leq %safeyn% if %errorlevel%==2 set /a y=%y%-%step%
		if not %x% leq %safexn% if %errorlevel%==3 set /a x=%x%-%step%
		if not %y% geq %safeyp% if %errorlevel%==4 set /a y=%y%+%step%
		if not %x% geq %safexp% if %errorlevel%==5 set /a x=%x%+%step%
		echo [%y%;%x%H[4%clr1%m[3%clr1%mI
		echo [4%clr1%;3%clr2%m
	)
	if %errorlevel%==6 call main\menu.bat
	echo [0;0H
	goto main
;