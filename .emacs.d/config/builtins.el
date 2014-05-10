;; ------------------------------------------------------------------------
;; package
;; ------------------------------------------------------------------------
(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; 初期化
(package-initialize)

;; ------------------------------------------------------------------------
;; linum
;; ------------------------------------------------------------------------
;; Display line number
(global-linum-mode t)

;; Line number format
;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d")

;; ------------------------------------------------------------------------
;; iswitchb
;; ------------------------------------------------------------------------
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
(setq iswitchb-prompt-newbuffer nil)

;; ------------------------------------------------------------------------
;; recentf
;; ------------------------------------------------------------------------
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 3000)
(global-set-key "\C-c\C-r" 'recentf-open-files)

;; ------------------------------------------------------------------------
;; @ org

  (require 'org)
  (setq org-log-done 'time) ; DONE時にタイムスタンプ
  (setq org-use-fast-todo-selection t) ; TODO項目の入力補助
  (setq org-startup-truncated nil)
  (setq org-return-follows-link t)
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (org-remember-insinuate)
  (setq org-directory "~/.emacs.d/org-docs/")
  (setq org-default-notes-file (concat org-directory "memo.org"))
  (setq org-remember-templates
        '(("Note" ?n "** %?\n   %i\n   %a\n   %t" nil "Inbox")
         ("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")))
  (define-key global-map (kbd "C-<f9>") 'org-remember) ;key-binding

