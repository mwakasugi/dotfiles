(which-function-mode)

(setq which-func-unknown "N/A")

(setq mode-line-misc-info (delete (assoc 'which-func-mode
                                      mode-line-misc-info) mode-line-misc-info)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))

(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                          mode-line-misc-info) mode-line-misc-info)
          header-line-format which-func-header-line-format)))

(custom-set-faces
 '(which-func ((t (:foreground "rosy brown")))))

(add-to-list 'which-func-modes 'php-mode)
(add-to-list 'which-func-modes 'python-mode)
(add-to-list 'which-func-modes 'ruby-mode)
(add-to-list 'which-func-modes 'enh-ruby-mode)
(add-to-list 'which-func-modes 'emacs-lisp-mode)
