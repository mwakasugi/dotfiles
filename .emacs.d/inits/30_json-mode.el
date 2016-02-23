(quelpa 'json-mode)

;; Overwrite json-mode-beautify to preserve the original unicode content with Python.
(defconst json-mode-beautify-command-python2
  "python2 -c \"import sys,json,collections; data=json.loads(sys.stdin.read(),object_pairs_hook=collections.OrderedDict); print json.dumps(data,sort_keys=%s,indent=2,separators=(',',': ')).decode('unicode_escape').encode('utf8','replace')\"")
(defconst json-mode-beautify-command-python3
  "python3 -c \"import sys,json,codecs,collections; data=json.loads(sys.stdin.read(),object_pairs_hook=collections.OrderedDict); print((codecs.getdecoder('unicode_escape')(json.dumps(data,sort_keys=%s,indent=2,separators=(',',': '))))[0])\"")

(eval-after-load "json-mode"
  '(defun json-mode-beautify (&optional preserve-key-order)
     "Beautify / pretty-print from BEG to END, and optionally PRESERVE-KEY-ORDER."
     (interactive "P")
     (shell-command-on-region (if (use-region-p) (region-beginning) (point-min))
                              (if (use-region-p) (region-end) (point-max))
                              (concat (if (executable-find "env") "env " "")
                                      (format (if (executable-find "python2")
                                                  json-mode-beautify-command-python2
                                                json-mode-beautify-command-python3)
                                              (if preserve-key-order "False" "True")))
                              (current-buffer) t)))

(add-to-list 'auto-mode-alist '("\\.json" . json-mode))
