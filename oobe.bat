@echo off
color 80
cd /d %~dp0
cls
goto main
:halt
	echo [0;0H
	pause >nul
	goto halt
:main
	type oobe
	echo [17;40H ________________________________________________________________________________________________________________________
	echo [18;40H [48;2;180;180;180m Micunymos Installer                                                                                                    [48;2;20;20;20m
	echo [19;40H [48;2;180;180;180m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~[48;2;20;20;20m
	echo [20;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [21;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [22;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [23;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [24;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [25;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [26;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [27;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [28;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [29;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [30;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [31;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [32;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [33;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [34;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [35;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [36;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [37;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [38;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [39;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [40;40H [48;2;180;180;180m                                                                                                                        [48;2;20;20;20m
	echo [41;40H [48;2;20;20;20m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~[48;2;180;180;180m
	echo [0;0H
	goto i1
:i1
	echo [20;41H Welcome! Let's set up some crucial options. Please select your resolution from the list below!                        
	echo [21;41H Use your W and S keys to navigate.                                                                                    
	echo [22;41H  ____________________________________________________________________________________________________________________
	echo [23;41H I   1920x1080p - Recommended                                                                                         I
	echo [24;41H I   2560x1440p - High                                                                                                I
	echo [25;41H  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo [0;0H
	goto o1
:o1
	echo [23;44H([23;158H)
	echo [24;44H [24;158H 
	echo [0;0H
	choice /c sx /n
	if %errorlevel%==1 goto o2
	if %errorlevel%==2 (
		set resolution=1
		goto wtoptions
	)
:o2
	echo [23;44H [23;158H 
	echo [24;44H([24;158H)
	echo [0;0H
	choice /c wx /n
	if %errorlevel%==1 goto o1
	if %errorlevel%==2 (
		set resolution=2
		goto wtoptions
	)
:wtoptions
	cd %ist%
	set setupbtn=2
	set launchswitchbtn=8
	echo resolution^=^%resolution%>options
	echo setupbtn^=^%setupbtn%>>options
	echo launchswitchbtn^=^%launchswitchbtn%>>options
	echo clr1^=^8;2;120;120;120>>options
	echo clr2^=^8;2;20;20;20>>options
	echo tskclr^=^8;2;180;180;180>>options
	echo xclr^=^8;2;20;20;20>>options
	echo step^=^2>>options
	goto usercreation
:usercreation
	echo [20;41H Welcome! Let's set up some crucial options. Please enter a username, and a password below.                           
	echo [21;41H Please do not include any whitespace (SPACE, TAB) in your username, and neither in your password.                    
	echo [23;41H I Username:                                                                                                          I
	echo [24;41H I Password:                                                                                                          I
	set /p username=[23;44HUsername ^> 
	echo [23;41H I Username: 
	set /p password=[24;44HPassword ^> 
	echo %username%>users\userlist
	md users\%username%
	type users\default\interpreter.bat>users\%username%\interpreter.bat
	echo. >users\%username%\NTUSER
	echo %password%>users\%username%\NTUSER
	echo command>users\%username%\desktop
	echo control>>users\%username%\desktop
:final
	echo [40;38;2;120;120;120m
	cls
	echo N o w   w e   w i l l   s t a r t   M i c u n y m o s   7   .   .   .
	ping localhost -n 5 >nul
	cd %ist%
	micunymos.bat
:eof