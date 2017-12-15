function dot_update() {
    cd ~/.dotfiles/;
    git pull;
    git submodule update --recursive --remote;
    #update vim plug
    rm -f ~/.vim/autoload/plug.vim;
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
	curl -fo .gdbinit https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit;
	cd -;
}

function music_import() {
	ssh -p 1337 arnaud@192.168.0.2 -t 'cd /volume1/music/Import; beet import .;bash -l';
}
