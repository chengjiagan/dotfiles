# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Update PATH
export PATH="$HOME/.local/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# OMZ Settings

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  # OMZ plugins
  brew direnv docker eza fzf git gitignore
  iterm2 ssh ssh-agent zoxide
  # third-party plugins
  zsh-autosuggestions
  zsh-syntax-highlighting
  autoupdate
)

# Plugins Setting

# eza plugin
# If yes, directories will be grouped first. 
zstyle ':omz:plugins:eza' 'dirs-first' yes

# ssh-agent plugin
# Slient the plugin to avoid powerlevel10k complaining
zstyle :omz:plugins:ssh-agent quiet yes
# NOT load any identities on start
zstyle :omz:plugins:ssh-agent lazy yes
# Enable agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding yes

# iterm2 plugin
# Apply iTerm2 shell integration script
zstyle :omz:plugins:iterm2 shell-integration yes

# zsh-completions plugin
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

# Load local plugin setting
[[ ! -f ~/.config/zsh/local-plugin.zsh ]] || source ~/.config/zsh/local-plugin.zsh

source $ZSH/oh-my-zsh.sh

# User configuration
if (( $+commands[nvim] )); then
  export VISUAL="nvim"
  export EDITOR="nvim"
  alias vi="nvim"
  alias vim="nvim"
  alias view="nvim -R"
  alias vimdiff="nvim -d"
fi

# Load powerlevel10k theme setting
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load local setting
[[ ! -f ~/.config/zsh/local-zshrc.zsh ]] || source ~/.config/zsh/local-zshrc.zsh
