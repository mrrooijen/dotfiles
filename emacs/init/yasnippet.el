
;; -*- lexical-binding: t; -*-
;;; yasnippet.el --- Snippet expansion configuration

;;; Commentary:
;;; Sets up yasnippet and snippet loading for Emacs.

;;; Code:

(use-package yasnippet
  :straight t
  :config
  (add-to-list 'load-path "~/.dotfiles/emacs/snippets")
  (yas-global-mode 1))

(use-package yasnippet-snippets :straight t)
