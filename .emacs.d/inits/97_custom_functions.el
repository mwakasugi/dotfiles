(defun copy-file-path ()
  "show the full path file name in the minibuffer and copy to kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))
    (message (buffer-file-name))))

(defun name-of-the-file ()
  "Gets the name of the file the current buffer is based on."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))
