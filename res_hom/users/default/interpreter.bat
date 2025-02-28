setlocal EnableDelayedExpansion
:init
	set pl=5
	for /f "tokens=*" %%a in (users\%mnuser%\desktop) do (
		set /p x%pl%=<programs\%%a\launchprog
		set /a pl=%pl%+1
	)
:click
	if %errorlevel%==1 (
		set x=0
		set y=8
		for /f "tokens=*" %%a in (users\%mnuser%\desktop) do (
			set /p start=<programs\%%a\launchprog
			if %c1% geq %x% if %c1% leq %y% (
				call programs\%%a\%start%
			)
			set /a x=%x%+8
			set /a y=%y%+8
		)
	)
:premain
	set mx=5
:main
	if %errorlevel%==%mx% call !x%mx%!
	set /a mx=%mx%+1
	if defined x%mx% goto main
endlocal