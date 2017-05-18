"----------------------------------------
" .gvimrc
"----------------------------------------
"----------------------------------------
" Run-Time Path Settings
"----------------------------------------
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"----------------------------------------
" Font Settings
"----------------------------------------
if has('win32')
  set guifont=MeiryoKe_Gothic:h11
  set linespace=2
elseif has('mac')
  set guifont=SauceCodePowerline-Light:h13
  " set linespace=2
elseif has('unix')
  set guifont=Ricty\ 12
  set linespace=3
endif

set lines=100 columns=300

"----------------------------------------------------
" Color Settings
"----------------------------------------------------

if has("gui_running")
  colorscheme dracula
endif

"----------------------------------------------------
" IME Settings
"----------------------------------------------------
highlight Cursor guifg=NONE guibg=Green
highlight CursorIM guifg=NONE guibg=Purple

"----------------------------------------------------
" Scrollbar settings
"----------------------------------------------------
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
