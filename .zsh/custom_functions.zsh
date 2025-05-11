function dot_update() {
    cd ~/.dotfiles/;
    git pull;
    git submodule update --recursive --remote;
    cd -;
}

function music_import() {
    ssh -p 1337 arnaud@192.168.0.2 -t 'cd /volume1/music/Import; beet import .;bash -l';
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
