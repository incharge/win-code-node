@rem Create a new bash shell environment in the current folder using the git-for-windows bundled bash
@rem If the git installer is in the current folder, or the "installer" subfolder then it will be used, otherwise it will be downloaded.
@rem This is to avoid repeated large downloads when developing, testing and troubleshooting this batch file.
@echo off

setlocal

rem For available git-for-windows versions, see https://github.com/git-for-windows/git/releases/
set GITVERSION=2.30.1
rem set GITVERSION=2.43.0
set GITINSTALLERFILE=PortableGit-%GITVERSION%-64-bit.7z.exe

if exist "bin\git" (
	rem git-for-windows is already installed, so skip the download & installation
	goto gitisinstalled
)

if exist "%GITINSTALLERFILE%" (
	rem Use the git installer in the current folder
	set GITINSTALLERPATH=%GITINSTALLERFILE%
	echo Using existing git installer: %GITINSTALLERPATH%
	goto havegitinstaller
)

set GITINSTALLERPATH=installers\%GITINSTALLERFILE%
if exist "%GITINSTALLERPATH%" (
	echo Using existing git installer: %GITINSTALLERPATH%
	goto havegitinstaller
)

if exist "installers" (
	echo Using existing "installers" folder
) else (
	echo Creating folder "installers"
	mkdir "installers"
)
if not exist "installers" (
	echo Failed to create folder: "installers"
	exit /b
)

echo Downloading the git installer: %GITINSTALLERFILE%
curl.exe --fail --location --output "%GITINSTALLERPATH%" --url "https://github.com/git-for-windows/git/releases/download/v%GITVERSION%.windows.1/%GITINSTALLERFILE%"
if not exist "%GITINSTALLERPATH%" (
	echo Failed to download git
	exit /b
)
echo Successfully downloaded git installer
:havegitinstaller

echo Installing git
"%GITINSTALLERPATH%" -y "-obin\git"
:gitisinstalled

rem Create .bashrc
if not exist .bashrc (
	echo # This runs every time a bash shell starts that is not a login>> .bashrc
	echo # If this is a nested bash shell then exit, because settings are inherited,>> .bashrc
	echo # so there's no need to run .bashrc again>> .bashrc
	echo if [[ $SHLVL -ne 1 ]]; then>> .bashrc
	echo 	exit>> .bashrc
	echo fi>> .bashrc
)

rem Create the .ssh folder
if not exist .ssh (
	mkdir .ssh
)

rem Start a bash shell
set HOME=%cd%
bin\git\bin\bash
