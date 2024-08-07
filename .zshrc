## proxy setting
function _pon() {
    export http_proxy=http://$PROXY
    export https_proxy=http://$PROXY
    export all_proxy=socks5://$PROXY
    export no_proxy=*.local,localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
}
function pon() {
    if (( ! $+PROXY )); then
        echo "PROXY is not set!" >&2
        return
    fi
    _pon
}
function poff() {
    unset https_proxy http_proxy all_proxy no_proxy
}
# set var in .zshenv.local if need proxy on by default
if (( $+DEFAULT_PROXY_ON && $+PROXY )); then
    _pon
fi

## zsh config
[[ ! -d $XDG_STATE_HOME/zsh ]] && mkdir -p $XDG_STATE_HOME/zsh
HISTFILE="$XDG_STATE_HOME/zsh/history"
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Editor
if (( $+commands[nvim] )); then
    alias vi="nvim"
    alias vim="nvim"
    alias view="nvim -R"
    alias vimdiff="nvim -d"
fi
if [[ "${TERM_PROGRAM:-tty}" == *vscode* ]]; then
    export VISUAL="code --wait"
    export EDITOR="code --wait"
else
    export VISUAL=vim
    export EDITOR=vim
fi

# Alias
alias la="ls -al"

# local config
[[ -f "$XDG_CONFIG_HOME/zsh/local-zshrc.zsh" ]] && \
    source "$XDG_CONFIG_HOME/zsh/local-zshrc.zsh"

# Plugins
[[ -f "$XDG_CONFIG_HOME/zsh/plugins.zsh" ]] && \
    source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
