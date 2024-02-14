@rem Start the VS Code that was installed with win-code-node
@echo off

rem Change to the home folder
cd "%~dp0"
cd ..

rem Configure bash shell
set HOME=%cd%
set BASH_ENV=%HOME%/.bashrc

if not exist bin\git\bin\bash.exe (
	echo Install the win-code-node environment first. See bootstrap.bat
	exit /b
)

echo Starting a bash shell to run VS Code
bin\git\bin\bash -c "source win-code-node/vscode.sh"
