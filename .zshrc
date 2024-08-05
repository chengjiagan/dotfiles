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
if [[ ! -d $XDG_STATE_HOME/zsh ]]; then
    mkdir -p $XDG_STATE_HOME/zsh
fi
export HISTFILE="$XDG_STATE_HOME/zsh/history"
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

# local config
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

## Install and load plugins
# Install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# not turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zimfw/environment \
    depth'1' romkatv/powerlevel10k \
    if'[[ ${TERM_PROGRAM} == "WezTerm" ]]' \
        https://github.com/wez/wezterm/blob/main/assets/shell-integration/wezterm.sh \
    if'[[ ${TERM_PROGRAM} == "iTerm.app" ]]' \
        https://iterm2.com/shell_integration/zsh \
    zdharma-continuum/fast-syntax-highlighting \
    atload'
        bindkey              "^I" menu-select;
        bindkey "$terminfo[kcbt]" menu-select;
        bindkey -M menuselect              "^I"         menu-complete;
        bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete;
        bindkey -M menuselect  "^[[D" .backward-char  "^[OD" .backward-char;
        bindkey -M menuselect  "^B"   .backward-char  "^[b"  .backward-word;
        bindkey -M menuselect  "^[[C"  .forward-char  "^[OC"  .forward-char;
        bindkey -M menuselect  "^F"    .forward-char  "^[f"   .forward-word;' \
        marlonrichert/zsh-autocomplete \

# turbo mode
zinit light-mode wait lucid for \
    zimfw/input \
    zimfw/utility \
    OMZP::gitignore \
    has'brew' OMZP::brew \
    blockf atload"zicompinit; zicdreplay" \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \

# Load Powerlevel10k config
source ~/.p10k.zsh
