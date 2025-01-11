# Quickly create a Windows coding environment for Node.js

win-code-node helps you get up and running quickly with Node.js on Windows.

## Installation
To install win-code-node, download the `bootstrap.bat` file from the GitHub repository and run it in the folder you want to become the root of your node development environment.

```
mkdir my-node
cd my-node
curl -OJ https://raw.githubusercontent.com/incharge/win-code-node/main/bootstrap.bat
.\bootstrap.bat
```

If the following error is displayed, then try disabling any anti-virus software that is blocking internet access e.g. `AVG WebShield`
```
curl: (35) schannel: next InitializeSecurityContext failed: CRYPT_E_NO_REVOCATION_CHECK (0x80092012) - The revocation function was unable to check revocation for the certificate.
```
## Start a node enabled bash shell and VS Code
Helper scripts are installed to the `win-code-node` subfolder.  
To start VS Code, from Windows Explorer or a command prompt run `win-code-node\vscode.bat`  
To start a bash shell, from Windows Explorer or a command prompt run `win-code-node\bash.bat`  

## Upgrade VScode
When VScode notifies that a new version is available:
- Close VScode
- Start a bash prompt
- Delete or rename `installers/VSCode-win32-x64.zip`
- Delete or rename `bin/vscode`
- Run `win-code-node/install-vscode.sh`

## What is installed?
win-code-node installs the following
- [Git-for-windows](https://github.com/git-for-windows/git), which includes bash
- [nvm](https://github.com/nvm-sh/nvm) - Node Version Manager
- [Node.js](https://nodejs.org)
- [VS Code](https://code.visualstudio.com/)
- win-code-node helper scripts
- Sample VS Code workspace file

## Why?
Node.js recommends WSL (Windows Subsystem for Linux), but [it also works with GitBash](https://github.com/nvm-sh/nvm#important-notes), which is easier to set up.

VS Code is the premier IDE for Windows, and it's free.

One of the many nice features of VS Code is its integrated terminals.  This allows multiple bash sessions to be run in windows  within the IDE. However, nvm takes a moment to start, which can be annoying. win-code-node starts a bash shell and loads nvm before starting VS Code.  So bash shells started within VS Code inherit the environment and there is no need to run nvm every time.

Apps are installed as portable. The installer turns the current folder into a bash home directory and software is installed to subfolders. Nothing is installed or changed above the current folder.  No registry settings are changed. The advantages of portable software are:
- Doesn't require any administrator priviledges. This avoids handing over complete control of your computer to some software downloaded from the Internet.
- The software and configuration can be backed up to & run from cloud storage or a memory stick.
- Different projects can have different versions and configurations.
- Quickly set up new team members
