;; =====================================================================
;; Install addon packages if not yet installed
;; =====================================================================
(require 'cl)

(defvar installing-package-list
  '(
    init-loader
    evil
    evil-surround
    evil-numbers
    evil-matchit
    evil-search-highlight-persist
    exec-path-from-shell
    auto-complete
    git-gutter
    jedi
    inf-ruby
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
    elixir-mode
    dockerfile-mode
    go-mode
    migemo
    minitest
    ruby-block
    quickrun
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
