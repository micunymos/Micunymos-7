@echo off
cls
set build=250225
mode 1000
set HOME=128000B
set PRO=128000B
set clr1=8;2;58;0;127
set clr2=8;2;180;180;180
set clr3=8;2;20;20;20
set clra1=8;2;100;120;140
set clra2=8;2;200;50;50
echo [4%clr1%;3%clr2%m
cd /d %~dp0
set return=1
goto start
:halt
	echo [0;0H
	pause >nul
	goto halt
:start
	cls
	echo [3%clr3%m
	echo [14;40H  ______________________________________________________________________________________________________________________
	echo [15;40H[4%clra1%m/ Micunymos 7 Installer                                                                                            [4%clra2%m^[ X ^][4%clra1%m \
	echo [16;40H[4%clra1%mI  __   __                                                                                                               I
	echo [17;40H[4%clra1%mI //_\ /_\\                                                                                                              I
	echo [18;40H[4%clra1%mI \\_/ \_//                                                                                                              I
	echo [19;40H[4%clr2%mI~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~I
	echo [20;40H[4%clr2%mI                                                                                                                        I
	echo [21;40H[4%clr2%mI                                                                                                                        I
	echo [22;40H[4%clr2%mI                                                                                                                        I
	echo [23;40H[4%clr2%mI                                                                                                                        I
	echo [24;40H[4%clr2%mI                                                                                                                        I
	echo [25;40H[4%clr2%mI                                                                                                                        I
	echo [26;40H[4%clr2%mI                                                                                                                        I
	echo [27;40H[4%clr2%mI                                                                                                                        I
	echo [28;40H[4%clr2%mI                                                                                                                        I
	echo [29;40H[4%clr2%mI                                                                                                                        I
	echo [30;40H[4%clr2%mI                                                                                                                        I
	echo [31;40H[4%clr2%mI                                                                                                                        I
	echo [32;40H[4%clr2%mI                                                                                                                        I
	echo [33;40H[4%clr2%mI                                                                                                                        I
	echo [34;40H[4%clr2%mI                                                                                                                        I
	echo [35;40H[4%clr2%mI                                                                                                                        I
	echo [36;40H[4%clr2%mI                                                                                                                        I
	echo [37;40H[4%clr2%mI                                                                                                                        I
	echo [38;40H[4%clr2%mI                                                                                                                        I
	echo [39;40H[4%clr2%mI                                                                                                                        I
	echo [40;40H[4%clr2%mI                                                                                                                        I
	echo [41;40H[4%clr2%m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo [3%clr3%m
	echo [20;41H Welcome to Micunymos 7!
	echo [21;41H ----------------------------------------------------------------------------------------------------------------------
	echo [22;41H Please use your W and S keys to select the type of installation you want to use!
	echo [23;41H ======================================================================================================================
	echo [24;41H I Select installation type . . .                                                                                   v I
	echo [25;41H ======================================================================================================================
	echo [0;0H
	choice /c ws /n
	if %errorlevel%==1 goto typ1
	if %errorlevel%==2 goto typ2
:typ1
	echo [23;41H ======================================================================================================================
	echo [24;41H I ^[ Micunymos 7 Home                                                                                               ^] I
	echo [25;41H I ------------------------------------------------------------------------------------------------------------------ I
	echo [26;41H I   Micunymos 7 Professional                                                                                         I
	echo [27;41H ======================================================================================================================
	echo [0;0H
	choice /c sx /n
	if %errorlevel%==1 goto typ2
	if %errorlevel%==2 (
		set itype=1
		goto i1
	)
:typ2
	echo [23;41H ======================================================================================================================
	echo [24;41H I   Micunymos 7 Home                                                                                                 I
	echo [25;41H I ------------------------------------------------------------------------------------------------------------------ I
	echo [26;41H I ^[ Micunymos 7 Professional                                                                                       ^] I
	echo [27;41H ======================================================================================================================
	echo [0;0H
	choice /c wx /n
	if %errorlevel%==1 goto typ1
	if %errorlevel%==2 (
		set itype=2
		goto i1
	)
:i1
	echo [0;0H[4%clr1%mMicunymos 7 Build %build%[4%clr2%m
	echo [20;41H Please choose a location which does not include any whitespace, to install Micunymos 7 to.
	echo [21;41H ----------------------------------------------------------------------------------------------------------------------
	echo [22;41H                                                                                                                       
	echo [23;41H ----------------------------------------------------------------------------------------------------------------------
	echo [24;41H Free space required:                                                                                                  
	echo [25;41H Micunymos 7 Basic:                                                                                            %HOME%
	echo [26;41H Micunymos 7 Professional:                                                                                     %PRO%
	echo [27;41H 
	set /p ist=[22;41H ^> 
	if not "%ist%" equ "%ist: =%" goto i1
	echo [0;0H
	md %ist%
	copy micunymos.bat %ist% >nul
	goto i2
:i2
	echo [20;41H Micunymos 7 is now going to install to                                                                                
	echo [20;80H %ist%.
	echo [21;41H ----------------------------------------------------------------------------------------------------------------------
	echo [22;41H Copying files . . .                                                                                                   
	echo [23;41H                                                                                                                       
	echo [24;41H ----------------------------------------------------------------------------------------------------------------------
	echo [25;41H [42m       [4%clr2%m                                                                                                               
	echo [26;41H ----------------------------------------------------------------------------------------------------------------------
	echo [27;41H                                                                                                                       
	echo [40;41H Copying boot files . . . I ntldr.cmd                                                                                  
	ping localhost -n 2 >nul
	echo [0;0H
	if %itype%==1 set mncd=%cd%\res_hom
	if %itype%==2 set mncd=%cd%\res_pro
	%ist:~0,1%:
	cd %ist%
	md boot >nul
	md mods >nul
	md main >nul
	md graphics >nul
	md programs >nul
	md programs\control >nul
	md programs\command >nul
	md graphics\res_generic >nul
	md graphics\res_1080 >nul
	md graphics\res_1440 >nul
	md users >nul
	md users\default >nul
	if %itype%==2 md sounds >nul
	if %itype%==2 md devices >nul
	%mncd:~0,1%:
	cd %mncd%
	copy programs\command %ist%\programs\command>nul
	copy programs\control %ist%\programs\control>nul
	copy boot\* %ist%\boot >nul
	copy ..\oobe %ist%\graphics\res_generic
	if %itype%==2 copy sounds %ist%\sounds>nul
	rename %ist%\graphics\res_generic\oobe bgd
	ping localhost -n 1 >nul
	echo [0;0H
	copy main\* %ist%\main >nul
	echo [25;41H [42m                           [4%clr2%m                                                                                           
	echo [40;41H Copying main files . . . I                                                                                            
	ping localhost -n 1 >nul
	echo [0;0H
	echo [25;41H [42m                                         [4%clr2%m                                                                             
	echo [40;41H Copying graphical files . . . I res_1440                                                                              
	ping localhost -n 1 >nul
	echo [0;0H
	copy graphics\res_1440\* %ist%\graphics\res_1440 >nul
	echo [25;41H [42m                                                            [4%clr2%m                                                          
	echo [40;41H Copying graphical files . . . I res_1080                                                                              
	ping localhost -n 1 >nul
	echo [0;0H
	copy graphics\res_1080\* %ist%\graphics\res_1080 >nul
	echo [25;41H [42m                                                                            [4%clr2%m                                          
	echo [40;41H Copying user creation files . . . I                                                                                   
	ping localhost -n 1 >nul
	echo [0;0H
	copy users\default\* %ist%\users\default >nul
	echo [20;41H Finished installing Micunymos 7                                                                                       
	echo [22;41H Copying files (DONE)
	echo [25;41H [42m                                                                                                                      [4%clr2%m
	echo [40;41H Starting OOBE . . .                                                                                                   
	goto i3
:i3
	ping localhost -n 3 >nul
	cd /d %~dp0
	oobe.bat
:eof