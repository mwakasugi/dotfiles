"----------------------------------------
" .vimrc 
"----------------------------------------
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

"----------------------------------------
" Run-Time path settings 
"----------------------------------------
if isdirectory($HOME . '/.vim') 
  let $MY_VIMRUNTIME = $HOME.'/.vim' 
elseif isdirectory($HOME . '\vimfiles') 
  let $MY_VIMRUNTIME = $HOME.'\vimfiles' 
elseif isdirectory($VIM . '\vimfiles') 
  let $MY_VIMRUNTIME = $VIM.'\vimfiles' 
endif 

"----------------------------------------
" General settings
"----------------------------------------
" Disable vi compativility
set nocompatible

" Encodings
if has('win32')
    set encoding=sjis
else
    set encoding=utf-8
endif

set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" statusline
let &statusline = '%F%m%r%h%w %=[Type: %Y] [Format: %{&ff}] [Enc: %{&fileencoding}] [%4l/%4L, %3c] '

" Change colors on INSERT mode
let g:hi_insert = 'highlight StatusLine guifg=#fdf6e3 guibg=#b58900 gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"----------------------------------------
" Settings for searching
"----------------------------------------
" The case of normal letters is ignored. 
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase
" While typing a search command, show where the pattern, as it was typed so
" far, matches.
set incsearch
" When there is a previous search pattern, highlight all its matches.
set hlsearch
" When typing a search pattern, automatically escape '/' and '?'.
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"----------------------------------------
" Settings for editing
"----------------------------------------
" Round indent to multiple of 'shiftwidth'.
set shiftround
" When doing keyword completion in insert mode, and 'ignorecase' is also on, 
" the case of the match is adjusted depending on the typed text.
set infercase
" When off a buffer is unloaded when it is abandoned.  When on a buffer becomes
" hidden when it is abandoned.
set hidden
" If included, jump to the first open window that contains the specified buffer
" (if there is one).
set switchbuf=useopen
" When a bracket is inserted, briefly jump to the matching one. The jump is
" only done if the match can be seen on the screen.
" The time to show the match can be set with 'matchtime'.
" The 'matchpairs' option can be used to specify the characters to show matches
" for. 
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>
" Add the characters that backspace removes.
set backspace=indent,eol,start

" Disable swap files and backup file.
set nowritebackup
set nobackup
set noswapfile

"----------------------------------------
" Settings for displaying
"----------------------------------------
" Display unprintable characters
set list
" Precede each line with its line number.
set number
" When on, lines longer than the width of the window will wrap and displaying
" continues on the next line.
set wrap
" Disable inserting line-break when a long line is inserted.
set textwidth=0
" Color the specified column of a screen
set colorcolumn=80
" Disable visual bells.
set t_vb=
set novisualbell

"----------------------------------------
" Macros and Keys
"----------------------------------------
" <ESC> when typing 'jj' quick
inoremap jj <Esc>

" Make search results appear in the middle on the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Select from the cursor to the end of line by typing 'vv' quick.
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Moving cursor to other windows by using Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change the size of the window by using Shift + cursor
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" Open the QuickFix window after running make and grep, etc.
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" Close a QuickFix or a Help buffer by typing q
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" Automatically create the folder when opening the file like using :e
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
      \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" Load ~/.vimrc.local when it exists.
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
  execute 'source ' . s:local_vimrc
endif

"----------------------------------------------------
" Key bindings
"----------------------------------------------------

map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Emacs like key-bindings in INSERT mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-a> <Home>
imap <C-h> <Backspace>
imap <C-d> <Del>

"----------------------------------------------------
" Plugin settings
"----------------------------------------------------
let s:noplugin = 0
let s:bundle_root = expand('$MY_VIMRUNTIME/bundle/')
let s:neobundle_root = s:bundle_root . 'neobundle.vim/'
if !isdirectory(s:neobundle_root) || v:version < 702
  " Do not load any plugins when NeoBundle does not exist, or Vim version is
  " earlier than 702
  let s:noplugin = 1
