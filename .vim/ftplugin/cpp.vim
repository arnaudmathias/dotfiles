let g:ale_cpp_gcc_options = '-std=c++11 -Wno-pragma-once-outside-header'
let g:ale_cpp_clang_options = '-std=c++11 -Wno-pragma-once-outside-header'
let g:ale_cpp_clangtidy_options  = '-std=c++11 -Wno-pragma-once-outside-header'

let g:clang_format#cod_style = 'google'
nmap <Leader>C :ClangFormatAutoToggle<CR>
