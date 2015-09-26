(quelpa 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(add-hook 'scss-mode-hook
	  (lambda()
	    (setq css-indent-offset 2)
	    (setq scss-compile-at-save nil)
	    (flycheck-mode)
	    (setq indent-tabs-mode nil)))
