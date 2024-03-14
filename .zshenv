# XDG base dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# Editor
if [[ "${TERM_PROGRAM:-tty}" == *vscode* ]]; then
  export VISUAL="code --wait"
  export EDITOR="code --wait"
else
  export VISUAL=nvim
  export EDITOR=nvim
fi

# custom env
if [ -f "$HOME/.zshenv.custom" ]; then
  source "$HOME/.zshenv.custom"
fi
