#!/usr/bin/env bash
set -e
set -o verbose

for path in .zshrc .zsh .vimrc .vim .tmux.conf .tmux .gitconfig .gdbinit .gitignore; do
	echo $path;
	if [ ! -h ~/$path ]; then
		ln -vis ~/.dotfiles/$path ~/$path
	fi
done

echo "Deploy done"
