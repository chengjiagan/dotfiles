# Install znap
# Download Znap, if it's not there yet.
ZNAP_ROOT=$XDG_DATA_HOME/znap
[[ -r $ZNAP_ROOT/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP_ROOT
source $ZNAP_ROOT/znap.zsh  # Start Znap

# Terminal integration
[[ "${TERM_PROGRAM}" = "WezTerm" ]] && \
    znap eval wezterm 'curl -fsSL https://github.com/wez/wezterm/blob/main/assets/shell-integration/wezterm.sh'
[[ "${TERM_PROGRAM}" = "iTerm.app" ]] && \
    znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# Starship prompt

# oh-my-zsh libraries and plugins
znap source ohmyzsh/ohmyzsh lib/{clipboard,completion} plugins/gitignore
(( $+commands[brew] )) && znap source ohmyzsh/ohmyzsh plugins/brew

# zimfw plugins
znap source zimfw/environment
znap source zimfw/input
znap source zimfw/utility

# eval
(( $+commands[starship] )) && znap eval starship 'starship init zsh'
(( $+commands[docker] )) && znap eval docker 'docker completion zsh'
(( $+commands[pyenv] )) && znap eval pyenv 'pyenv init -'
(( $+commands[pyenv-virtualenv] )) && znap eval pyenv-virtualenv 'pyenv virtualenv-init -'
(( $+commands[fzf] )) && znap eval fzf 'fzf --zsh'

# other plugins
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source Aloxaf/fzf-tab
znap source zdharma-continuum/fast-syntax-highlighting
