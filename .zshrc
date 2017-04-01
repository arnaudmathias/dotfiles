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

# If Tmux Plugin Manager is not installed - clone it
if [[ ! -d ~/.tmux/plugins/tpm/.git ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

