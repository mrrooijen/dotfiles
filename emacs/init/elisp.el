;; -*- lexical-binding: t; -*-

(use-package elisp-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'parinfer-mode))
