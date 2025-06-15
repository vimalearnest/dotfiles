(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

(setq dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)

(live-add-packs '("~/src/github/emacs-live-packs/haskell-pack"))
(live-add-packs '("~/src/github/emacs-live-packs/erlang-pack"))
(live-add-packs '("~/src/github/emacs-live-packs/elixir-pack"))
(live-add-packs '("~/src/github/emacs-live-packs/projectile-pack"))
(live-add-packs '("~/src/github/emacs-live-packs/rest-client-pack"))
