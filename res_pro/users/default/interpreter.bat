setlocal EnableDelayedExpansion
set ix=2
set iy=0
set kx=18
set ky=8
set repeated=0
for /f "tokens=*" %%a in (users\%mnuser%\desktop) do (
	set /p s%repeated%=<programs\%%a\launchprog
	if %x% geq %ix% if %x% leq %kx% if %y% geq %iy% if %y% leq %ky% call programs\%%a\!s%repeated%!
	set /a iy=%iy%+8
	set /a ky=%ky%+8
	if %repeated%==8 (
		set /a ix=%ix%+16
		set /a kx=%kx%+16
	)
	set /a repeated=%repeated%+1
)
endlocal