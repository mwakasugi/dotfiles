
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
(add-hook 'evil-normal-state-entry-hook 'mac-change-language-to-us)

(setq evil-want-C-u-scroll t
      Evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t)

(require 'evil)
(evil-mode 1)

;; Enable Emacs key-bindings on insert state
(setcdr evil-insert-state-map nil)

;; ESC to exit insert state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

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
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-dwim t)

;;(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'coffee-mode)

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
;;(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
;; set ac-auto-start t because robe's default value is 2
(setq ac-auto-start t)

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
;;(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
(add-hook 'coffee-mode-hook 'flycheck-mode)

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
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode t)

;;
;; magit

;;
;; helm-ag

;;
;; helm-ls-git

;;
;; enhanced-ruby-mode
;;(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;;(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
;;(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
;;(add-hook 'enh-ruby-mode-hook 'smartparens-mode)

;;
;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(setq markdown-css-path (expand-file-name "~/.github.css"))
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


;;
;; gist

;;
;; yaml-mode

;;
;; dash-at-point
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; =====================================================================
;; Addon key bindings
;; =====================================================================
(define-key global-map (kbd "<f2>") 'helm-ls-git-ls)
(define-key global-map (kbd "<f3>") 'helm-ag)

