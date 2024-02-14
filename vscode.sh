# Start vscode with the workspace in the home folder
#!/usr/bin/env bash

# Change to the home folder
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR/.."

if [ ! -f bin/vscode/Code.exe ];
then
	echo Install VS Code first.  See bootstrap.bat
	return
fi

echo Running VS Code with workspace: `ls *.code-workspace`
bin/vscode/Code.exe `ls *.code-workspace`
