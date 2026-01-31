;; -*- lexical-binding: t; -*-

(use-package org
  :demand t
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-directory "~/Documents/Notes/")
  (setq org-default-notes-file (concat org-directory "emacs.org"))
  (setq org-startup-folded 'content))
