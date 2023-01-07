# p10 prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# env variables
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin/
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
