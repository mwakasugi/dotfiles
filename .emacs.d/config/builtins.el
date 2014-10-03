;; ------------------------------------------------------------------------
;; package
;; ------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
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
;; ediff
;; ------------------------------------------------------------------------
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; ------------------------------------------------------------------------
;; uniquify
;; ------------------------------------------------------------------------
;; clearly distinguish the same file names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ------------------------------------------------------------------------
;; org
;; ------------------------------------------------------------------------
(require 'org)
(setq org-log-done 'time)
(setq org-use-fast-todo-selection t)
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

;; ------------------------------------------------------------------------
;; ruby-mode
;; -----------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(add-hook 'ruby-mode-hook
  '(lambda ()
     (smartparens-mode t)))
