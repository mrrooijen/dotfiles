;; -*- lexical-binding: t; -*-

(use-package markdown-mode
  :straight t
  :hook (markdown-mode-hook . (lambda () (outline-hide-body))))
