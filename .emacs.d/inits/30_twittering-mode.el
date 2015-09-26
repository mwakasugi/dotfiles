(quelpa 'twittering-mode)

;; Password authorizatin on launch (* gpg command is needed)
(setq twittering-use-master-password t)
;; Password encryption file is stored in (* Default: home directory)
(setq twittering-private-info-file "~/.emacs.d/twittering-mode.gpg")
(setq twittering-status-format "%i %S @%s %p : %C{%H:%M:%S} : tweet by %f %R : %L\n%T\n----------------------------------------------------------------")
(setq twittering-icon-mode t)
;; Change icon size. imagemagick command is needed if you want rather than 48px
; (setq twittering-convert-fix-size 24)
(setq twittering-timer-interval 300)
(setq twittering-number-of-tweets-on-retrieval 50)
;; 'o' to open URL in a web browser
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key (kbd "o")
               (lambda ()
                 (interactive)
                 (twittering-goto-next-uri)
                 (execute-kbd-macro (kbd "C-m"))
                 ))
	    ;; Evilのキーバインドが上書きされるので再設定。適当...
	    (local-unset-key (kbd "g"))
	    (local-set-key "gg" 'evil-goto-first-line)
	    (local-unset-key (kbd "k"))
	    (local-set-key "k" 'evil-previous-line)
	    (local-unset-key (kbd "j"))
	    (local-set-key "j" 'evil-next-line)))
;; Load bit.ly API setings
;; (setq twittering-tinyurl-service 'bit.ly)
;; (setq twittering-bitly-login "USERNAME")
;; (setq twittering-bitly-api-key "API-KEY")
(load "~/Dropbox/extra-dotfiles/bitly.el")
