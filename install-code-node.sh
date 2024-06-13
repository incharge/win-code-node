#!/usr/bin/env bash

echo Installing node
nvm install node

./install-vscode.sh

rem Start VS Code
source win-code-node/vscode.sh
