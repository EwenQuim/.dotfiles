#!/bin/zsh

bold=$(tput bold)
normal=$(tput sgr0)

set -e

echo "\n${bold}> Pulling remote conf${normal}"
git pull; git diff

read response\?"${bold}> Are you sure to apply dotfile changes? [y/N] "
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
    git commit -a -v

    echo "\n${bold}> Uploading conf${normal}"
    git push origin master

    echo "\n${bold}> Copying zsh & oh-my-zsh conf${normal}"
    cp -v zsh/.zshrc ~/.zshrc
    cp -v zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/

    echo "\n${bold}> Everything is synchronized${normal}"
    zsh
else
  exit 0
fi
