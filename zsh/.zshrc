# The Fuck
eval $(thefuck --alias)
alias f='fuck'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

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
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

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


############
### PATH ###
############

# Custom bin commands
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:$HOME/.local/bin"

export DBURL="mongodb+srv://quimerch:RzTws2yIcGQhUd9p@quimtest.fcwwu.mongodb.net/minedb?retryWrites=true&w=majority"

# Deno
export DENO_INSTALL="/Users/ewen/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
# Go cli path
export PATH="$PATH:/usr/local/go/bin"

# Node
export PATH="/Users/ewen/.npm-global/bin:$PATH"

# Uses Starfish
eval "$(starship init zsh)"

