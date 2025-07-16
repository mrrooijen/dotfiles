;; -*- lexical-binding: t; -*-

(straight-use-package 'markdown-mode)

(add-hook 'markdown-mode-hook (lambda () (outline-hide-body)))
