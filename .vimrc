execute pathogen#infect()

if (has("termguicolors"))
	set termguicolors
endif

"set t_Co=256

filetype on
set background=dark
syntax enable
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

let g:lightline = { 'colorscheme': 'solarized', }
