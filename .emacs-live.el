(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

(setq dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)
