# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="custom"
#ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	git
	github
	docker
	virtualenv
	golang
 	ssh-agent
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='micro'

# Load aliases
source ~/.dotfiles/.aliases

# Fuzzy Search uses `fd` instead of default `find`
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Git diff - need fzf and diff-so-fancy
,diff () {
    (cd $(git rev-parse --show-toplevel) && git diff $@ --color=always -- $(git diff $@ --name-only | fzf -m --ansi --preview "git diff $@ -- {-1} | delta" --preview-window=right:70%))
}

# Display in wsl
export DISPLAY=localhost:0.0 
export ENV=dev

setopt HIST_IGNORE_SPACE

############
### PATH ###
############

# Custom bin commands
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:$HOME/.local/bin"

# Deno
export DENO_INSTALL="~/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
# Go cli path
export PATH="$PATH:/usr/local/go/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Uses Starship
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/bin/google-cloud-sdk/path.zsh.inc' ]; then . '~/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '~/bin/google-cloud-sdk/completion.zsh.inc'; fi

# direnv
eval "$(direnv hook zsh)" 

# Go version manager

[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"

# Temp

