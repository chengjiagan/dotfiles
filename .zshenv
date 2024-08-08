# XDG base dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

# pyenv
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
fi

# local env
if [ -f "$XDG_CONFIG_HOME/zsh/local-zshenv.zsh" ]; then
    source "$XDG_CONFIG_HOME/zsh/local-zshenv.zsh"
fi
