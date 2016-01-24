(quelpa 'visual-regexp-steroids)
(quelpa 'pcre2el)

(require 'visual-regexp-steroids)

(setq vr/engine 'python)
;; (setq vr/engine 'pcre2el)
(global-set-key (kbd "M-%") 'vr/query-replace)
;; When using multiple-cursors
;; (global-set-key (kbd "C-c m") 'vr/mc-mark)
;; When you want to use as usual isearch
(global-set-key (kbd "C-M-r") 'vr/isearch-backward)
(global-set-key (kbd "C-M-s") 'vr/isearch-forward)
