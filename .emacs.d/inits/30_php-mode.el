(quelpa 'php-mode)

(add-hook 'php-mode-hook
          '(lambda()
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)
             (c-set-offset 'case-label' 4)
             (c-set-offset 'arglist-intro' 4)
             (c-set-offset 'arglist-cont-nonempty' 4)
             (c-set-offset 'arglist-close' 0)
             ))

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
