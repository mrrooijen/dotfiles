;; -*- lexical-binding: t; -*-

(use-package markdown-mode
  :straight t
  :hook (markdown-mode . (lambda () (outline-hide-body))))
