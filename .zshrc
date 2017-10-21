source ~/.zsh/checks.zsh		#Some useful checks
source ~/.zsh/custom_functions.zsh
source ~/.zsh/aliases.zsh

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

#-----------------------------------------------
# Antigen
#-----------------------------------------------
source ~/.zsh/antigen/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle paulirish/git-open
antigen bundle colored-man-pages

antigen theme pygmalion
antigen use oh-my-zsh

antigen apply

unsetopt auto_cd

#-----------------------------------------------
# Misc
#-----------------------------------------------

if [[ $IS_MAC -eq 1 ]]; then
	# Load Homebrew config script, needed for 42
	source $HOME/.brewconfig.zsh
fi

#Automaticly launch TMUX (Only at home)
if [[ $IS_MAC -eq 0 ]] && [[ -z "$TMUX" ]]; then
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

# OPAM configuration
. /Users/amathias/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
