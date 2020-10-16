#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

set -euxo pipefail

echo "\n${bold}Pulling remote conf${normal}"
git pull
git diff


confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure to apply the new dotfile conf? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

confirm &&

git commit -a -v &&

echo "\n${bold}Uploading conf${normal}" &&

git push origin master &&

echo "\n${bold}Copying zsh & oh-my-zsh conf${normal}"

cp zsh/.zshrc ~/.zshrc &&

cp zsh/custom.zsh-theme ~/.oh-my-zsh/custom/themes/ &&

zsh
