## proxy setting
function pon() {
    if [[ -z "${PROXY+x}" ]]; then
        echo "PROXY is not set!"
        return
    fi

    export http_proxy=http://$PROXY
    export https_proxy=http://$PROXY
    export all_proxy=socks5://$PROXY
    export no_proxy=*.local,localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
}
function poff() {
    unset https_proxy http_proxy all_proxy no_proxy
}

## zsh config
if [[ ! -d $XDG_STATE_HOME/zsh ]]; then
    mkdir -p $XDG_STATE_HOME/zsh
fi
export HISTFILE="$XDG_STATE_HOME/zsh/history"
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

## Install and load plugins
source $HOME/.plugins.zsh

# Editor
if [[ "${TERM_PROGRAM:-tty}" == *vscode* ]]; then
  export VISUAL="code --wait"
  export EDITOR="code --wait"
else
  export VISUAL=vim
  export EDITOR=vim
fi

# local config
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

