@echo off
setlocal EnableDelayedExpansion
:menu
	if %resolution%==1 echo [47;0H
	if %resolution%==2 echo [69;0H
	echo  _______________________________________________
	echo / ^|                                           ^| \
	if %resolution%==1 (
		echo [49;5H%mnuser%
		set escape=53
	)
	if %resolution%==2 (
		echo [71;5H%mnuser%
		set escape=75
	)
	echo ^|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^|
	echo ^| Programs              ^| Clear Screen           ^|
	echo ^| _____________________ ^| ---------------------- ^|
	echo ^| ^|                   ^| ^| System Information     ^|
	echo ^| ^|                   ^| ^| ---------------------- ^|
	echo ^| ^|                   ^| ^| Manage Users           ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|                        ^|
	echo ^| ^|                   ^| ^|        _____________   ^|
	echo ^| ^|                   ^| ^|       ^| Shut Down ^|^>^|  ^|
	echo ^| ^|                   ^| ^|        ""^"^"^"^"^"^"^"^"^"^"^"   ^|
	set loopos=1
	cd %pcd%
	del -_-
	ping localhost -n 0 >nul
	for /d %%A in (programs\*) do (
		echo %%~nxA>>.\-_-
	)
:makepvars
	for /f "skip=%loopos%" %%A in (.\-_-) do (
		set var%loopos%=%%A
	)
	if %loopos%==12 goto mdraw
	set /p p%loopos%=<programs\!var%loopos%!\launchprog
	set /a loopos+=1
	set /a escape+=1
	echo [%escape%;4H!p%loopos%!
	goto makepvars
:mdraw
	if not %nc%==1 (
		echo [%y%;%x%H[4%xclr%m[3%xclr%mI
		echo [4%clr1%;3%clr2%m
	)
	echo [0;0H
	choice /c xwasd0 /n
	if %errorlevel%==6 cls & main\main
:mlogic
	if not "%nc%"=="1" (
		if %resolution%==1 (
			set maxy=68
			set maxx=237
		)
		if %resolution%==2 (
			set maxy=89
			set maxx=318
		)
		set miny=0
		set minx=0
		set /a safeyn=%miny%+%step%
		set /a safexn=%minx%+%step%
		set /a safeyp=%maxy%-%step%
		set /a safexp=%maxx%-%step%
		if not %y% leq %safeyn% if %errorlevel%==2 set /a y=%y%-%step%
		if not %x% leq %safexn% if %errorlevel%==3 set /a x=%x%-%step%
		if not %y% geq %safeyp% if %errorlevel%==4 set /a y=%y%+%step%
		if not %x% geq %safexp% if %errorlevel%==5 set /a x=%x%+%step%
		echo [%y%;%x%H[4%clr1%m[3%clr1%mI
		echo [4%clr1%;3%clr2%m
	)
	if not %errorlevel%==1 goto menu
	goto logic
:loop
	set loopos=1
	if not defined p%loopos% goto logic
	if %loopos%==12 goto logic
	set /a loopos=%loopos%+1
	goto loop
:logic
	cd %pcd%
	if %nc%==1 (
		choice /c ce /n
		if %errorlevel%==1 main\main.bat
		if %errorlevel%==2 goto exit
	)
	if not %nc%==1 (
		if %resolution%==1 (
			if defined p1 if %x% geq 4 if %x% leq 23 if %y%==53 call %p1%
			if defined p2 if %x% geq 4 if %x% leq 23 if %y%==54 call %p2%
			if defined p3 if %x% geq 4 if %x% leq 23 if %y%==55 call %p3%
			if defined p4 if %x% geq 4 if %x% leq 23 if %y%==56 call %p4%
			if defined p5 if %x% geq 4 if %x% leq 23 if %y%==57 call %p5%
			if defined p6 if %x% geq 4 if %x% leq 23 if %y%==58 call %p6%
			if defined p7 if %x% geq 4 if %x% leq 23 if %y%==59 call %p7%
			if defined p8 if %x% geq 4 if %x% leq 23 if %y%==60 call %p8%
			if defined p9 if %x% geq 4 if %x% leq 23 if %y%==61 call %p9%
			if defined p10 if %x% geq 4 if %x% leq 23 if %y%==62 call %p10%
			if defined p11 if %x% geq 4 if %x% leq 23 if %y%==63 call %p11%
			if defined p12 if %x% geq 4 if %x% leq 23 if %y%==64 call %p12%
			if %x% geq 27 if %x% leq 50 if %y%==51 cls & main\main.bat
			if %x% geq 27 if %x% leq 50 if %y%==53 call main\sysinfo
			if %x% geq 27 if %x% leq 50 if %y%==55 call programs\control\usermgr
			if %x% geq 33 if %x% leq 44 if %y%==64 goto exit
			if %x% geq 45 if %x% leq 47 if %y%==64 (
				if %resolution%==1 (
					echo [59;46H ___________
					echo [60;46H^| Shut down ^|
					echo [61;46H^| Restart   ^|
					echo [62;46H^| Log off   ^|
					echo [63;46H ^"^"^"^"^"^"^"^"^"^"^"
				)
				if %resolution%==2 (
					echo [81;46H ___________
					echo [82;46H^| Shut down ^|
					echo [83;46H^| Restart   ^|
					echo [84;46H^| Log off   ^|
					echo [85;46H ^"^"^"^"^"^"^"^"^"^"^"
				)
				choice /c SRLC /n
				if %errorlevel%==3 (
				if %errorlevel%==1 goto exit
				if %errorlevel%==2 .\micunymos.bat
				if %errorlevel%==3 color 07&start cmd /c cd sounds^&logoff.vbs&main\mnlogon
				if %errorlevel%==4 goto draw
			)
		)
		if %resolution%==2 (
			if defined p1 if %x% geq 4 if %x% leq 23 if %y%==75 call %p1%
			if defined p2 if %x% geq 4 if %x% leq 23 if %y%==76 call %p2%
			if defined p3 if %x% geq 4 if %x% leq 23 if %y%==77 call %p3%
			if defined p4 if %x% geq 4 if %x% leq 23 if %y%==78 call %p4%
			if defined p5 if %x% geq 4 if %x% leq 23 if %y%==79 call %p5%
			if defined p6 if %x% geq 4 if %x% leq 23 if %y%==80 call %p6%
			if defined p7 if %x% geq 4 if %x% leq 23 if %y%==81 call %p7%
			if defined p8 if %x% geq 4 if %x% leq 23 if %y%==82 call %p8%
			if defined p9 if %x% geq 4 if %x% leq 23 if %y%==83 call %p9%
			if defined p10 if %x% geq 4 if %x% leq 23 if %y%==84 call %p10%
			if defined p11 if %x% geq 4 if %x% leq 23 if %y%==85 call %p11%
			if defined p12 if %x% geq 4 if %x% leq 23 if %y%==86 call %p12%
			if %x% geq 27 if %x% leq 50 if %y%==73 cls & main\main.bat
			if %x% geq 27 if %x% leq 50 if %y%==75 call main\sysinfo
			if %x% geq 27 if %x% leq 50 if %y%==77 call programs\control\usermgr
			if %x% geq 33 if %x% leq 44 if %y%==86 goto exit
			if %x% geq 45 if %x% leq 47 if %y%==86 (
				if %resolution%==1 (
					echo [59;46H ___________
					echo [60;46H^| Shut down ^|
					echo [61;46H^| Restart   ^|
					echo [62;46H^| Log off   ^|
					echo [63;46H ^"^"^"^"^"^"^"^"^"^"^"
				)
				if %resolution%==2 (
					echo [81;46H ___________
					echo [82;46H^| Shut down ^|
					echo [83;46H^| Restart   ^|
					echo [84;46H^| Log off   ^|
					echo [85;46H ^"^"^"^"^"^"^"^"^"^"^"
				)
				choice /c SRLC /n
				if %errorlevel%==1 goto exit
				if %errorlevel%==2 .\micunymos.bat
				if %errorlevel%==3 color 07&start cmd /c cd sounds^&logoff.vbs&main\mnlogon
				if %errorlevel%==4 goto draw
			)
		)
	)
	goto draw
:exit
	cd %pcd%
	cls
	start cmd /c cd sounds^&off.vbs
	ping localhost -n 5 >nul
	echo Logging off . . .
	ping localhost -n 1 >nul
	echo [0;0H
	echo Stopping services . . .
	echo.
	set clr1=
	set clr2=
	set xclr=
	set tskclr=
	set step=
	echo Logging off . . .
	echo.
	set mnuser=
	ping localhost -n 2 >nul
	cls
	echo [16;0H
	echo I                                       Shutting down . . .
	set setupbtn=
	set launchswitchbtn=
	set x=
	set y=
	ping localhost -n 3 >nul
	echo I                                       Exitting Micunymos 7 . . .
	set resolution=
	exit
:halt
	pause >nul
	goto halt
endlocal