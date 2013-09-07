"----------------------------------------
" .vimrc 
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

"文字コードの設定
if has('win32')
    set encoding=sjis
else
    set encoding=utf-8
endif

set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

"エラー時の音とビジュアルベルの抑制。
set errorbells
set novisualbell
set visualbell t_vb=
"行番号を表示
set number
"バックアップファイル、スワップファイルの作成場所
if has('win32')
    "バックアップファイルを作るディレクトリ
    set backupdir=$HOME\Documents\backup_files\vimbackup
    "スワップファイル用のディレクトリ
    set directory=$HOME\Documents\backup_files\vimbackup
elseif has('mac')
    "バックアップファイルを作るディレクトリ
    set backupdir=$HOME/Documents/backup_files/vimbackup
    "スワップファイル用のディレクトリ
    set directory=$HOME/Documents/backup_files/vimbackup
elseif has('unix')
    "バックアップファイルを作るディレクトリ
    set backupdir=$HOME/documents/backup_files/vimbackup
    "スワップファイル用のディレクトリ
    set directory=$HOME/documents/backup_files/vimbackup
endif
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"タブの代わりに空白文字を挿入する
set expandtab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"シフト移動幅
set shiftwidth=4
"新しい行のインデントを現在行と同じにする
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan
"シンタックスハイライトを有効に
syntax enable
"存在しないフォルダの自動作成
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END

" INSERT モード時にステータスバーの色を変更
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

" grep
autocmd QuickfixCmdPost vimgrep cw
autocmd QuickfixCmdPost grep cw


"----------------------------------------------------
" KeyBindings
"----------------------------------------------------
nmap <Space> [mykey]
nnoremap [mykey]cd :cd<Space>%:h<CR>:pwd<CR>
nnoremap [mykey]g :grep<Space>-i<Space>
nnoremap [mykey]vg :vimgrep<Space>

map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Emacs Like in Insert Mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-a> <Home>
imap <C-h> <Backspace>
imap <C-d> <Del>

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
if has('vim_starting')
  set runtimepath+=$MY_VIMRUNTIME/bundle/neobundle.vim/
endif

call neobundle#rc(expand('$MY_VIMRUNTIME/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'koron/nyancat-vim'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'elzr/vim-json'
NeoBundle 'tomasr/molokai'
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'mwakasugi/pyrkdown.vim'
NeoBundle 'mwakasugi/nu-gtags.vim'
NeoBundle 'mwakasugi/neat-json.vim'

" vim-scripts repos
NeoBundle 'ref.vim'
NeoBundle 'gtags.vim'

" Non github repos
" e.g.)
" NeoBundle 'git://git.wincent.com/command-t.git'

" Non git repos
" e.g.)
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on
NeoBundleCheck

"----------------------------------------------------
" neocomplcache
"----------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

"----------------------------------------------------
" neosnippet
"----------------------------------------------------
" snippets directory
let g:neocomplcache_snippets_dir = '$MY_VIMRUNTIME/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"----------------------------------------------------
" unite
"----------------------------------------------------
nnoremap [unite] <Nop>
nmap <Space>f [unite]

" unite general settings
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 100
let g:unite_source_file_mru_filename_format = ''

nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()"{{{
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> jj <Plug>(unite_insert_leave)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"----------------------------------------------------
" The NERD Tree
"----------------------------------------------------
" autocmd VimEnter * NERDTree ./
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeFind<CR>

"----------------------------------------------------
" nu-gtags.vim
"----------------------------------------------------
nnoremap <C-I> :NuGtags -f<CR>
nnoremap <C-J> :NuGtags<CR>
nnoremap <C-K> :NuGtags -r<CR>
nnoremap <C-L> :NuGtags -s<CR>

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
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\       "outputter/buffer/split" : ":botright 8sp",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   }
\}

"----------------------------------------------------
" vim-markdown
"----------------------------------------------------
let g:vim_markdown_folding_disabled=1
