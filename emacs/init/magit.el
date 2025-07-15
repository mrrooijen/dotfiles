
;; -*- lexical-binding: t; -*-
;;; magit.el --- Git interface configuration

;;; Commentary:
;;; Sets up magit and related keybindings for Git integration.

;;; Code:

(use-package magit
  :straight   t
  :general
  (:states    'normal
   "+"        'magit-status)
  (:keymaps   '(magit-status-mode-map magit-diff-mode-map magit-process-mode-map magit-log-mode-map)
   "<escape>" 'magit-mode-bury-buffer
   "$"        'magit-process-buffer)
  :hook
  (git-commit-mode . evil-insert-state))
