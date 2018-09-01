@echo off
:MAIN
ECHO.
ECHO ...............................................
ECHO Nintendo Switch Firmware Version Converter.
ECHO SELECT numbered option, or any other key to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - Convert short (X.Y.Z-B) to long version.
ECHO 2 - Convert long (v123456789) to short (X.Y.Z-B)
ECHO 3 - EXIT
ECHO.
set /p menu="Option: "
if "%menu%"=="1" GOTO SHORT
if "%menu%"=="2" GOTO LONG
exit

:SHORT
echo Please enter Firmware version format as follows:
echo X.Y.X-B
echo --------------------
set /p x="X Value: "
set /a x=%x%
set /p y="Y Value: "
set /a y=%y%
set /p z="Z Value: "
set /a z=%z%
set /p b="B Value: "
set /a b=%b%
echo Firmware number you entered: %x%.%y%.%z%-%b%
set /a firmware=(%X%*67108864)+(%Y%*1048576)+(%Z%*65536)+%b%
echo Firmware v%firmware%
pause
cls
goto MAIN

:LONG
echo Please enter Firmware version format as follows:
echo 123456789
echo --------------------
set /p firmware="v"
set /a firmware=%firmware%
echo Firmware number you entered: v%firmware%
set /a x=%firmware%/67108864
set /a y=(%firmware%/1048576)-(%x%*64)
set /a z=(%firmware%/65536)-(%x%*1024)-(%y%*16)
set /a b=(%firmware%)-(%X%*67108864)-(%Y%*1048576)-(%Z%*65536)
echo Firmware short version: %x%.%y%.%z%-%b%
pause
cls
goto MAIN