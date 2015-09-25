;; =====================================================================
;; Install addon packages if not yet installed
;; =====================================================================
(require 'cl)

(defvar installing-package-list
  '(
    ; auto-complete
    ; coffee-mode
    ; dash-at-point
    ; dockerfile-mode
    ; elixir-mode
    ; enh-ruby-mode
    ; evil
    ; evil-matchit
    ; evil-numbers
    ; evil-search-highlight-persist
    ; evil-surround
    ; exec-path-from-shell
    ; flycheck
    ; git-gutter
    ; go-mode
    ; helm
    ; helm-ag
    ; helm-git-grep
    ; helm-gtags
    ; helm-projectile
    ; helm-robe
    ; inf-ruby
    ; init-loader
    ; jade-mode
    ; jedi
    ; js2-mode
    ; magit
    ; markdown-mode
    ; migemo
    ; minitest
    ; nyan-mode
    open-junk-file
    php-mode
    quickrun
    rainbow-delimiters
    rainbow-mode
    robe
    rspec-mode
    ruby-block
    scss-mode
    slim-mode
    smartparens
    solarized-theme
    ; stylus-mode
    twittering-mode
    undo-tree
    virtualenvwrapper
    web-mode
    yaml-mode
    yasnippet
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
