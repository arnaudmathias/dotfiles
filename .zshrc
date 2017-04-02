source ~/.zsh/checks.zsh

if [[ ! -f ~/.zsh/antigen.zsh ]]; then
	curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi

#-----------------------------------------------
# Antigen
#-----------------------------------------------
source ~/.zsh/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle paulirish/git-open

antigen theme pygmalion
antigen use oh-my-zsh

antigen apply

#-----------------------------------------------
# Alias
#-----------------------------------------------
alias la="ls -la"
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"


#-----------------------------------------------
# Misc
#-----------------------------------------------

if [[ $IS_MAC -eq 1 ]]; then
	# Load Homebrew config script, needed for 42
	source $HOME/.brewconfig.zsh
fi

#Tmux Plugin Manager
if [[ ! -d ~/.tmux/plugins/tpm/.git ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

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

#Base16-shell
if [[ ! -d ~/.zsh/base16-shell/.git ]]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.zsh/base16-shell
fi

BASE16_SHELL=$HOME/.zsh/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

#vim-plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

