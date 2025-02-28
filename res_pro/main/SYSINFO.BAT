set itype=2
set beta=1
set ver=250225
set update=Updates unavailable.
echo [32;64H
echo  __________________________________________________________________
echo ^|'System Information                                       ^\  X  ^/'^|
echo ^|^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^|
echo ^|  ___  _____                                                      ^|
echo ^| ^|   ^\^|___  ^|   Micunymos 7 EDIT                                  ^|
echo ^| ^| ^|^\ ^\  ^/ ^/                                                      ^|
echo ^| ^| ^| ^\ ^\^/ ^/                                                       ^|
echo ^| ^|_^|  ^\__^/                                                        ^|
echo ^|                                                                  ^|
echo ^|                Version: XXXXXX                                   ^|
echo ^|__________________________________________________________________^|
echo ^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"^"
if %itype%==1 (
	echo [37;29H Home
)
if %itype%==2 (
	echo [37;29H Professional
)
if %beta%==1 (
	echo [39;17H Shhh... Let's not leak our hard work...
	echo [40;18H BETA BUILD
)
if %beta%==0 (
	echo [39;17H This is a genuine copy of Micunymos 7
	echo [40;18H %update%
)
echo [42;27H %ver%
pause >nul