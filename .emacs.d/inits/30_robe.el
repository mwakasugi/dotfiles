(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
;; set ac-auto-start t because robe's default value is 2
(setq ac-auto-start t)

;; helm-robe
(custom-set-variables
 '(robe-completing-read-func 'helm-robe-completing-read))
