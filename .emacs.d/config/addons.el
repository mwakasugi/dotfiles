;; =====================================================================
;; Install addon packages if not yet installed
;; =====================================================================
(require 'cl)

(defvar installing-package-list
  '(
    evil
    evil-surround
    evil-numbers
    evil-matchit
    evil-search-highlight-persist
    exec-path-from-shell
    auto-complete
    git-gutter
    jedi
    robe
    flycheck
    virtualenvwrapper
    helm
    helm-ag
    helm-git-grep
    helm-gtags
    helm-projectile
    helm-robe
    magit
    smartparens
    open-junk-file
    undo-tree
    dash-at-point
    yasnippet
    rainbow-delimiters
    nyan-mode
    coffee-mode
    jade-mode
    markdown-mode
    scss-mode
    slim-mode
    stylus-mode
    yaml-mode
    rainbow-mode
    twittering-mode
    rspec-mode
    enh-ruby-mode
    solarized-theme
    js2-mode
    php-mode
    web-mode
    migemo
    minitest
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

;; =====================================================================
;;  ________  ____   ____  _____  _____     
;; |_   __  ||_  _| |_  _||_   _||_   _|    
;;   | |_ \_|  \ \   / /    | |    | |      
;;   |  _| _    \ \ / /     | |    | |   _  
;;  _| |__/ |    \ ' /     _| |_  _| |__/ | 
;; |________|     \_/     |_____||________| 
;;                                          
;; =====================================================================
;; Turn off IME when exiting insert state
;(add-hook 'evil-normal-state-entry-hook 'mac-change-language-to-us)

(setq evil-want-C-u-scroll t
      Evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t)

(evil-mode 1)

;; Enable Emacs key-bindings on insert state
(setcdr evil-insert-state-map nil)

;; ESC to exit insert state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-surround
(global-evil-surround-mode 1)
;; evil-numbers
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
;; evil-matchit
(global-evil-matchit-mode 1)
;; evil-search-highlight-persist
(global-evil-search-highlight-persist t)

;; use with NeoTree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
	    (define-key evil-normal-state-local-map (kbd "?") 'describe-mode)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; =====================================================================
;;                                                                 _ _
;;                          _/_/        /)                   /    ////
;;   _ _., _ _.---   _  __. / /_ ---   //__ ________ --- _  /_ _ //// 
;;  <// /\</(__     /_)(_/|<_/ /_     /// ((_) / / <_   /_)/ /</</</_ 
;;                 /                 />                               
;;               '                </                               
;; =====================================================================
(exec-path-from-shell-initialize)

;; =====================================================================
;;     _  _   _ _____ ___       ___ ___  __  __ ___ _    ___ _____ ___ 
;;    /_\| | | |_   _/ _ \ ___ / __/ _ \|  \/  | _ \ |  | __|_   _| __|
;;   / _ \ |_| | | || (_) |___| (_| (_) | |\/| |  _/ |__| _|  | | | _| 
;;  /_/ \_\___/  |_| \___/     \___\___/|_|  |_|_| |____|___| |_| |___|
;;                                                                     
;; =====================================================================
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-dwim t)

(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'slim-mode)
(add-to-list 'ac-modes 'scss-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'gfm-mode)

;; =====================================================================
;;      _____  ________  _______   ______ 
;;     /     |/        |/       \ /      |
;;     $$$$$ |$$$$$$$$/ $$$$$$$  |$$$$$$/ 
;;        $$ |$$ |__    $$ |  $$ |  $$ |  
;;   __   $$ |$$    |   $$ |  $$ |  $$ |  
;;  /  |  $$ |$$$$$/    $$ |  $$ |  $$ |  
;;  $$ \__$$ |$$ |_____ $$ |__$$ | _$$ |_ 
;;  $$    $$/ $$       |$$    $$/ / $$   |
;;   $$$$$$/  $$$$$$$$/ $$$$$$$/  $$$$$$/ 
;; =====================================================================
(require 'epc)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; =====================================================================
;;                                                                 
;; 8 888888888o.      ,o888888o.     8 888888888o   8 8888888888   
;; 8 8888    `88.  . 8888     `88.   8 8888    `88. 8 8888         
;; 8 8888     `88 ,8 8888       `8b  8 8888     `88 8 8888         
;; 8 8888     ,88 88 8888        `8b 8 8888     ,88 8 8888         
;; 8 8888.   ,88' 88 8888         88 8 8888.   ,88' 8 888888888888 
;; 8 888888888P'  88 8888         88 8 8888888888   8 8888         
;; 8 8888`8b      88 8888        ,8P 8 8888    `88. 8 8888         
;; 8 8888 `8b.    `8 8888       ,8P  8 8888      88 8 8888         
;; 8 8888   `8b.   ` 8888     ,88'   8 8888    ,88' 8 8888         
;; 8 8888     `88.    `8888888P'     8 888888888P   8 888888888888 
;;
;; =====================================================================
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
;; set ac-auto-start t because robe's default value is 2
(setq ac-auto-start t)

;; helm-robe
(custom-set-variables
 '(robe-completing-read-func 'helm-robe-completing-read))

;; =====================================================================
;;     ___  _                  _                    _     
;;   /'___)(_ )               ( )                  ( )    
;;  | (__   | |  _   _    ___ | |__     __     ___ | |/') 
;;  | ,__)  | | ( ) ( ) /'___)|  _ `\ /'__`\ /'___)| , <  
;;  | |     | | | (_) |( (___ | | | |(  ___/( (___ | |\`\ 
;;  (_)    (___)`\__, |`\____)(_) (_)`\____)`\____)(_) (_)
;;              ( )_| |                                   
;;              `\___/'                                   
;; =====================================================================
(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
(add-hook 'coffee-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; =====================================================================
;;      o  +           +        +
;;  +        o     o       +        o
;;  -_-_-_-_-_-_-_,------,      o 
;;  _-_-_-_-_-_-_-|   /\_/\  
;;  -_-_-_-_-_-_-~|__( ~ .~)  +     +  
;;  _-_-_-_-_-_-_-""  ""      
;;  +      o         o   +       o
;;      +         +
;; =====================================================================
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)

;; =====================================================================
;;             .          .                                             
;;  .  , . ,-. |- . . ,-. |  ,-. ,-. .  , . , , ,-. ,-. ,-. ,-. ,-. ,-. 
;;  | /  | |   |  | | ,-| |  |-' | | | /  |/|/  |   ,-| | | | | |-' |   
;;  `'   ' '   `' `-^ `-^ `' `-' ' ' `'   ' '   '   `-^ |-' |-' `-' '   
;;                                                      |   |           
;;                                                      '   '          
;; =====================================================================
(require 'virtualenvwrapper)
(setq venv-location "~/.virtualenvs")

;; =====================================================================
;;  _____                            _   _      _
;; | ____|_ __ ___   __ _  ___ ___  | | | | ___| |_ __ ___
;; |  _| | '_ ` _ \ / _` |/ __/ __| | |_| |/ _ \ | '_ ` _ \
;; | |___| | | | | | (_| | (__\__ \ |  _  |  __/ | | | | | |
;; |_____|_| |_| |_|\__,_|\___|___/ |_| |_|\___|_|_| |_| |_|
;; 
;; =====================================================================
(helm-mode t)

;; ------------------------------------------------------------------------
;; org
;; Place org settings here because builtin org is outdated.
;; ------------------------------------------------------------------------
(setq org-src-fontify-natively t)
(custom-set-faces
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900" :height 1.0 :family "Ricty Diminished"))))
 '(org-level-5 ((t (:inherit variable-pitch :foreground "#2aa198" :family "Ricty Diminished"))))
 '(org-level-6 ((t (:inherit variable-pitch :foreground "#859900" :family "Ricty Diminished"))))
 '(org-level-7 ((t (:inherit variable-pitch :foreground "#dc322f" :family "Ricty Diminished"))))
 '(org-level-8 ((t (:inherit variable-pitch :foreground "#268bd2" :family "Ricty Diminished")))))
(require 'org-install)
(setq org-directory "~/Dropbox/Documents/org/")
(setq org-default-notes-file (concat org-directory "lifelog.org"))
(require 'org-capture)
(setq org-capture-templates
  '(("t" "Task" entry (file+headline nil "Inbox")
     "** TODO %?\n %T\n %a\n %i\n")
    ("n" "Note" entry (file+headline (concat org-directory "notes.org") "Notes")
     "* %?\n %U\n %i")))

(global-set-key (kbd "C-c c") 'org-capture)

;;
;; magit

;;
;; helm-ag

;;
;; helm-ls-git

;;
;; helm-git-grep

;;
;; helm-gtags
(require 'helm-gtags)
(add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))  
(add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))                         
(add-hook 'enh-ruby-mode-hook (lambda () (helm-gtags-mode)))                         
(setq helm-gtags-path-style 'root)                       
(setq helm-gtags-auto-update t)
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-g") 'helm-gtags-dwim)
             (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
             (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
             (local-set-key (kbd "M-n") 'helm-gtags-next-history)))    

;;
;; enhanced-ruby-mode
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cr$" . enh-ruby-mode))

; Disable adding magic comment when saving
(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)

;;
;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(setq markdown-css-paths (expand-file-name "~/.github.css"))
(setq markdown-command "export LANG=ja_JP.UTF-8; markdown_py -x linkify -x del_ins -x fenced_code -x 'codehilite(css_class=highlight)' -x tables")

;;
;; jade-mode
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;;
;; slim-mode

;;
;; coffee-mode
;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))

;;smartparens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

;;
;; gist

;;
;; yaml-mode

;;
;; rainbow-mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;;
;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)
(add-hook 'enh-ruby-mode-hook 'rainbow-delimiters-mode)
(add-hook 'php-mode-hook 'rainbow-delimiters-mode)

;;
;; dash-at-point
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; scss-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))

;; sass-mode

;; rspec-mode
;; not to use "rake spec" instead of simply "spec"
(setq rspec-use-rake-when-possible nil)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/my-snippets" 
	"~/.emacs.d/yasnippet-snippets"
        ))
(yas-global-mode 1)

;; open-junk-file
(require 'open-junk-file)
(setq open-junk-file-format "~/Dropbox/Documents/junk/%Y/%m/%Y-%m-%d-%H%M%S.")

;; twittering-mode
;; Password authorizatin on launch (* gpg command is needed)
(setq twittering-use-master-password t)
;; Password encryption file is stored in (* Default: home directory)
(setq twittering-private-info-file "~/.emacs.d/twittering-mode.gpg")
(setq twittering-status-format "%i %S @%s %p : %C{%H:%M:%S} : tweet by %f %R : %L\n%T\n----------------------------------------------------------------")
(setq twittering-icon-mode t)
;; Change icon size. imagemagick command is needed if you want rather than 48px
; (setq twittering-convert-fix-size 24)
(setq twittering-timer-interval 300)
(setq twittering-number-of-tweets-on-retrieval 50)
;; 'o' to open URL in a web browser
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key (kbd "o")
               (lambda ()
                 (interactive)
                 (twittering-goto-next-uri)
                 (execute-kbd-macro (kbd "C-m"))
                 ))
	    ;; Evilのキーバインドが上書きされるので再設定。適当...
	    (local-unset-key (kbd "g"))
	    (local-set-key "gg" 'evil-goto-first-line)
	    (local-unset-key (kbd "k"))
	    (local-set-key "k" 'evil-previous-line)
	    (local-unset-key (kbd "j"))
	    (local-set-key "j" 'evil-next-line)))
;; Load bit.ly API setings
;; (setq twittering-tinyurl-service 'bit.ly)
;; (setq twittering-bitly-login "USERNAME")
;; (setq twittering-bitly-api-key "API-KEY")
(load "~/Dropbox/extra-dotfiles/bitly.el")

;; =====================================================================
;; Addon key bindings
;; =====================================================================
(global-set-key (kbd "<f3>") 'helm-ag)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c b") 'helm-bookmarks)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c j") 'helm-projectile)
(global-set-key (kbd "C-c k") 'helm-projectile-ag)
(global-set-key (kbd "C-c v") 'minitest-verify)
(global-set-key (kbd "C-c s") 'minitest-verify-single)
(global-set-key (kbd "C-c r") 'minitest-rerun)
(global-set-key (kbd "C-c a") 'minitest-verify-all)

;; =====================================================================
;; additional load-path and packages
;; =====================================================================
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'ox-gfm)

;; =====================================================================
;; Migemo
;; =====================================================================
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

(setq migemo-command "cmigemo")
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

;; =====================================================================
;; DDSKK
;; =====================================================================
(add-to-list 'load-path "~/.emacs.d/elisp/skk")
(setq skk-user-directory "~/Dropbox/extra-dotfiles/ddskk")
(when (require 'skk-autoloads nil t)
(define-key global-map (kbd "C-x C-j") 'skk-mode)
(setq skk-byte-compile-init-file t))

;; =====================================================================
;; inf-ruby
;; =====================================================================
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

;; =====================================================================
;; git-gutter
;; =====================================================================
(global-git-gutter-mode t)
(git-gutter:linum-setup)

;; =====================================================================
;; php-mode
;; =====================================================================
(add-hook 'php-mode-hook
  '(lambda()
     (c-set-offset 'arglist-intro '+)
     (c-set-offset 'arglist-close 0)
     (setq tab-width 4)
     (setq indent-tabs-mode t)
     (setq c-basic-offset 4)
   ))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; =====================================================================
;; web-mode
;; =====================================================================
(add-to-list 'auto-mode-alist '("\\.ctp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
