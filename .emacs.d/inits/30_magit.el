(quelpa 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))
