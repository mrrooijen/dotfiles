;; -*- lexical-binding: t; -*-

(use-package flycheck
  :straight t
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
