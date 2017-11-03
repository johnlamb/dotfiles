call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
call plug#end()
set nocompatible
filetype plugin indent on

syntax enable
" colorscheme base16-default-dark
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

set splitright
set splitbelow

let mapleader = ','

set statusline=\ %f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n%m%r%h%w\ 
  \%=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ 
  \&bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checker_args='--ignore=D100'

set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set laststatus=2
set encoding=utf-8
set textwidth=120
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
  match OverLength /\%101v/
  " highlight ColorColumn ctermbg=red
	set colorcolumn=100
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake


