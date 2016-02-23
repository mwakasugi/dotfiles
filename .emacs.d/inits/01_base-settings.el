;; Turn off alarms completely
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Do not display Start-up page
(setq inhibit-startup-message t)

;; Do not disspay Menu bar and Tool bar
(if window-system
    (tool-bar-mode 0))
(if window-system
    (menu-bar-mode 0))
(if window-system
    (scroll-bar-mode 0))

;; Highlight current line
(global-hl-line-mode t)

;; Highlight corresponding parens
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; Display column number where the cursor is on
(column-number-mode t)

;; Display line number where the cursor is on
(line-number-mode t)

;; Save where the cursor is on
(setq-default save-place t)

;; Kill whole line when pressing C-k at beginning of a line
(setq kill-whole-line t)

;; Do not create backup files
(setq backup-inhibited t)

;; Do not create lock files
(setq create-lockfiles nil)

;; Cleanup auto save files on exit
(setq delete-auto-save-files t)

;; Extend history size
(setq history-length 10000)

;; Save mini-buffer history
(savehist-mode 1)

;; Extend recentf items to store
(setq recentf-max-saved-items 10000)

;; Transparency settings
(if window-system
    (set-frame-parameter nil 'alpha 95))

;; Ignore case on completion
(setq completion-ignore-case t)

;; Automatically reload a buffer when changed
(global-auto-revert-mode 1)

;; Make sure to enter newline at the end of the file
(setq require-final-newline t)

;; ;; Set markdown mode to scratch buffer
;; (when (require 'markdown-mode nil t)
;;   (setq
;;    initial-major-mode 'markdown-mode
;;    initial-scratch-message "Scratch\n========\n\n"))
