@echo off
SET THEFILE=c:\users\christ~1\desktop\proyecto\antes de quitar of.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o "c:\users\christ~1\desktop\proyecto\antes de quitar of.exe" link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
