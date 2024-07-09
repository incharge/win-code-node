#!/usr/bin/env bash

if [ -f bin/vscode/Code.exe ];
then
	echo VS Code is already installed
	echo To re-install or upgrade, delete or rename: bin/vscode
else
	if [ -f installers/VSCode-win32-x64.zip ];
	then
		echo Installing existing VScode archive
		echo To upgrade, delete or rename: installers/VSCode-win32-x64.zip
	else
		echo Downloading VS Code
		mkdir -p installers
		curl.exe --fail --location --output "installers/VSCode-win32-x64.zip" --url "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"
	fi

	echo Unzipping vscode
	unzip installers/VSCode-win32-x64.zip -d bin/vscode

	if [ -f *.code-workspace ];
	then
		echo Using existing VS Code workspace: `ls *.code-workspace`
	else
		echo Use win-code-node VS Code workspace template
		cp win-code-node/template.code-workspace ./this.code-workspace
	fi
fi
