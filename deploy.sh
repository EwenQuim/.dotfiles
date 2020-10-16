#!/bin/bash

set -e

echo "> Pulling remote conf"
git pull;

read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
    git commit -a -v

    echo "> Uploading conf"
    git push origin master

    echo "\n${bold}> Copying zsh & oh-my-zsh conf${normal}"
    cp zsh/.zshrc ~/.zshrc
    cp zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/
    zsh

    echo "\n${bold}> Everything is synchronized${normal}"
else
  exit 0
fi
