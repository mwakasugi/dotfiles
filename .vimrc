"----------------------------------------
" General Settings
"----------------------------------------
set nocompatible
syntax on

"----------------------------------------
" Search Settings
"----------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch

"----------------------------------------
" Editor Settings
"----------------------------------------
set infercase
set hidden
set switchbuf=useopen
set showmatch
set matchtime=1
set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start

"----------------------------------------
" Display Settings
"----------------------------------------
set list
set wrap
set textwidth=0
set noerrorbells
set novisualbell
set t_vb=
set display=lastline

"----------------------------------------
" leader
"----------------------------------------
let mapleader = "\<Space>"

"----------------------------------------
" vim-plug
"----------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neomru.vim', { 'on':  ['Unite'] } | Plug 'shougo/unite.vim', { 'on': ['Unite'] }

call plug#end()

"----------------------------------------
" unite.vim
"----------------------------------------
nnoremap <silent> <Leader>fr :<C-u>Unite<Space>file_mru<CR>

let g:unite_enable_start_insert = 1
