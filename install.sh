#!/usr/bin/env bash
set -e

# Regular dotfiles .vimrc, etc
DOTFILES="  .vimrc
	    .vim
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
	    .ledgerrc
	    scripts"

# Configuration file in .config
CONFFILES=" 
  alacritty
  autorandr
  beets
  i3
  mpv
  nvim
  waybar"


for path in $DOTFILES; do
      echo $path;
      if [ ! -h ~/$path ]; then
	    ln -vis ~/.dotfiles/$path ~/$path
      fi
done

mkdir -p ~/.config

for path in $CONFFILES; do
      echo .config/$path;
      if [ ! -h ~/.config/$path ]; then
	      ln -vis ~/.dotfiles/.config/$path ~/.config/$path
        echo "symlink to .config/$path created"
      else
        echo ".config/$path already exist"
      fi
done

mkdir -p ~/.vim/tmp/{backup,swap}

echo "Deploy done"
