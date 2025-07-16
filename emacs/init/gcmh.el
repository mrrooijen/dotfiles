;; -*- lexical-binding: t; -*-

(use-package gcmh
  :straight t
  :defer t
  :init (setq gc-cons-threshold most-positive-fixnum)
  :hook (emacs-startup . gcmh-mode))
