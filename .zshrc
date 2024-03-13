## proxy setting
PROXY="127.0.0.1:7890"
function pon() {
    export http_proxy=http://$PROXY
    export https_proxy=http://$PROXY
    export all_proxy=socks5://$PROXY
    export no_proxy=*.local,localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
}
function poff() {
    unset https_proxy http_proxy no_proxy
}
# proxy on by default.
pon

## zsh config
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Prompt for spelling correction of commands.
setopt CORRECT
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}
# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

## Install and load plugins
source $HOME/.plugins.zsh

# alias
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

