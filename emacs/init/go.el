;; -*- lexical-binding: t; -*-

(straight-use-package 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'gofmt-before-save nil t)))
