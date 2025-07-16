;; -*- lexical-binding: t; -*-

(straight-use-package 'typescript-mode)
(straight-use-package 'tide)

(setq typescript-indent-level 2)

(add-hook 'typescript-mode-hook #'tide-setup)
(add-hook 'typescript-mode-hook #'tide-hl-identifier-mode)
(add-hook 'before-save-hook #'tide-format-before-save)
