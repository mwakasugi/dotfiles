(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 3000)
(global-set-key "\C-c\h" 'recentf-open-files)
