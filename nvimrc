" Initial settings
set nocompatible
filetype plugin indent on

" Plugins, dein ftw!
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')          " Handle plugins
call dein#add('Shougo/deoplete.nvim')     " Autocomplete enginee
call dein#add('zchee/deoplete-jedi')      " Autocomplete for python
call dein#add('neomake/neomake')          " Automake, used for linting
call dein#add('vimwiki/vimwiki')          " Vimwiki for knowledge
call dein#add('jpalardy/vim-slime')       " Slime to send to terminal
call dein#add('chriskempson/base16-vim')  " base16 themes

call dein#end()

" Plugin specific settings
" Run neomake on entering normal mode, write and read after a 500ms delay
call neomake#configure#automake('nwri', 500)

let g:deoplete#enable_at_startup = 1
let g:neomake_python_enabled_makers = ['flake8', 'python']
let g:slime_target = "neovim"
let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki'}]

" Needed for truecolor support
set termguicolors

" Synced with base16_shell
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" Global settings
syntax enable
set clipboard+=unnamed

set splitright
set splitbelow

set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set laststatus=2
set encoding=utf-8
set nu
set relativenumber
set wildmenu
set cursorline

" Enable folding, on indent and using space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set so=10
set hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Python specifics
autocmd FileType python set sw=4 ts=4 sts=4 tw=80
autocmd FileType python highligh OverLength ctermbg=red ctermfg=white guibg=#993737
autocmd FileType python match OverLength /\%80v/
autocmd FileType python set colorcolumn=80
" autocmd FileType python let &colorcolumn=join(range(80, 999),",")

autocmd BufEnter term://* startinsert
autocmd TermOpen * setlocal statusline=\ Term\ Job\ ID:\ %{b:terminal_job_id}%=\ %l,%-3c\ %P

" Remaps
let mapleader = ','
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
" Statusline
set statusline=\ %<%.99f\ %h%w%m%r%y%=\ %l,%-3c\ %P

