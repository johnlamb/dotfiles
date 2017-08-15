set nocompatible
filetype plugin indent on
set clipboard=unnamedplus
set splitright
set splitbelow
let mapleader = ','
syntax enable
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set encoding=utf-8
set nu
set relativenumber
set background=dark
" Enable folding
"set foldmethod=indent
"set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za
" PEP8
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
colorscheme solarized

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> 
