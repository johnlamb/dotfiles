call plug#begin('~/.vim/plugged')
" Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-jedi'
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

" Auto close
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
" ino {<CR> {<CR>}<ESC>O
" ino {;<CR> {<CR>};<ESC>O

set splitright
set splitbelow

let mapleader = ','

set statusline=\ %f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n%m%r%h%w\ 
  \%=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ 
  \&bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
if has('nvim')
    let g:jedi#force_py_version=3
endif

" let g:deoplete#enable_at_startup = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checker_args='--ignore=D100,E501'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-ansi -Wall -Wextra -Wpedantic'
" let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
" let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki'}]
" autocmd! BufWritePost * Neomake

let g:calendar_mark = 'left-fit'
let g:calendar_monday = 1


set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set laststatus=2
set encoding=utf-8
" set textwidth=90
set nu
set relativenumber
set wildmenu
set cursorline

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set so=10
set hlsearch

if exists('+colorcolumn')
    highligh OverLength ctermbg=red ctermfg=white
    "match OverLength /\%81v.\+/
    match OverLength /\%91v/
    " highlight ColorColumn ctermbg=red
    let &colorcolumn=join(range(91, 999),",")
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
" nnoremap <space> za
" autocmd FileType *.py set sw=4 ts=4 
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake


