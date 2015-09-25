;; ------------------------------------------------------------------------
;; @ coding system

   ;; 日本語入力のための設定
   (set-keyboard-coding-system 'cp932)

   (prefer-coding-system 'utf-8-dos)
   (set-file-name-coding-system 'cp932)
   (setq default-process-coding-system '(cp932 . cp932))

;; ------------------------------------------------------------------------
;; @ ime

   ;; 標準IMEの設定
   (setq default-input-method "W32-IME")

   ;; IME状態のモードライン表示
   (setq-default w32-ime-mode-line-state-indicator "[Aa]")
   (setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

   ;; IMEの初期化
   (w32-ime-initialize)

   ;; IME OFF時の初期カーソルカラー
   (set-cursor-color "cyan")

   ;; IME ON/OFF時のカーソルカラー
   (add-hook 'input-method-activate-hook
              (lambda() (set-cursor-color "green")))
   (add-hook 'input-method-inactivate-hook
              (lambda() (set-cursor-color "cyan")))

   ;; バッファ切り替え時にIME状態を引き継ぐ
   (setq w32-ime-buffer-switch-p nil)

;; ------------------------------------------------------------------------
;; @ font

  ;; 標準フォントの設定
  (set-default-font "MeiryoKe_Gothic-11")
  ;; (set-default-font "ＭＳ ゴシック-11")

  ;; 行間を空ける量
  (setq-default line-spacing 3)

;; ------------------------------------------------------------------------
;; @ migemo

  ;; (setq migemo-command "~/.emacs.d/elisp/cmigemo-nt/cmigemo")
  ;; (setq migemo-options '("-q" "--emacs"))
  ;; (setq migemo-dictionary  "~/.emacs.d/elisp/cmigemo-nt/dict/utf-8/migemo-dict")
  ;; (setq migemo-user-dictionary nil)
  ;; (setq migemo-regex-dictionary nil)
  ;; (setq migemo-use-pattern-alist t)
  ;; (setq migemo-use-frequent-pattern-alist t)
  ;; (setq migemo-pattern-alist-length 1024)
  ;; (setq migemo-coding-system 'utf-8-unix)
  ;; (load-library "migemo")
  ;; (migemo-init)
  ;; (set-process-query-on-exit-flag migemo-process nil)

