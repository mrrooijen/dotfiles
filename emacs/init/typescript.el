;; -*- lexical-binding: t; -*-

(use-package typescript-mode
  :straight t
  :config
  (setq typescript-indent-level 2))

(use-package tide
  :straight t
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
