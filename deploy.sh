#!/bin/zsh

bold=$(tput bold)
normal=$(tput sgr0)
GREEN='\033[0;32m'

set -e

echo "\n${bold}> ZSH conf deployer${normal}"

cd ~/.dotfiles

echo "\n${bold}> Pulling remote conf${normal}"
git pull; git diff

read response\?"${bold}> Are you sure to apply dotfile changes? [Y/n]${normal} "
if [[ "$response" =~ ^([nN][oO]|[nN])$ ]] ; then
    exit 0
else
    read response\?"${bold}> Enter a commit message? [y/N]${normal} "
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
        git add -A; git commit;
    else
        git add -A; git commit -m "SYNC SYSTEM";
    fi

    echo "\n${bold}> Uploading conf${normal}"
    git push origin master

    echo "\n${bold}> Copying zsh & oh-my-zsh conf${normal}"
    cp -v zsh/.zshrc ~/.zshrc
    cp -v zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/

    echo "\n${bold}> ${GREEN}Zsh configuration synchronized${normal}"
    zsh
fi

cd -
