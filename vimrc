set nocompatible
filetype plugin indent on
set path+=include,src
syntax enable

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""
" Color and schemes
set termguicolors
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

highlight Comment cterm=italic
set termguicolors
set guicursor+=n-v-c:blinkon1
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Extra C++ syntax color
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" YCM options
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'
" Autoclose preview
let g:ycm_autoclose_preview_window_after_completion = 1
" Set error and warnings more stylish
" Errors
let g:ycm_error_symbol = '✖'
highlight YcmErrorSign ctermfg=1 ctermbg=10 guifg=#d75f5f guibg=#3a3a3a
highlight YcmErrorSection ctermfg=1 cterm=italic,underline
" Warnings
let g:ycm_warning_symbol = '⚠'
highlight YcmWarningSign ctermfg=3 ctermbg=10 guifg=#ffaf00 guibg=#3a3a3a
highlight YcmWarningSection ctermfg=3 cterm=italic,underline

set clipboard+=unnamed
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set laststatus=2
set encoding=utf-8
set nu
set relativenumber
set wildmenu
set cursorline

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set so=10
set hlsearch

nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

set statusline=\ %f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n%m%r%h%w\ 
  \%=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ 
  \&bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" Enable folding
set foldmethod=manual
set foldlevel=99
"
" Enable folding with the spacebar
nnoremap <space> za
vnoremap < <gv
vnoremap > >gv
