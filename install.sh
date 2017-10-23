#!/usr/bin/env bash
set -e

# Regular dotfiles .vimrc, etc
DOTFILES="	.vimrc
			.zshrc
			.zsh
			.vsvimrc
			.tmux.conf
			.tmux
			.gitconfig
			.gdbinit
			.lldbinit
			.gitignore
			.ledgerrc"

# Configuration file in .config
CONFFILES="	.config/mpv"

for path in $DOTFILES; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/$path ~/$path
	fi
done


for path in $CONFFILES; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/$path ~/.config
	fi
done

mkdir -p ~/.vim/tmp/{backup,swap}

echo "Deploy done"
