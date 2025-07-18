;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :straight t
  :after (general evil)
  :config
  (setq rust-format-on-save t)
  :general
  (:keymaps 'rust-mode-map
            ", r" #'rust-run
            ", t" #'rust-test
            ", b" #'rust-compile))
