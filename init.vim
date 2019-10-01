" Install vim-plug if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugged
call plug#begin('~/.cache/plugged')
	Plug 'chriskempson/base16-vim'
	Plug 'itchyny/lightline.vim'
call plug#end()

" Pick colorscheme from Base16
set background=light
if filereadable(expand("~/.vimrc_background"))
	source ~/.vimrc_background
endif
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ }	

" General settings
highlight Comment gui=italic
set termguicolors
set guicursor+=n-v-c:blinkon1
set clipboard+=unnamedplus
set smartindent
set hidden
set nobackup
set nowritebackup
set splitright
set splitbelow
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
set relativenumber
set cursorline
set so=10
set noshowmode

" Move mappings between tabs
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

function! s:lightline_update()
        if !exists('g:loaded_lightline')
                return
        endif
        try
                if g:colors_name =~# 'solarized'
                        runtime autoload/lightline/colorscheme/solarized.vim
                        call lightline#init()
                        call lightline#colorscheme()
                        call lightline#update()
                endif
        catch
        endtry
endfunction
