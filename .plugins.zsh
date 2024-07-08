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

zinit light zimfw/environment
zinit light zimfw/input
zinit light zimfw/utility
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZP::gitignore
zinit snippet OMZP::pyenv
zinit snippet OMZP::docker
zinit for \
    if'[[ "$OSTYPE" == "darwin"* ]]' \
    OMZP::brew
zinit light-mode for \
    depth"1" \
    romkatv/powerlevel10k
zinit light marlonrichert/zsh-autocomplete

# wezterm integration
if [[ ${TERM_PROGRAM} == "WezTerm" ]]; then
  WEZTERM_SHELL_SKIP_SEMANTIC_ZONES=1 # skil OSC 133 and we set this by powerlevel10k
  zinit snippet https://github.com/wez/wezterm/blob/main/assets/shell-integration/wezterm.sh
fi
# iterm2 integration
if [[ ${TERM_PROGRAM} == "iTerm.app" ]]; then
  zinit snippet https://iterm2.com/shell_integration/zsh
fi

# Autosuggestions & fast-syntax-highlighting
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# zsh-autocomplete setting
# Wait with autocompletion until typing stops for a certain amount of seconds
zstyle ':autocomplete:*' delay 0.2  # seconds (float)

# Load Powerlevel10k config
source ~/.p10k.zsh
