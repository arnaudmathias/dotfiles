let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'fidian/hexmode'
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'w0rp/ale'
call plug#end()

filetype plugin on
filetype indent on
syntax enable

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set splitbelow
set splitright
set langmenu=en
set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

imap jk <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>

set history=500
set nu
set autoindent
filetype indent on
set cindent
set smartcase
set smartindent

set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4

set so=7

set novisualbell
set noerrorbells
set hlsearch
set incsearch
set ignorecase

set laststatus=2

set path=$PWD/**
com! FormatJSON %!python -m json.tool
autocmd BufWritePre * :%s/\s\+$//e

let g:lightline = {
		\	'colorscheme': 'base16'
      	\ }

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

let g:ale_sign_column_always = 1
