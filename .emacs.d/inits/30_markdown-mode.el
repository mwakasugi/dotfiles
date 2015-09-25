(quelpa 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(setq markdown-css-paths (expand-file-name "~/.github.css"))
(setq markdown-command "export LANG=ja_JP.UTF-8; markdown_py -x linkify -x del_ins -x fenced_code -x 'codehilite(css_class=highlight)' -x tables")

(quelpa '(ox-gfm :repo "larstvei/ox-gfm" :fetcher github) :upgrade nil)
