#!/usr/bin/env bash
set -e

for path in .zshrc .zsh .vimrc .vim .vsvimrc .tmux.conf .tmux .gitconfig .gdbinit .lldbinit .gitignore; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/$path ~/$path
	fi
done

mkdir -p ~/.vim/tmp/{backup,swap}

echo "Deploy done"
