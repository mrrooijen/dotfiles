;; -*- lexical-binding: t; -*-

(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)

(add-to-list 'load-path "~/.dotfiles/emacs/snippets")

(yas-global-mode 1)
