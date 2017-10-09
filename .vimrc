let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'fidian/hexmode'
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

filetype plugin on
filetype indent on
syntax enable

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set cursorline

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

set mouse=n
set ttymouse=xterm2

imap jk <ESC>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>

set hidden
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
set scrolloff=7
set shortmess+=A
set switchbuf=usetab

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

let g:netrw_browse_split = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
nnoremap <Leader>v :Vexplore<CR>

" ALE LINTER CONFIG
let g:ale_sign_column_always = 0
let g:ale_cpp_gcc_options = '-std=c++11'
let g:ale_cpp_clang_options = '-std=c++11'
let g:ale_cpp_clangtidy_options  = '-std=c++11'

let g:ale_c_gcc_options = '-Wall -Werror -Wextra'
let g:ale_c_clang_options = '-Wall -Werror -Wextra'
let g:ale_c_clangtidy_options  = '-Wall -Werror -Wextra'

" UTILS SNIP CONFIG
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:clang_format#cod_style = 'google'
nmap <Leader>C :ClangFormatAutoToggle<CR>

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
     execute "set rtp+=" . g:opamshare . "/merlin/vim"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
