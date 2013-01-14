;; ------------------------------------------------------------------------
;; @ linum

   ;; バッファ中の行番号表示
   (global-linum-mode t)

   ;; 行番号のフォーマット
   ;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
   (set-face-attribute 'linum nil :height 0.8)
   (setq linum-format "%4d")

;; ------------------------------------------------------------------------
;; @ iswitchb

  (iswitchb-mode 1)
  (setq read-buffer-function 'iswitchb-read-buffer)
  (setq iswitchb-regexp nil)
  (setq iswitchb-prompt-newbuffer nil)

;; ------------------------------------------------------------------------
;; @ org

  (require 'org)
  (setq org-log-done 'time) ; DONE時にタイムスタンプ
  (setq org-use-fast-todo-selection t) ; TODO項目の入力補助
  (setq org-startup-truncated nil)
  (setq org-return-follows-link t)
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (org-remember-insinuate)
  (setq org-directory "~/.emacs.d/org-docs/")
  (setq org-default-notes-file (concat org-directory "memo.org"))
  (setq org-remember-templates
        '(("Note" ?n "** %?\n   %i\n   %a\n   %t" nil "Inbox")
         ("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")))
  (define-key global-map (kbd "C-<f9>") 'org-remember) ;key-binding

  ;; MobileOrg
  ;; MobileOrgで新しく作ったノートを保存するファイルの名前を設定
  (setq org-mobile-inbox-for-pull "~/.emacs.d/org-docs/flagged.org")
  ;; Dropbox直下のMobileOrgフォルダへのパスを設定
  (setq org-mobile-directory "~/Dropbox/MobileOrg")
  ;; 同期するファイル
  (setq org-agenda-files `("~/.emacs.d/org-docs/memo.org"))
