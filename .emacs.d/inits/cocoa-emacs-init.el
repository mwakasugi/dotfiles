;; ------------------------------------------------------------------------
;; @ coding system

; Language settings
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; ------------------------------------------------------------------------
;; @ drag and drop to open in a buffer
(setq ns-pop-up-frames nil)

;; ------------------------------------------------------------------------
;; @ Run as server
(server-start)

;; ------------------------------------------------------------------------
;; @ ime

;(setq default-input-method "MacOSX")
;; minibufferは英数モードで始める
;(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;; for Google IME
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

;; ------------------------------------------------------------------------
;; @ font

(create-fontset-from-ascii-font "Ricty Diminished-16:weight=normal:slant=normal" nil "ricty")
(set-fontset-font "fontset-ricty"
                  'unicode
                  (font-spec :family "Ricty Diminished" :size 16)
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


;; ------------------------------------------------------------------------
;; @ Marked Integration
;; ------------------------------------------------------------------------

;(defun markdown-preview-file-with-marked ()
;  "run Marked on the current file and revert the buffer"
;  (interactive)
;  (shell-command
;   (format "open -a /Applications/Marked\\ 2.app %s"
;       (shell-quote-argument (buffer-file-name))))
;)
(defun markdown-preview-file-with-marked ()
  "run Marked on the current file (convert it to markdown in advance if the file is *.org)."
  (interactive)
  (if (string= (file-name-extension buffer-file-name) "org")
      (org-gfm-export-to-markdown) nil)
  (if (file-exists-p (concat (file-name-sans-extension buffer-file-name) ".md"))
      (shell-command
       (format "open -a /Applications/Marked\\ 2.app %s"
	       (shell-quote-argument
		(concat (file-name-sans-extension buffer-file-name) ".md"))))
    (shell-command
     (format "open -a /Applications/Marked\\ 2.app %s"
	     (shell-quote-argument
	      (concat (file-name-sans-extension buffer-file-name) ".markdown"))))))

(global-set-key "\C-cm" 'markdown-preview-file-with-marked)

;; ;; ------------------------------------------------------------------------
;; ;; @ iTerm Integration
;; ;; ------------------------------------------------------------------------
;; ;; They will fail if no shell session is opened in iTerm.
;; (defun execute-on-iterm-current-session (command)
;;   (interactive "MCommand: ")
;;   (do-applescript
;;    (format "tell application \"iTerm\"
;;               activate
;;               tell current session of current terminal
;;                 write text \"%s\"
;;               end tell
;;             end tell"
;;            command)))
;;
;; (defun execute-on-iterm-new-session (command)
;;   (interactive "MCommand: ")
;;   (do-applescript
;;    (format "tell application \"iTerm\"
;;               activate
;;               make new terminal
;;               tell the current terminal
;;                 activate current session
;;                 launch session \"Default Session\"
;;                 tell the last session
;;                   write text \"%s\"
;;                 end tell
;;               end tell
;; 	     end tell"
;;            command)))
;;
;; (defun cd-and-execute-on-iterm-new-session (command)
;;   (interactive "MCommand: ")
;;   (do-applescript
;;    (format "tell application \"iTerm\"
;;               activate
;;               make new terminal
;;               tell the current terminal
;;                 activate current session
;;                 launch session \"Default Session\"
;;                 tell the last session
;;                   write text \"cd %s; clear\"
;;                   write text \"%s\"
;;                 end tell
;;               end tell
;; 	     end tell"
;;            default-directory command)))
;;
;; (defun cd-on-iterm-new-session ()
;;   (interactive)
;;   (execute-on-iterm-new-session (format "cd %s" default-directory)))
;;
;; (global-set-key "\C-ct" 'cd-on-iterm-new-session)
;; (global-set-key "\C-cr" 'cd-and-execute-on-iterm-new-session)

;; ------------------------------------------------------------------------
;; @ Geeknote
;; ------------------------------------------------------------------------
(defun geeknote-create-from-region (beg end)
  "Create a note from selected region via Geeknote"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (setq title
	(format-time-string "%Y-%m-%d %H:%M:%S" (current-time)))
  (setq content
	(format "%s" (if (and beg end)
			 (buffer-substring-no-properties beg end)
		       "")))
  (shell-command
   (format "geeknote create --title '%s' --content '%s'" title content))
  )
