## proxy setting
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
export HISTFILE="$XDG_STATE_HOME/zsh/history"
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Editor
if [[ "${TERM_PROGRAM:-tty}" == *vscode* ]]; then
  export VISUAL="code --wait"
  export EDITOR="code --wait"
else
  export VISUAL=nvim
  export EDITOR=nvim
fi

## Install and load plugins
source $HOME/.plugins.zsh

# alias
alias vim="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

