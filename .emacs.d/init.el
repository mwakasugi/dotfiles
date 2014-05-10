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
  (setq show-paren-style 'expression)
  
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

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Load builtins elisp settings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-

  (load "~/.emacs.d/config/init-package.el")
  (load "~/.emacs.d/config/init-recentf.el")
  (load "~/.emacs.d/config/init-linum.el")
  (load "~/.emacs.d/config/init-iswitchb.el")

;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
;; Load Addons elisp settings
;; *-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-*-.-
  (load "~/.emacs.d/config/addons.el")

  (load-theme 'tango-dark t)


