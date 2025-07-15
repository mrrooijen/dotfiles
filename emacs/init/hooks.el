;; -*- lexical-binding: t; -*-

(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'markdown-mode)
              (delete-trailing-whitespace))))
