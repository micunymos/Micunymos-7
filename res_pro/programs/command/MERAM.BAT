:main
set /p "addr=addr 0x"
if "%addr%" equ "exit" goto eof
set "var="
for /f "delims=0123456789" %%i in ("%addr:~0,1%") do set var=%%i
if defined var (if not %addr:~0,1%==a if not %addr:~0,1%==b if not %addr:~0,1%==c if not %addr:~0,1%==d if not %addr:~0,1%==e if not %addr:~0,1%==f if not %addr:~0,1%==A if not %addr:~0,1%==B if not %addr:~0,1%==C if not %addr:~0,1%==D if not %addr:~0,1%==E if not %addr:~0,1%==F set addr=00) else (if not %addr:~0,1% geq 0 if not %addr:~0,1% leq 9 set addr=00)
set "var="
for /f "delims=0123456789" %%i in ("%addr:~0,1%") do set var=%%i
if defined var (if not %addr:~1,1%==a if not %addr:~1,1%==b if not %addr:~1,1%==c if not %addr:~1,1%==d if not %addr:~1,1%==e if not %addr:~1,1%==f if not %addr:~1,1%==A if not %addr:~1,1%==B if not %addr:~1,1%==C if not %addr:~1,1%==D if not %addr:~1,1%==E if not %addr:~1,1%==F set addr=00) else (if not %addr:~1,1% geq 0 if not %addr:~1,1% leq 9 set addr=00)
set /p "vlue=vlue 0x%addr:~0,2% - 0x"
set "var="
for /f "delims=0123456789" %%i in ("%vlue:~0,1%") do set var=%%i
if defined var (if not %vlue:~0,1%==a if not %vlue:~0,1%==b if not %vlue:~0,1%==c if not %vlue:~0,1%==d if not %vlue:~0,1%==e if not %vlue:~0,1%==f if not %vlue:~0,1%==A if not %vlue:~0,1%==B if not %vlue:~0,1%==C if not %vlue:~0,1%==D if not %vlue:~0,1%==E if not %vlue:~0,1%==F set vlue=00) else (if not %vlue:~0,1% geq 0 if not %vlue:~0,1% leq 9 set vlue=00)
set "var="
for /f "delims=0123456789" %%i in ("%vlue:~0,1%") do set var=%%i
if defined var (if not %vlue:~1,1%==a if not %vlue:~1,1%==b if not %vlue:~1,1%==c if not %vlue:~1,1%==d if not %vlue:~1,1%==e if not %vlue:~1,1%==f if not %vlue:~1,1%==A if not %vlue:~1,1%==B if not %vlue:~1,1%==C if not %vlue:~1,1%==D if not %vlue:~1,1%==E if not %vlue:~1,1%==F set vlue=00) else (if not %vlue:~1,1% geq 0 if not %vlue:~1,1% leq 9 set vlue=00)
set 0x%addr:~0,2%=0x%vlue:~0,2%
goto main
:eof