#!/bin/zsh

bold=$(tput bold)
normal=$(tput sgr0)

set -e

cd ~/.dotfiles

echo "\n${bold}> Pulling remote conf${normal}"
git pull; git diff

read response\?"${bold}> Are you sure to apply dotfile changes? [Y/n]${normal} "
if [[ "$response" =~ ^([nN][oO]|[nN])$ ]] ; then
    exit 0
else
    git commit -a -v

    echo "\n${bold}> Uploading conf${normal}"
    git push origin master

    echo "\n${bold}> Copying zsh & oh-my-zsh conf${normal}"
    cp -v zsh/.zshrc ~/.zshrc
    cp -v zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/

    echo "\n${bold}> Zsh configuration synchronized${normal}"
    zsh
fi

cd -