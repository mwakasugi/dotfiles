; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
; (add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
; (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

; Disable adding magic comment when saving
(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)
