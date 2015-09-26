;;        ____ ____ ____ ____ ____ ____ ____
;;       ||i |||n |||i |||t |||. |||e |||l ||
;;       ||__|||__|||__|||__|||__|||__|||__||
;;       |/__\|/__\|/__\|/__\|/__\|/__\|/__\|
;;
;;   ……………../´¯/)……….. (\¯`\
;;    ……………/….//……….. …\\….\
;; ……………../….//………… ….\\….\
;;      ……../´¯/…./´¯\………../¯ `\….\¯`\
;;      .././…/…./…./.|_……_| .\….\….\…\.\..
;;      (.(….(….(…./.)..)..(..(. \….)….)….).)
;;  …….\…………….\/…/….\. ..\/……………./
;;      ..\…………….. /……..\………………/
;;      ….\…………..(………. ..)……………./
;;    ………\………….\……… ../…………./

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(quelpa 'init-loader)

(custom-set-variables '(init-loader-show-log-after-init nil))
(init-loader-load (concat user-emacs-directory "inits/"))

(add-to-list 'load-path (concat user-emacs-directory "elisp/"))
