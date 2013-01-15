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
"set encoding=utf-8

"エラー時の音とビジュアルベルの抑制。し
set errorbells
set novisualbell
set visualbell t_vb=
"行番号を表示
set number
"新しい行のインデントを現在行と同じにする
set autoindent
"新しい行のインデントを現在行と同じにする
set autoindent
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
    set backupdir=$HOME/Documents/backup_files/vimbackup
    "スワップファイル用のディレクトリ
    set directory=$HOME/Documents/backup_files/vimbackup
endif
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
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
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'koron/nyancat-vim'
NeoBundle 'mitechie/pyflakes-pathogen'

" vim-scripts repos
NeoBundle 'ref.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'mru.vim'

" Non github repos
" e.g.)
" NeoBundle 'git://git.wincent.com/command-t.git'

" Non git repos
" e.g.)
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on
NeoBundleCheck

"----------------------------------------------------
" The NERD Tree
"----------------------------------------------------
" autocmd VimEnter * NERDTree ./
nmap <Leader>n :NERDTreeToggle<CR>

"----------------------------------------------------
" neocomplcache
"----------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

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

