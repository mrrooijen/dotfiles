;; -*- lexical-binding: t; -*-

(straight-use-package 'rust-mode)

(setq rust-format-on-save t)

(with-eval-after-load 'rust-mode
  (define-key rust-mode-map (kbd ", r") #'rust-run)
  (define-key rust-mode-map (kbd ", t") #'rust-test)
  (define-key rust-mode-map (kbd ", b") #'rust-compile))
