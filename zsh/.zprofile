# env variables
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin/
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# clear history
echo "" > ~/.zsh_history

# nvidia settings 
nvidia-settings --load-config-only
