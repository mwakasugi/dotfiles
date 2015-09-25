(setq org-src-fontify-natively t)

(require 'org-install)
(setq org-directory "~/Dropbox/Documents/org/")
(setq org-default-notes-file (concat org-directory "lifelog.org"))
(require 'org-capture)
(setq org-capture-templates
  '(("t" "Task" entry (file+headline nil "Inbox")
     "** TODO %?\n %T\n %a\n %i\n")
    ("n" "Note" entry (file+headline (concat org-directory "notes.org") "Notes")
     "* %?\n %U\n %i")))

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
 '(org-level-8 ((t (:inherit variable-pitch :foreground "#268bd2" :family "Ricty Diminished")))))
