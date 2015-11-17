(quelpa 'epc)
(quelpa 'python)
(quelpa 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
