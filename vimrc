set nocompatible
filetype plugin indent on
set path+=include,src
syntax enable
let mapleader = ','

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""
" Color and schemes
set termguicolors
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

packloadall

silent! helptags ALL

highlight Comment cterm=italic
highlight Italic cterm=italic
set guicursor+=n-v-c:blinkon0
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Extra C++ syntax color
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" YCM options
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
" Autoclose preview
let g:ycm_autoclose_preview_window_after_completion = 1
" Set error and warnings more stylish
" Errors
let g:ycm_error_symbol = '✖'
highlight link YcmErrorSign GitGutterDelete
" highlight YcmErrorSign ErrorMsg
" highlight YcmErrorSign ctermfg=1 ctermbg=10 guifg=#ffaf00 guibg=#3a3a3a
" highlight YcmErrorSection ctermfg=1 cterm=italic,underline
" Warnings
let g:ycm_warning_symbol = '⚠'
" highlight YcmWarningSign ctermfg=3 ctermbg=10 guifg=#ffaf00 guibg=#3a3a3a
" highlight YcmWarningSection ctermfg=3 cterm=italic,underline

" Neomake
call neomake#configure#automake('w')
let g:neomake_python_enabled_makers = ['flake8', 'python']
" let g:neomake_cpp_enabled_makers = ['clang']
" let g:neomake_cpp_clang_args = ["-Iinclude", "-std=c++11", "-Wextra", "-Wall", "-Wpedantic"] 
"
" " Ale options
" let g:ale_sign_error = '!'
" let g:ale_sign_warning = '!'
" let g:ale_linters_explicit = 1
" let g:ale_linters = {'python': ['flake8']}
" let g:ale_completion_enabled = 0
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_set_highlights = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" highlight ALEErrorSign ctermfg=1 ctermbg=10 guifg=#d75f5f guibg=#282a2e
" highlight ALEWarningSign ctermfg=3 ctermbg=10 guifg=#ffaf00 guibg=#282a2e
" " highlight ALEErrorSign ctermfg=1 ctermbg=10 guifg=#d75f5f guibg=#3a3a3a
" " highlight ALEWarningSign ctermfg=3 ctermbg=10 guifg=#ffaf00 guibg=#3a3a3a

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

" Stop search highlighting
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" Open buffer menu with §
map § :buffers<CR>:b

" set statusline=\ %{getcwd()}\ %f\ Buf:#%n%m%r%h%w\ 
"   \%=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ 
"   \&bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l/%L,%v][%p%%]\ %)

" set statusline=%{Lhs()}
" set statusline+=
set statusline=%3(\ %M\ %)
" set statusline+=%t
" set statusline+=%!&modified ? '+ ' : '  '
" set statusline+=\ 
" set statusline+=%<                         
set statusline+=%{Fileprefix()}
set statusline+=%t
set statusline+=\ 
set statusline+=%([%R%{Ft()}%{Fenc()}]%)
set statusline+=%=
" set statusline+=\ 
" " set statusline+=
set statusline+=ℓ
set statusline+=\ 
set statusline+=%{line('.')}
set statusline+=/
set statusline+=%{line('$')}
set statusline+=\ 
set statusline+=𝚌  
set statusline+=\ 
set statusline+=%{virtcol('.')}
set statusline+=/
set statusline+=%{virtcol('$')}
set statusline+=\ 


" set statusline+=%{Rhs()}

function! Rhs() abort
  let l:line=' '
  if winwidth(0) > 80
    let l:line.='ℓ ' " (Literal, \u2113 "SCRIPT SMALL L").
    let l:line.=line('.')
    let l:line.='/'
    let l:line.=line('$')
    let l:line.=' 𝚌 ' " (Literal, \u1d68c "MATHEMATICAL MONOSPACE SMALL C").
    let l:line.=virtcol('.')
    let l:line.='/'
    let l:line.=virtcol('$')
    let l:line.=' '
  endif
  return l:line
endfunction
" Enable folding
set foldmethod=manual
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
vnoremap < <gv
vnoremap > >gv

function! Lhs() abort
  let l:line=Gutterpadding()
  let l:line.=&modified ? '+ ' : '  '
  return l:line
endfunction

function! Fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename == '' || l:basename == '.'
    return ''
  else
    " Make sure we show $HOME as ~.
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! Ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! Fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction
