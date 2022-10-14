#!/bin/zsh

bold=$(tput bold)
normal=$(tput sgr0)
GREEN='\033[0;32m'

echo "\n${bold}        ZSH conf deployer${normal}"

cd ~/.dotfiles

echo "\n${bold}> Pulling remote conf${normal}"
git pull; git diff

read response\?"${bold}> Are you sure to apply dotfile changes? [Y/n]${normal} "
if [[ "$response" =~ ^([nN][oO]|[nN])$ ]] ; then
    exit 0
else
  if [[ $1 != "server" ]] ;
  then
    read response\?"${bold}> Enter a commit message? [y/N]${normal} "
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
        git add -A; git commit; echo "Sync msg written"
    else
        git add -A; git commit -m "System sync"; echo "Sync msg written automatically"
    fi

    echo "\n${bold}> Uploading conf${normal}"
    git push origin master
  fi

    echo "\n${bold}> Linking zsh & oh-my-zsh conf${normal}"
    ln -s zsh/.zshrc ~/.zshrc
    ln -s zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/
    ln -s .gitconfig ~/.gitconfig

    echo "\n${bold}ZSH configuration synchronized ✅${normal}"
    source ~/.zshrc
fi

cd -
