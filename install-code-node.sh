#!/usr/bin/env bash

echo 'Installing node'
nvm install node

if [[ $# -eq 0 ]]
then
    # Install VS Code
    source win-code-node/install-vscode.sh

    # Start VS Code for the first time
    source win-code-node/vscode.sh
elif [[ "$1" == '--nocode' ]]
then
    # Start a bash shell for the first time
    bash
else
    echo "Invalid parameter: $1"
fi

