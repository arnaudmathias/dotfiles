source ~/.zsh/checks.zsh		#Some useful checks
source ~/.zsh/custom_functions.zsh
source ~/.zsh/aliases.zsh

#
# Zplug
#

source ~/.zplug/init.zsh

zplug "chriskempson/base16-shell", as:plugin
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug 'themes/pygmalion', as:theme, from:oh-my-zsh

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

#
# Options
#

setopt GLOB_DOTS
setopt SHAREHISTORY
setopt APPENDHISTORY
setopt INCAPPENDHISTORY

unsetopt AUTO_CD

#
# Bindings
#

bindkey -e

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end  # cursor up
bindkey "\e[B" history-beginning-search-forward-end # cursor down

#
# Misc
#

# Automaticly launch TMUX (Only at home)
if [[ $IS_MAC -eq 0 ]] && [[ -z "$TMUX" ]] && [ "$(id - u)" != "0" ]; then
	ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
	if [[ -z "$ID" ]]
	then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi

if [[ $IS_MAC -eq 1 ]]; then
	# Load Homebrew config script, needed for 42
	source $HOME/.brewconfig.zsh
fi

[ ! -d $HOME/.zplug ] && git clone https://github.com/zplug/zplug $HOME/.zplug

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# OPAM configuration
. /Users/amathias/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

