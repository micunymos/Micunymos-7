@echo off
cd /d %~dp0
cd ..\..
echo [47;30m[20;40H __________________________________________________________________________________________________
echo [21;40HI - User manager -                                                                          - I
echo [22;40HI~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~I
echo [23;40HI What action do you want to perform?                                                         I
echo [24;40HI ^[ ADD                                                                                     ^] I
echo [25;40H~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
choice /c sx /n
if %errorlevel%==1 goto o2
if %errorlevel%==2 goto add
:o1
	echo [24;40HI ^[ ADD                                                                                     ^] I
	choice /c sx /n
	if %errorlevel%==1 goto o2
	if %errorlevel%==2 goto add
:o2
	echo [24;40HI ^[ REMOVE                                                                                  ^] I
	choice /c wx /n
	if %errorlevel%==1 goto o1
	if %errorlevel%==2 goto remove
:add
	set username=
	echo [23;40HI Please enter the name of the user you want to add!
	echo [24;40HI                                                                                         I
	set /p username=[24;42H^> 
	echo [23;40HI Please enter a password for the user to be created.
	echo [24;40HI                                                                                         I
	set /p passmn=[24;42H^> 
	if "%username%"=="" goto add
	if not %username%==%username: =% goto add
	if %username%==default goto add
	if exist users\%username% rd users\%username%
	echo %username%>users\userlist
	md users\%username%
	type users\default\interpreter.bat>users\%username%\interpreter.bat
	echo. >users\%username%\NTUSER
	echo %password%>users\%username%\NTUSER
	echo command>users\%username%\desktop
	echo control>>users\%username%\desktop
	goto eof
:remove
	set username=
	echo [23;40HI Please enter the name of the user you want to remove!
	echo [24;40HI                                                                                         I
	set /p username=[24;42H^> 
	if "%username%"=="" goto remove
	if not %username%==%username: =% goto remove
	if %username%==default goto remove
	if not exist users\%username% goto remove
	for /f "tokens=*" %%a in (users\userlist) do (
		if not %%a==%username% echo %%a>users\tmp
	)
	del users\userlist
	ren users\tmp userlist
	del users\%username%\buttons
	del users\%username%\interpreter.bat
	del users\%username%\NTUSER
	del users\%username%\desktop
	rd users\%username%
	goto eof
:eof