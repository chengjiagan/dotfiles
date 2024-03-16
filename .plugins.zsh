# Install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light marlonrichert/zsh-autocomplete
zinit light zimfw/environment
zinit light zimfw/input
zinit light zimfw/utility
zinit light zimfw/exa
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZP::gitignore
zinit for \
    if'[[ "$OSTYPE" == "darwin"* ]]' \
    OMZP::brew
zinit light-mode for \
    blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions
zinit light-mode for \
    depth"1" \
    romkatv/powerlevel10k
zinit light zdharma-continuum/fast-syntax-highlighting

# Prompt for spelling correction of commands.
ENABLE_CORRECTION=true
zinit snippet OMZL::correction.zsh

# wezterm integration
WEZTERM_SHELL_SKIP_SEMANTIC_ZONES=1 # skil OSC 133 and we set this by powerlevel10k
WEZTERM_SHELL_SKIP_CWD=1 # skip OSC 7 and we set this by omz's termsupport.zsh
zinit snippet https://github.com/wez/wezterm/blob/main/assets/shell-integration/wezterm.sh

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last plugin.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
zinit light zsh-users/zsh-autosuggestions

# zsh-autocomplete setting
# Wait with autocompletion until typing stops for a certain amount of seconds
zstyle ':autocomplete:*' delay 0.2  # seconds (float)
# Preserve Zsh-default keybindings
bindkey '^B' .backward-char
bindkey '^[[D' .backward-char
bindkey '^[OD' .backward-char
bindkey '^A' .beginning-of-line
bindkey '^E' .end-of-line
bindkey '^[b' .backward-word

# Load Powerlevel10k config
source ~/.p10k.zsh

