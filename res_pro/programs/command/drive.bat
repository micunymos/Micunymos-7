cd %prevcd%
set n=0
for /d %%a in (%1) do (
  set n=%n%+1
  if %n%==0 set b=%%a
)
%b%:
set prevcd=%CD%