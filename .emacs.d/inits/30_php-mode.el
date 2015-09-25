(add-hook 'php-mode-hook
  '(lambda()
     (c-set-offset 'arglist-intro '+)
     (c-set-offset 'arglist-close 0)
     (setq tab-width 4)
     (setq indent-tabs-mode t)
     (setq c-basic-offset 4)
   ))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
