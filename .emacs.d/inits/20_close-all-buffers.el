(defun close-all-buffers ()
(interactive)
  (mapc 'kill-buffer (buffer-list)))
