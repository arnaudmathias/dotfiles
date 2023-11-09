alias vim="nvim"
alias vi="nvim"
alias la="ls -la"
alias ll="ls -la"

# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"

alias ocaml="rlwrap ocaml"

alias soff="sleep 0.2 ; xset dpms force off"

alias gmovies="cd /mnt/nas/movies/"
alias gshow="cd '/mnt/nas/video/TV Shows/'"
alias gmusic="cd /mnt/nas/music/Library/"
