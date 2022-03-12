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
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

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


if [[ $IS_MAC -eq 1 ]]; then
	export PATH=$HOME/.brew/bin:$PATH
fi

[ ! -d $HOME/.zplug ] && git clone https://github.com/zplug/zplug $HOME/.zplug

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
