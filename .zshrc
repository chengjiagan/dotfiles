# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Completion for SSH based on ~/.ssh/config
zstyle ':completion:*:ssh:argument-1:'       tag-order  hosts users
zstyle ':completion:*:scp:argument-rest:'    tag-order  hosts files users
zstyle ':completion:*:(ssh|scp|rdp):*:hosts' hosts

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=($HOME/.local/bin $path)

# Export environment variables.
export GPG_TTY=$TTY
if [[ "${TERM_PROGRAM:-tty}" == *vscode* ]]; then
    # Use vscode editor when in vscode term.
    export VISUAL="code --wait"
    export EDITOR="code --wait"
else
    # Use nvim by default
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

# Source additional local files if they exist.
z4h source ~/.config/zsh/local-zshrc.zsh

# Use additional Git repositories pulled in with `z4h install`.
z4h load ohmyzsh/ohmyzsh/plugins/brew

# Autoload functions.
autoload -Uz zmv
# Enable external command editor
autoload -z edit-command-line
zle -N edit-command-line

# Define key bindings.
z4h bindkey edit-command-line "Ctrl+X Ctrl+E" # edit command in external editor

# Define aliases.
alias ls="lsd"
alias ll="ls -lh"       # long format and human-readable sizes
alias la="ll -A"        # long format, all files
alias lr="ls --tree"    # long format, recursive as a tree
alias lx="ll -X"        # long format, sort by extension
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
alias lvim="NVIM_APPNAME=nvim-lazyvim nvim" # LazyVim

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# Enable zoxide
eval "$(zoxide init zsh)"
