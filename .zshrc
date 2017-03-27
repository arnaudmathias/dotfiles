#######################################
source ~/.zsh/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle paulirish/git-open

antigen bundle chriskempson/base16-shell
antigen theme pygmalion
antigen use oh-my-zsh

antigen apply
#######################################

#alias
alias la="ls -la"

#Automaticly launch TMUX
if [[ -z "$TMUX" ]]
then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]]
    then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi
