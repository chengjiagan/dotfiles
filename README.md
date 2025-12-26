# Personal dotfiles

This repo includes my personal dotfiles.

## Dependencies

```
git zsh stow zoxide fzf direnv eza
```

## Install

Depend on `stow`:

```sh
./install/install-omz.sh
stow -d config -t $HOME --no-folding .
```

## SSH config

Add the following line to the end of `~/.ssh/config`:
```
Include ~/.config/sshconfig
```
