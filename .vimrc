let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'xolox/vim-misc'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'fidian/hexmode'
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'tpope/vim-obsession'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'LucHermitte/alternate-lite' | Plug 'LucHermitte/lh-vim-lib'
Plug 'airblade/vim-gitgutter'
call plug#end()

filetype plugin on
filetype indent on
syntax enable

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set mouse=n
set autoread
set splitbelow
set splitright
set langmenu=en
set completeopt-=preview
set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

if exists('$SUDO_USER')
	set nobackup
	set nowritebackup
else
	set directory=~/.vim/tmp/backup//
	set directory+=.
endif

if exists('$SUDO_USER')
	set noswapfile
else
	set directory=~/.vim/tmp/swap//
	set directory+=.
endif

imap jk <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>

nnoremap K :Man <cword><CR>

set hidden
set history=500
set autoindent
set cursorline
set autochdir
filetype indent on
set cindent
set smartcase
set smartindent
set timeoutlen=1000 ttimeoutlen=0

set backspace=indent,eol,start
set scrolloff=7
set shortmess+=A
set switchbuf=usetab

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set novisualbell
set noerrorbells
set hlsearch
set incsearch
set ignorecase

set laststatus=2

let g:lightline = {
			\	'colorscheme': 'base16',
			\	'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\	},
			\	'component_function': {
			\   	'gitbranch': 'fugitive#head'
			\ 	},
			\ }

if has("autocmd")
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif

"search for selected text, forwards or backwards.
"source: http://vim.wikia.com/wiki/search_for_visually_selected_text
vnoremap <silent> * :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>

" Don't overwrite register on paste
" Source: https://stackoverflow.com/questions/290465/vim-how-to-paste-over-without-overwriting-register#answer-31411902
xnoremap p "_dP

nnoremap <Leader>v :Vexplore<CR>