else
  " Add NeoBundle to 'runtimepath' then initialize it.
  if has('vim_starting')
    execute "set runtimepath+=" . s:neobundle_root
  endif
  call neobundle#rc(s:bundle_root)

  " NeoBundle manages NeoBundle itself.
  NeoBundleFetch 'Shougo/neobundle.vim'

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " vimproc
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " vimproc is getting compiled when installing.
  NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " unite.vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle "Shougo/unite.vim"
  NeoBundle 'Shougo/unite-outline'
  nnoremap [unite] <Nop>
  nmap U [unite]
  nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]r :<C-u>Unite register<CR>
  nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
  nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
  nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
  nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
  nnoremap <silent> [unite]w :<C-u>Unite window<CR>

  " start unite in insert mode
  let g:unite_enable_start_insert = 1
  " use vimfiler to open directory
  call unite#custom_default_action("source/bookmark/directory", "vimfiler")
  call unite#custom_default_action("directory", "vimfiler")
  call unite#custom_default_action("directory_mru", "vimfiler")
  autocmd MyAutoCmd FileType unite call s:unite_settings()

  function! s:unite_settings()
    imap <buffer> <Esc><Esc> <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
  endfunction

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " vimfiler.vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundleLazy "Shougo/vimfiler.vim", {
        \ "depends": ["Shougo/unite.vim"],
        \ "autoload": {
        \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
        \   "mappings": ['<Plug>(vimfiler_switch)'],
        \   "explorer": 1,
        \ }}

  nnoremap <Leader>e :VimFilerExplorer<CR>
  " close vimfiler automatically when there are only vimfiler open
  autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
  let s:hooks = neobundle#get_hooks("vimfiler")
  function! s:hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1

    "let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

   " vimfiler specific key mappings
    autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
    function! s:vimfiler_settings()
      " ^^ to go up
      nmap <buffer> ^^ <Plug>(vimfiler_switch_to_parent_directory)
      " use R to refresh
      nmap <buffer> R <Plug>(vimfiler_redraw_screen)
      " overwrite C-l
      nmap <buffer> <C-l> <C-w>l
    endfunction
  endfunction

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " neocomplcache.vim & neocomplete.vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  if has('lua') && v:version >= 703 && has('patch885')
    NeoBundle "Shougo/neocomplete.vim"
    let g:neocomplete#enable_at_startup = 1
    let g:acp_enableAtStartup = 0
    let g:neocomplet#enable_smart_case = 1
  else
    NeoBundle "Shougo/neocomplcache.vim"
    let g:neocomplcache_enable_at_startup = 1
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_smart_case = 1
  endif

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " neosnippet.vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle "Shougo/neosnippet.vim"
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='$MY_VIMRUNTIME/snippets'

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " vim-indent-guides
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle "nathanaelkane/vim-indent-guides"
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
  let g:indent_guides_color_change_percent=30
  let g:indent_guides_guide_size=1

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " gundo.vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundleLazy "sjl/gundo.vim", {
        \ "autoload": {
        \   "commands": ['GundoToggle'],
        \}}
  nnoremap <Leader>g :GundoToggle<CR>

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " vim-template
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle "thinca/vim-template"
  " Replace placeholders in a template.
  autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
  function! s:template_keywords()
      silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
      silent! %s/<+FILENAME+>/\=expand('%:r')/g
  endfunction
  " Move cursor to '<+CURSOR+>'
  autocmd MyAutoCmd User plugin-template-loaded
      \   if search('<+CURSOR+>')
      \ |   silent! execute 'normal! "_da>'
      \ | endif

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " jedi-vim
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundleLazy "davidhalter/jedi-vim", {
     \ "autoload": {
     \   "filetypes": ["python", "python3", "djangohtml"],
     \ }}
  let s:hooks = neobundle#get_hooks("jedi-vim")
  function! s:hooks.on_source(bundle)
    " Disable auto vim configration.
    let g:jedi#auto_vim_configuration = 0
    " Disable selecting the first one when running completion
    let g:jedi#popup_select_first = 0
    " Change the keymap of rename command as it conflict with 'quickrun'.
    let g:jedi#rename_command = '<Leader>R'
    " Change the keymap of goto command as it conflict with 'gundo'.
    let g:jedi#goto_assignments_command = '<Leader>G'
  endfunction

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " syntastic
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'passive',
              \ 'active_filetypes': ['ruby'] }
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_quiet_warnings = 0

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " ruby-matchit
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle 'vim-scripts/ruby-matchit'

  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  " other plugins
  " *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'osyo-manga/unite-quickfix'
  NeoBundle 'osyo-manga/shabadou.vim'
  NeoBundle 'mitechie/pyflakes-pathogen'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'tomasr/molokai'
  
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'vim-scripts/Align'
  
  NeoBundle '5t111111/pyrkdown.vim'
  NeoBundle '5t111111/alt-gtags.vim'
  NeoBundle '5t111111/neat-json.vim'

  " Check the plugin that is not installed, then download it if necessary.
  NeoBundleCheck
endif

" Enable File Type plugin and Indent.
" This must be called adtere NeoBundle process has completed..
filetype plugin indent on

"----------------------------------------------------
" alt-gtags.vim
"----------------------------------------------------
  nnoremap [alt-gtags] <Nop>
  nmap T [alt-gtags]
  nnoremap <silent> [alt-gtags]i :AltGtags -f<CR>
  nnoremap <silent> [alt-gtags]j :AltGtags<CR>
  nnoremap <silent> [alt-gtags]k :AltGtags -r<CR>
  nnoremap <silent> [alt-gtags]l :AltGtags -s<CR>

"----------------------------------------------------
" QuickRun
"----------------------------------------------------
let g:quickrun_config = {
      \   "_" : {
      \       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
      \       "hook/unite_quickfix/enable_failure" : 1,
      \       "hook/close_quickfix/enable_exit" : 1,
      \       "hook/close_buffer/enable_failure" : 1,
      \       "hook/close_buffer/enable_empty_data" : 1,
      \       "outputter" : "multi:buffer:quickfix",
      \       "hook/inu/enable" : 1,
      \       "hook/inu/wait" : 20,
      \       "outputter/buffer/split" : ":botright 8sp",
      \       "runner" : "vimproc",
      \       "runner/vimproc/updatetime" : 40,
      \   }
      \}

