fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"

# plugins oh-my-zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# personal aliases
alias cat="bat"
alias catn="/usr/bin/cat"
alias ls="lsd --group-directories-first"
alias lsn="/usr/bin/ls --color=tty --group-directories-first"
alias dotfiles="cd ~/dotfiles/"
alias config="cd ~/.config/"
alias builds="cd ~/builds/"
alias ...="../.."
alias ....="../../.."

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# oh-my-posh prompt
eval "$(oh-my-posh init zsh --config ~/.theme.json)"
