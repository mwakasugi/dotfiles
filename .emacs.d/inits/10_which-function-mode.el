(setq which-func-unknown "n/a")

;; Show the current function name in the header line
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))

(custom-set-faces
 '(which-func ((t (:foreground "#d33682")))))

(add-to-list 'which-func-modes 'php-mode)
(add-to-list 'which-func-modes 'python-mode)
(add-to-list 'which-func-modes 'ruby-mode)
(add-to-list 'which-func-modes 'enh-ruby-mode)
(add-to-list 'which-func-modes 'emacs-lisp-mode)
