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

"----------------------------------------------------
" Solarized
"----------------------------------------------------
if has("gui_running")
    syntax enable
    set background=light
    let g:solarized_contrast="high"
    let g:solarized_visibility="low"
    colorscheme solarized
endif

