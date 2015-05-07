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

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;;        ___          ___     
;;       /  /\        /  /\    
;;      /  /::\      /  /:/_   
;;     /  /:/\:\    /  /:/ /\  
;;    /  /:/  \:\  /  /:/ /::\ 
;;   /__/:/ \__\:\/__/:/ /:/\:\
;;   \  \:\ /  /:/\  \:\/:/~/:/
;;    \  \:\  /:/  \  \::/ /:/ 
;;     \  \:\/:/    \__\/ /:/  
;;      \  \::/       /__/:/   
;;       \__\/        \__\/   specific settings 
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-

  (setq darwin-p  (eq system-type 'darwin)
        ns-p      (eq window-system 'ns)
        carbon-p  (eq window-system 'mac)
        linux-p   (eq system-type 'gnu/linux)
        cygwin-p  (eq system-type 'cygwin)
        nt-p      (eq system-type 'windows-nt)
        meadow-p  (featurep 'meadow)
        windows-p (or cygwin-p nt-p meadow-p))
  
  ;; Mac - CocoaEmacs
  (when ns-p
    (load "~/.emacs.d/config/cocoa.el"))

  ;; Windows - NTEmacs
  (when nt-p
      (load "~/.emacs.d/config/nt.el"))

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Default settings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-

  ;; Turn off alarms completely
  (setq visible-bell t)
  (setq ring-bell-function 'ignore)

  ;; Do not display Start-up page
  (setq inhibit-startup-message t)

  ;; Do not disspay Menu bar and Tool bar
  (if window-system
    (tool-bar-mode 0))
  (if window-system
    (menu-bar-mode 0))

  ;; Highlight corresponding parens
  (show-paren-mode t)
  (setq show-paren-delay 0)
  (setq show-paren-style 'parenthesis)
  
  ;; Display column number where the cursor is on
  (column-number-mode t)
  
  ;; Display line number where the cursor is on
  (line-number-mode t)
  
  ;; Save where the cursor is on
  (setq-default save-place t)
  
  ;; Kill whole line when pressing C-k at beginning of a line
  (setq kill-whole-line t)
  
  ;; Do not create backup files
  (setq backup-inhibited t)

  ;; Do not create lock files
  (setq create-lockfiles nil)
  
  ;; Cleanup auto save files on exit
  (setq delete-auto-save-files t)
  
  ;; Extend history size
  (setq history-length 10000)
  
  ;; Save mini-buffer history
  (savehist-mode 1)
  
  ;; Extend recentf items to store
  (setq recentf-max-saved-items 10000)

  ;; Transparency settings
  (if window-system 
    (set-frame-parameter nil 'alpha 96))

  ;; Ignore case on completion
  (setq completion-ignore-case t)

  ;; Automatically reload a buffer when changed
  (global-auto-revert-mode 1)

  ;; Make sure to enter newline at the end of the file
  (setq require-final-newline t)

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; key bindings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
  ;; C-h sends backspace
  (keyboard-translate ?\C-h ?\C-?)
  ;; auto indent when newline
  (global-set-key "\C-m" 'newline-and-indent) 
  (global-set-key "\C-j" 'newline) 

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Load builtins elisp settings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
  (load "~/.emacs.d/config/builtins.el")

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Load Addons elisp settings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
  (load "~/.emacs.d/config/addons.el")

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Theme
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
  (load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(robe-completing-read-func (quote helm-robe-completing-read)))
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
 '(whitespace-tab ((t (:foreground "selectedKnobColor" :weight bold)))))
