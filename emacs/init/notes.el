;; -*- lexical-binding: t; -*-

(use-package org
  :ensure t
  :demand t
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-directory "~/Documents/Notes/")
  (setq org-default-notes-file (concat org-directory "emacs.org"))
  (setq initial-buffer-choice org-default-notes-file)
  (setq org-startup-folded 'content)
  :general
  ("§ n" (lambda () (interactive) (find-file org-default-notes-file))))
