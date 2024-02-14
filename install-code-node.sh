#!/usr/bin/env bash

echo Installing node
nvm install node

if [ -f bin/vscode/Code.exe ];
then
	echo VS Code is already installed
else
	if [ -f installers/VSCode-win32-x64.zip ];
	then
		echo Using existing VScode archive
	else
		echo Downloading VS Code
		mkdir -p installers
		curl.exe --fail --location --output "installers/VSCode-win32-x64.zip" --url "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"
	fi

	echo Unzipping vscode
	unzip installers/VSCode-win32-x64.zip -d bin/vscode

	if [ -f *.code-workspace ];
	then
		echo Using existing VS Code workspace: `*.code-workspace`
	else
		echo Use win-code-node VS Code workspace template
		cp win-code-node/template.code-workspace ./this.code-workspace
	fi
fi

rem Start VS Code
source win-code-node/vscode.sh
