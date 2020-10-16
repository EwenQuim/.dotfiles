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
git push origin master &&

cp zsh/.zshrc ~/.zshrc &&

cp zsh/custom.zsh-theme .oh-my-zsh/custom/themes/ &&

zsh
