;; C-h sends backspace
(keyboard-translate ?\C-h ?\C-?)
;; auto indent when newline
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

(global-set-key "\C-c\C-r" 'window-resizer)
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; Do not minimize with C-z
(global-set-key "\C-z" 'scroll-down)

;; =====================================================================
;; Addon key bindings
;; =====================================================================
(global-set-key (kbd "<f3>") 'helm-ag)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c b") 'helm-bookmarks)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c j") 'helm-projectile)
(global-set-key (kbd "C-c k") 'helm-projectile-ag)
(global-set-key (kbd "C-c l") 'helm-resume)
(global-set-key (kbd "C-c v") 'minitest-verify)
;; (global-set-key (kbd "C-c s") 'minitest-verify-single)
;; (global-set-key (kbd "C-c r") 'minitest-rerun)
;; (global-set-key (kbd "C-c a") 'minitest-verify-all)
(global-set-key (kbd "C-c r") 'quickrun)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c e") 'dash-at-point-with-docset)
(global-set-key (kbd "C-c o") 'browse-at-remote)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; evil-numbers
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
;; Use Evil with NeoTree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "?") 'describe-mode)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-g") 'helm-gtags-dwim)
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-f") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "M-,") 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-.") 'helm-eshell-history)))

;; =====================================================================
;; Custom Functions
;; =====================================================================
(global-set-key (kbd "C-c f") 'name-of-the-file)
