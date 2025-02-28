rem I see everything.
echo [s
setlocal EnableDelayedExpansion
set lp=%1
set pa=%2
set sa=%3
set rpt=0
set pae=0
if not defined lp echo Missing parameter. & goto eof
if not defined pa echo Missing parameter. & goto eof
if not defined sa echo Missing parameter. & goto eof
if "%lp%" equ "-ps" set pae=1 && set rpt=0
if "%lp%" equ "-rt" set pae=0 && set rpt=1
if "%lp%" equ "-pr" set pae=1 && set rpt=1
if "%lp%" equ "-nl" set pae=0 && set rpt=0
:reset
set exit=0
set first=1
set shc=
set wpp=%pa:~0,1%
set wps=%pa:~1,1%
set eap=%sa:~0,1%
if %sa:~0,1%==A set eap=a
if %sa:~0,1%==B set eap=b
if %sa:~0,1%==C set eap=c
if %sa:~0,1%==D set eap=d
if %sa:~0,1%==E set eap=e
if %sa:~0,1%==F set eap=f
set eas=%sa:~1,1%
if %sa:~1,1%==A set eas=a
if %sa:~1,1%==B set eas=b
if %sa:~1,1%==C set eas=c
if %sa:~1,1%==D set eas=d
if %sa:~1,1%==E set eas=e
if %sa:~1,1%==F set eas=f
:main
	if %rpt%==1 choice /t 1 /c x0 /n /d 0 >nul
	if %rpt%==1 if %errorlevel%==1 goto eof
	if %first%==1 (
		echo 0xXX 0xX0 0xX1 0xX2 0xX3 0xX4 0xX5 0xX6 0xX7 0xX8 0xX9 0xXA 0xXB 0xXC 0xXD 0xXE 0xXF
		set shc=0x%wpp%X
		set first=0
	)
	set shc=%shc% !0x%wpp%%wps%!
	if %wpp%%wps%==%eap%%eas% (
		if %rpt%==0 set wpp=0 &set wps=0 &set exit=1
		if %rpt%==1 echo [u
	)
	if %wps%==f (
		if not %wpp%==9 if not %wpp%==a if not %wpp%==b if not %wpp%==c if not %wpp%==d if not %wpp%==e if not %wpp%==f if not %wpp%==A if not %wpp%==B if not %wpp%==C if not %wpp%==D if not %wpp%==E if not %wpp%==F set /a wpp=%wpp%+1
		if %wpp%==f set wpp=0
		if %wpp%==e set wpp=f
		if %wpp%==d set wpp=e
		if %wpp%==c set wpp=d
		if %wpp%==b set wpp=c
		if %wpp%==a set wpp=b
		if %wpp%==9 set wpp=a
		if %wpp%==F set wpp=0
		if %wpp%==E set wpp=F
		if %wpp%==D set wpp=E
		if %wpp%==C set wpp=D
		if %wpp%==B set wpp=C
		if %wpp%==A set wpp=B
	)
	if not %wps%==a if not %wps%==b if not %wps%==c if not %wps%==d if not %wps%==e if not %wps%==f if not %wps%==A if not %wps%==B if not %wps%==C if not %wps%==D if not %wps%==E if not %wps%==F set /a wps=%wps%+1
	if %wps%==f set wps=0
	if %wps%==e set wps=f
	if %wps%==d set wps=e
	if %wps%==c set wps=d
	if %wps%==b set wps=c
	if %wps%==a set wps=b
	if %wps%==10 set wps=a
	if %wps%==F set wpp=0
	if %wps%==E set wpp=F
	if %wps%==D set wpp=E
	if %wps%==C set wpp=D
	if %wps%==B set wpp=C
	if %wps%==A set wpp=B
	if %exit%==1 (
		echo %shc%
		goto eof
	)
	if %wps%==0 (
		echo %shc%
		set shc=0x%wpp%X
	)
	goto main
:eof
if %pae%==1 pause >nul
endlocal