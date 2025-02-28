rem Erase from histrory . . . Forever gone.
set pa=%1
set sa=%2
set sy=%3
if not defined pa echo Missing parameter. & goto eof
if not defined sa echo Missing parameter. & goto eof
set wpp=%pa:~0,1%
set wps=%pa:~1,1%
set eap=%sa:~0,1%
if %sa:~0,1%==A set eap=a
if %sa:~0,1%==B set eap=b
if %sa:~0,1%==C set eap=c
if %sa:~0,1%==D set eap=d
if %sa:~0,1%==E set eap=e
if %sa:~0,1%==F set eap=f
set "var="
for /f "delims=0123456789" %%i in ("%sy:~0,1%") do set var=%%i
if defined var (if not %sy:~0,1%==a if not %sy:~0,1%==b if not %sy:~0,1%==c if not %sy:~0,1%==d if not %sy:~0,1%==e if not %sy:~0,1%==f if not %sy:~0,1%==A if not %sy:~0,1%==B if not %sy:~0,1%==C if not %sy:~0,1%==D if not %sy:~0,1%==E if not %sy:~0,1%==F set sy=00) else (if not %sy:~0,1% geq 0 if not %sy:~0,1% leq 9 set sy=00)
set eas=%sa:~1,1%
if %sa:~1,1%==A set eas=a
if %sa:~1,1%==B set eas=b
if %sa:~1,1%==C set eas=c
if %sa:~1,1%==D set eas=d
if %sa:~1,1%==E set eas=e
if %sa:~1,1%==F set eas=f
set "var="
for /f "delims=0123456789" %%i in ("%sy:~1,1%") do set var=%%i
if defined var (if not %sy:~1,1%==a if not %sy:~1,1%==b if not %sy:~1,1%==c if not %sy:~1,1%==d if not %sy:~1,1%==e if not %sy:~1,1%==f if not %sy:~1,1%==A if not %sy:~1,1%==B if not %sy:~1,1%==C if not %sy:~1,1%==D if not %sy:~1,1%==E if not %sy:~1,1%==F set sy=00) else (if not %sy:~1,1% geq 0 if not %sy:~1,1% leq 9 set sy=00)
:main
	if %sy% equ "" set 0x%wpp%%wps%=0x%wpp%%wps%
	if not %sy% equ "" set 0x%wpp%%wps%=0x%sy%
	if %wpp%%wps%==%eap%%eas% goto eof
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
	goto main
:eof