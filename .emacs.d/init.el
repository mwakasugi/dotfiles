;; ------------------------------------------------------------------------
;; @ environment setup

  ;; ロードパスの追加
  (setq load-path (append
                   '("~/.emacs.d"
                     "~/.emacs.d/elisp")
                   load-path))

  ;; OS別環境設定
  (setq darwin-p  (eq system-type 'darwin)
        ns-p      (eq window-system 'ns)
        carbon-p  (eq window-system 'mac)
        linux-p   (eq system-type 'gnu/linux)
        cygwin-p  (eq system-type 'cygwin)
        nt-p      (eq system-type 'windows-nt)
        meadow-p  (featurep 'meadow)
        windows-p (or cygwin-p nt-p meadow-p))
  
  ;; Mac - cocoaemacs
  (when ns-p
    (progn
      (load "~/.emacs.d/config/cocoa.el")
    ))

  ;; Windows - ntemacs
  (when nt-p
    (progn
      (load "~/.emacs.d/config/nt.el")
    ))

;; ------------------------------------------------------------------------
;; @ language setup

  (load "~/.emacs.d/config/lang-python.el")

;; ------------------------------------------------------------------------
;; @ key-bindings

  ;; 非標準のelispに関するキーバインドはaddons.el内にて記載
  (global-set-key "\C-j" 'goto-line)

;; ------------------------------------------------------------------------
;; @ emacs

  ;;ビープ音を消す
  (setq visible-bell t)

  ;; スタートアップページを表示しない
  (setq inhibit-startup-message t)

  ;; メニューバー、ツールバーを消す
  (if window-system
    (tool-bar-mode 0))
  (if window-system
    (menu-bar-mode 0))

  ;; カーソルの点滅を止める
  (blink-cursor-mode 0)
  
  ;; evalした結果を全部表示
  (setq eval-expression-print-length nil)
  
  ;; 対応する括弧を光らせる。
  (show-paren-mode 1)
  ;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
  (setq show-paren-style 'mixed)
  
  ;; 現在行を目立たせる
  ;;(setq hl-line-face 'hlline-face)
  (setq hl-line-face 'underline)
  (global-hl-line-mode)
  
  ;; カーソルの位置が何文字目かを表示する
  (column-number-mode t)
  
  ;; カーソルの位置が何行目かを表示する
  (line-number-mode t)
  
  ;; カーソルの場所を保存する
  (require 'saveplace)
  (setq-default save-place t)
  
  ;; 行の先頭でC-kを一回押すだけで行全体を消去する
  (setq kill-whole-line t)
  
  ;; 最終行に必ず一行挿入する
  (setq require-final-newline t)
  
  ;; バッファの最後でnewlineで新規行を追加するのを禁止する
  (setq next-line-add-newlines nil)
  
  ;; バックアップファイルを作らない
  (setq backup-inhibited t)
  
  ;; 終了時にオートセーブファイルを消す
  (setq delete-auto-save-files t)
  
  ;; 補完時に大文字小文字を区別しない
  (setq completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  
  ;; 補完可能なものを随時表示
  ;; 少しうるさい
  (icomplete-mode 1)
  
  ;; 履歴数を大きくする
  (setq history-length 10000)
  
  ;; ミニバッファの履歴を保存する
  (savehist-mode 1)
  
  ;; 最近開いたファイルを保存する数を増やす
  (setq recentf-max-saved-items 10000)

  ;; 透過設定とか
  (if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-frame-parameter nil 'alpha 96)
  ))


;; ------------------------------------------------------------------------
;; @ load elisp settings

  ;; 標準Elispの設定
  (load "config/builtins")
  
  ;; 非標準Elispの設定
  (load "config/addons")
