;; ------------------------------------------------------------------------
;; @ recentf

  (setq recentf-max-saved-items 3000)
  (require 'recentf-ext)
  (global-set-key "\C-c\C-h" 'recentf-open-files) ; key-binding

;; ------------------------------------------------------------------------
;; @ dmacro

  (defconst *dmacro-key* "\C-t" "繰返し指定キー") ;key-binding
  (global-set-key *dmacro-key* 'dmacro-exec)
  (autoload 'dmacro-exec "dmacro" nil t)

;; ------------------------------------------------------------------------
;; @ jaspace

  ;; 全角空白、タブ、改行表示モード
  ;; 切り替えは M-x jaspace-mode-on or -off
  (require 'jaspace)
  ;; 全角空白を表示させる。
  (setq jaspace-alternate-jaspace-string "□")
  ;; 改行記号を表示させる。
  (setq jaspace-alternate-eol-string "↓\n")
  ;; タブ記号を表示。
  (setq jaspace-highlight-tabs t)  ; highlight tabs
  ;; フック
  (add-hook 'text-mode-hook 'jaspace-mode)

;; ------------------------------------------------------------------------
;; @ sequential-command

  ;;sequential-commandの設定
  (require 'sequential-command-config)
  (sequential-command-setup-keys)

;; ------------------------------------------------------------------------
;; @ color-theme

  (require 'color-theme)
;  (color-theme-initialize)
  (when (require 'color-theme)
    (color-theme-initialize)
    (when (require 'color-theme-solarized)
      (color-theme-solarized-dark)))

;; ------------------------------------------------------------------------
;; @ nyan-mode

  (if window-system
    (require 'nyan-mode))
 (if window-system
    (nyan-mode))
 (if window-system
    (nyan-start-animation))

;; ------------------------------------------------------------------------
;; @ redo+

  (require 'redo+)
  (global-set-key (kbd "C-M-/") 'redo) ; key-binding
  (setq undo-noredo t)
  (setq undo-limit 600000)
  (setq undo-strong-limit 900000)

;; ------------------------------------------------------------------------
;; @ color-moccur

  (require 'color-moccur)

  (define-key global-map (kbd "C-<f10>") 'moccur) ; key-binding
  (define-key global-map (kbd "C-<f11>") 'moccur-grep-find) ; key-binding


;; ------------------------------------------------------------------------
;; @ moccur-edit

  (require 'moccur-edit)

;; ------------------------------------------------------------------------
;; @ goto-chg

  (require 'goto-chg)
  (define-key global-map (kbd "<f8>") 'goto-last-change)
  (define-key global-map (kbd "<S-f8>") 'goto-last-change-reverse)

;; ------------------------------------------------------------------------
;; @ browse-kill-ring
  (require 'browse-kill-ring)
  (global-set-key "\M-y" 'browse-kill-ring) ; key-binding

;; ------------------------------------------------------------------------
;; @ major mode

  ;; ------------------------------------------------------------------------
  ;; @ vbnet-mode
  (autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
  (setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|vb\\)$" . vbnet-mode)) auto-mode-alist))

  ;; ------------------------------------------------------------------------
  ;; @ dos-mode
  (autoload 'dos-mode "dos" "Mode for editing Dos scripts." t)
  (setq auto-mode-alist (append '(("\\.\\(bat\\|cmd\\)$" . dos-mode)) auto-mode-alist))

  ;; ------------------------------------------------------------------------
  ;; @ php-mode
  (require 'php-mode)
  (setq auto-mode-alist (append '(("\\.\\(php\\)$" . php-mode)) auto-mode-alist))

;; ------------------------------------------------------------------------
;; @ GNU GLOBAL(gtags)

  (when (locate-library "gtags")
    (require 'gtags)
  )

  (global-set-key "\M-t" 'gtags-find-tag)     ;関数の定義元へ
  (global-set-key "\M-r" 'gtags-find-rtag)    ;関数の参照先へ
  (global-set-key "\M-s" 'gtags-find-symbol)  ;変数の定義元/参照先へ
  (global-set-key "\M-p" 'gtags-find-pattern)
  (global-set-key "\M-f" 'gtags-find-file)    ;ファイルにジャンプ
  (global-set-key [?\C-,] 'gtags-pop-stack)   ;前のバッファに戻る

;; ------------------------------------------------------------------------
;; @ open-junk-file

  (add-to-list 'load-path "~/.emacs.d/elisp/auto-complete")
  (require 'auto-complete-config)
  (ac-config-default)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
