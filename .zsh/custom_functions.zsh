function dot_update() {
    cd ~/.dotfiles/;
    git pull;
    git submodule update --recursive --remote;
}
