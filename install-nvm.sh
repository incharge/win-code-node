#!/usr/bin/env bash

# See https://github.com/nvm-sh/nvm
NVM_VERSION=v0.39.5

echo Installing nvm
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash

# Initialisation commands are added to .bashrc, so exit this shell and start a new one before running nvm
