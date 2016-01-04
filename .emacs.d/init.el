;;        ____ ____ ____ ____ ____ ____ ____
;;       ||i |||n |||i |||t |||. |||e |||l ||
;;       ||__|||__|||__|||__|||__|||__|||__||
;;       |/__\|/__\|/__\|/__\|/__\|/__\|/__\|
;;
;;   ……………../´¯/)……….. (\¯`\
;;    ……………/….//……….. …\\….\
;; ……………../….//………… ….\\….\
;;      ……../´¯/…./´¯\………../¯ `\….\¯`\
;;      .././…/…./…./.|_……_| .\….\….\…\.\..
;;      (.(….(….(…./.)..)..(..(. \….)….)….).)
;;  …….\…………….\/…/….\. ..\/……………./
;;      ..\…………….. /……..\………………/
;;      ….\…………..(………. ..)……………./
;;    ………\………….\……… ../…………./

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(quelpa 'init-loader)

(byte-recompile-directory (concat user-emacs-directory "inits/") 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(init-loader-show-log-after-init nil)
 '(package-selected-packages
   (quote
    (let-alist yasnippet yaml-mode web-mode virtualenvwrapper twittering-mode stylus-mode solarized-theme smartparens slim-mode scss-mode ruby-block rspec-mode robe rainbow-delimiters quickrun quelpa php-mode ox-gfm open-junk-file nyan-mode minitest migemo markdown-mode magit js2-mode jedi jade-mode init-loader helm-robe helm-projectile helm-gtags helm-git-grep helm-ag haskell-mode go-mode git-gutter flycheck exec-path-from-shell evil-surround evil-search-highlight-persist evil-rails evil-numbers evil-matchit enh-ruby-mode elm-mode elixir-mode dockerfile-mode dash-at-point crystal-mode coffee-mode browse-at-remote)))
 '(robe-completing-read-func (quote helm-robe-completing-read)))
(init-loader-load (concat user-emacs-directory "inits/"))

(add-to-list 'load-path (concat user-emacs-directory "elisp/"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-5 ((t (:inherit variable-pitch :foreground "#2aa198" :family "Ricty Diminished"))))
 '(org-level-6 ((t (:inherit variable-pitch :foreground "#859900" :family "Ricty Diminished"))))
 '(org-level-7 ((t (:inherit variable-pitch :foreground "#dc322f" :family "Ricty Diminished"))))
 '(org-level-8 ((t (:inherit variable-pitch :foreground "#268bd2" :family "Ricty Diminished"))))
 '(which-func ((t (:foreground "#d33682"))))
 '(whitespace-tab ((t (:foreground "selectedKnobColor" :weight bold)))))
