# Personal dotfiles

This repo includes my personal dotfiles.

## Install

Depend on `stow`:

```sh
stow . --no-folding
```

## SSH config

Add the following line to the end of `~/.ssh/config`:
```
Include ~/.config/sshconfig
```

## Git config

Add the following section to the end of `~/.gitconfig`:
```
[include]
	path = ~/.config/gitconfig
```