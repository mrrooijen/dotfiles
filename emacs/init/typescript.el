;; -*- lexical-binding: t; -*-

(use-package typescript-mode
  :straight t
  :config
  (setq typescript-indent-level 2))

(use-package tide
  :straight t
  :hook ((typescript-mode-hook . tide-setup)
         (typescript-mode-hook . tide-hl-identifier-mode)
         (before-save-hook . tide-format-before-save)))
