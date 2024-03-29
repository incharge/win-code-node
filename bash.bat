@rem Start the bash shell that was installed with win-code-node
@echo off

echo Running bash.bat

rem Change to the home folder
cd "%~dp0"
cd ..

rem Configure bash shell
set "HOME=%cd%"

if not exist bin\git\bin\bash.exe (
	echo Install the win-code-node environment first. See bootstrap.bat
	exit /b
)

echo Starting a bash shell
bin\git\bin\bash
