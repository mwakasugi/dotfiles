;; ------------------------------------------------------------------------
;; @ coding system

  ; Language settings
  (set-language-environment 'Japanese)
  (prefer-coding-system 'utf-8)

;; ------------------------------------------------------------------------
;; @ drag and drop to open in a buffer
(setq ns-pop-up-frames nil)

;; ------------------------------------------------------------------------
;; @ ime

  ;(setq default-input-method "MacOSX")
  ;; minibufferは英数モードで始める
  ;(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; ------------------------------------------------------------------------
;; @ font

  (create-fontset-from-ascii-font "Ricty-16:weight=normal:slant=normal" nil "ricty")
  (set-fontset-font "fontset-ricty"
                    'unicode
                    (font-spec :family "Ricty" :size 16)
                    nil
                    'append)
  (add-to-list 'default-frame-alist '(font . "fontset-ricty"))
  
  ; 行間設定
  (setq-default line-spacing 0.2)
  
;; ------------------------------------------------------------------------
;; @ migemo

  ;; (setq migemo-command "~/.emacs.d/elisp/cmigemo-osx/cmigemo")
  ;; (setq migemo-options '("-q" "--emacs"))
  ;; (setq migemo-dictionary  "~/.emacs.d/elisp/cmigemo-osx/dict/utf-8/migemo-dict")
  ;; (setq migemo-user-dictionary nil)
  ;; (setq migemo-regex-dictionary nil)
  ;; (setq migemo-use-pattern-alist t)
  ;; (setq migemo-use-frequent-pattern-alist t)
  ;; (setq migemo-pattern-alist-length 1024)
  ;; (setq migemo-coding-system 'utf-8-unix)
  ;; (load-library "migemo")
  ;; (migemo-init)
  ;; (set-process-query-on-exit-flag migemo-process nil)

