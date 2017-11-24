function dot_update() {
    cd ~/.dotfiles/;
    git pull;
    git submodule update --recursive --remote;
    #update vim plug
    rm -f ~/.vim/autoload/plug.vim;
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
	curl -fo .gdbinit https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit;
}
