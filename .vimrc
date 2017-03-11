execute pathogen#infect()

filetype on
syntax enable
set termguicolors
colorscheme solarized

set nu
set autoindent
filetype indent on
set cindent
set smartcase
set smartindent

set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4

set visualbell
set noerrorbells
imap jk <ESC>
set hlsearch
set incsearch
set ignorecase

set wildmenu
set wildmode=longest,list

set laststatus=2

set path=$PWD/**
com! FormatJSON %!python -m json.tool
autocmd BufWritePre * :%s/\s\+$//e

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

if has('cscope')
	set cscopetag cscopeverbose

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	cnoreabbrev csa cs add
	cnoreabbrev csf cs find
	cnoreabbrev csk cs kill
	cnoreabbrev csr cs reset
	cnoreabbrev css cs show
	cnoreabbrev csh cs help

	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
