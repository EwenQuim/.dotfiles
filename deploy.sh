#!/bin/zsh

bold=$(tput bold)
normal=$(tput sgr0)

set -e

echo "\n${bold}> Pulling remote conf${normal}"
git pull;

read response\?"Are you sure? [y/N] "
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
    git commit -a -v

    echo "\n${bold}> Uploading conf${normal}"
    git push origin master

    echo "\n${bold}> Copying zsh & oh-my-zsh conf${normal}"
    cp zsh/.zshrc ~/.zshrc
    cp zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/
    zsh

    echo "\n${bold}> Everything is synchronized${normal}"
else
  exit 0
fi
