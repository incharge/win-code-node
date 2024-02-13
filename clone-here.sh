# Clone the given repo in the current directory
# Inspired by: https://stackoverflow.com/questions/5377960/git-whats-the-best-practice-to-git-clone-into-an-existing-folder
#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo Error: Usage is: $(basename "$0") git@github.com:[account]/[repo].git
    return 1
fi

if [ -d ".git" ]; then
  echo Error: .git directory already exists
  return
fi

echo cloning $1 into `pwd`
return
git init
git remote add origin "$1"
git fetch origin
git checkout -b main --track origin/main
git submodule update --init --recursive --remote
