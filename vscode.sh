# Start vscode with the workspace in the crrent folder
#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR/.."
bin/vscode/Code.exe `ls *.code-workspace`
