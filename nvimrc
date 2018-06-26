
" Initial settings
set nocompatible

" Plugins
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
    call dein#add('Shougo/dein.vim')          " Handle plugins
    call dein#add('chriskempson/base16-vim')  " base16 themes
    call dein#add('Valloric/YouCompleteMe')   " YCM completion
    call dein#add('neomake/neomake')          " Automake, used for linting
call dein#end()

filetype plugin indent on

" Color
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
set termguicolors
syntax enable

" YCM settings
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0   " Let neomake handle linting

" Neomake settings
call neomake#configure#automake('nwri', 500)
let g:neomake_python_enabled_makers = ['flake8', 'python']
let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_args = ["-ansi", "-Wextra", "-Wall", "-Wpedantic"] 

" Global settings
set clipboard+=unnamedplus
set splitright
set splitbelow
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
set so=10
set hlsearch
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd

" Enable folding, on indent and using space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Remaps
let mapleader = ','
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
tnoremap <Esc> <C-\><C-n>
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

nmap <Leader><Space>, :ll<CR>
nmap <Leader><Space>n :lnext<CR>
nmap <Leader><Space>p :lprev<CR>

nnoremap <M-j> <C-w><C-j>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-l> <C-w><C-l>
nnoremap <M-h> <C-w><C-h>

inoremap <M-j> <esc><C-w><C-j>
inoremap <M-k> <esc><C-w><C-k>
inoremap <M-l> <esc><C-w><C-l>
inoremap <M-h> <esc><C-w><C-h>

vnoremap <M-j> <esc><C-w><C-j>
vnoremap <M-k> <esc><C-w><C-k>
vnoremap <M-l> <esc><C-w><C-l>
vnoremap <M-h> <esc><C-w><C-h>

tnoremap <M-j> <c-\><c-n><C-w><C-j>
tnoremap <M-k> <c-\><c-n><C-w><C-k>
tnoremap <M-l> <c-\><c-n><C-w><C-l>
tnoremap <M-h> <c-\><c-n><C-w><C-h>

nnoremap <M-a>v :vsp term://bash<CR>
nnoremap <M-a>h :sp term://bash<CR>

" Autocommands
" Python specifics
autocmd FileType python highligh OverLength ctermbg=red ctermfg=white guibg=#993737
autocmd FileType python match OverLength /\%80v/
autocmd FileType python set colorcolumn=80

autocmd BufEnter term://* startinsert
autocmd TermOpen * setlocal statusline=\ Term\ Job\ ID:\ %{b:terminal_job_id}%=\ %l,%-3c\ %P
autocmd TermOpen * setlocal nonumber norelativenumber
"
" Statusline
set statusline=\ %<%.99f\ %h%w%m%r%y%=\ %l,%-3c\ %P
