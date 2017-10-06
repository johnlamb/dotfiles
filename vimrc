set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'lervag/vimtex'
Plugin 'vim-latex/vim-latex'

call vundle#end()

filetype plugin indent on
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
colorscheme solarized
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Make double <ESC> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
set splitright
set splitbelow
let mapleader = ','
set statusline=\ %f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n%m%r%h%w\ 
  \%=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ 
  \&bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
syntax enable
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set laststatus=2
set encoding=utf-8
set nu
set relativenumber
set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set so=10
set hlsearch
if exists('+colorcolumn')
  highligh OverLength ctermbg=red ctermfg=white
  "match OverLength /\%81v.\+/
  match OverLength /\%121v/
  "highlight ColorColumn ctermbg=red
	set colorcolumn=120
endif
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
    \ set textwidth=80
    \ set expandtab
    \ set smartindent
    \ set smarttab
    \ set autoindent
    \ set fileformat=unix
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> 
