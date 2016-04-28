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
set hidden
set switchbuf=useopen
set matchtime=1
set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start

"----------------------------------------
" Display Settings
"----------------------------------------
set cursorline
set laststatus=2
set wrap
set textwidth=0
set noerrorbells
set novisualbell
set showmatch
set t_vb=
set display=lastline

"----------------------------------------
" OS related settings
"----------------------------------------
set clipboard=unnamed,unnamedplus

"----------------------------------------
" leader
"----------------------------------------
let mapleader = "\<Space>"

"----------------------------------------
" vim-plug
"----------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter', { 'for': 'ruby' }
Plug 'scrooloose/syntastic', { 'for': 'ruby' }
Plug 'Shougo/neomru.vim', { 'on':  'Unite' } | Plug 'shougo/unite.vim', { 'on': 'Unite' }

call plug#end()

"----------------------------------------
" unite.vim
"----------------------------------------
nnoremap <silent> <Leader>fr :<C-u>Unite<Space>file_mru<CR>

let g:unite_enable_start_insert = 1
