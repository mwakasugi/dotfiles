(quelpa 'auto-complete)

(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
(setq ac-dwim t)
(global-auto-complete-mode t)

(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'crystal-mode)
(add-to-list 'ac-modes 'slim-mode)
(add-to-list 'ac-modes 'scss-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'gfm-mode)
(add-to-list 'ac-modes 'elixir-mode)

(add-to-list 'ac-modes 'eshell-mode)
(ac-define-source pcomplete
  '((candidates . pcomplete-completions)))
(defun my-ac-eshell-mode ()
  (setq ac-sources
        '(ac-source-pcomplete
          ac-source-filename
          ac-source-files-in-current-dir
          ac-source-words-in-buffer
          ac-source-dictionary)))
(add-hook 'eshell-mode-hook
          (lambda ()
            (my-ac-eshell-mode)
            (define-key eshell-mode-map (kbd "C-i") 'auto-complete)
            (define-key eshell-mode-map [(tab)] 'auto-complete)))
