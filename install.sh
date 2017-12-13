#!/usr/bin/env bash
set -e

# Regular dotfiles .vimrc, etc
DOTFILES="	.vimrc
			.zshrc
			.zshenv
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
CONFFILES="	mpv"

for path in $DOTFILES; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/$path ~/$path
	fi
done

mkdir -p ~/.config

for path in $CONFFILES; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/.config/$path ~/.config/$path
	fi
done

mkdir -p ~/.vim/tmp/{backup,swap}

echo "Deploy done"
