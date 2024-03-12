# Proxy setting
PROXY="127.0.0.1:7890"
function pon() {
    export https_proxy=http://$PROXY http_proxy=http://$PROXY all_proxy=socks5://$PROXY
    export NO_PROXY=localhost,127.0.0.1,192.168.3.0/24
}
function poff() {
    unset https_proxy http_proxy all_proxy
}
# Proxy on by default.
pon

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# detect OS from https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
if [[ "$OSTYPE" == "darwin"* ]]; then # macOS specific setting

# GNU command line tools
tools=()
for t in ${tools[@]}; do
    export PATH="/opt/homebrew/opt/$t/libexec/gnubin:$PATH"
done

# Add ssh key to ssh-agent
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 &> /dev/null

fi # macOS specific setting

# auto install zcomet
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# load plugins
zcomet load ohmyzsh
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/gitignore
zcomet load ohmyzsh plugins/fzf
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/zoxide
if [[ "$OSTYPE" == "darwin"* ]]; then # macOS specific setting
zcomet load ohmyzsh plugins/brew
fi # macOS specific setting
zcomet load zsh-users/zsh-completions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load romkatv/powerlevel10k

# compile
zcomet compinit

# for powerlevel10k
source ~/.p10k.zsh

# Alias
alias ls="lsd --icon=never"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

