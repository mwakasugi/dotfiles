(quelpa 'helm)
(quelpa 'helm-ag)
(quelpa 'helm-git-grep)
(quelpa 'helm-gtags)
(quelpa 'helm-robe)

(helm-mode t)

(add-hook 'php-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'enh-ruby-mode-hook (lambda () (helm-gtags-mode)))
