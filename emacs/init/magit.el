;; -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :after (general evil)
  :hook (git-commit-setup . evil-insert-state)
  :general
  (:states 'normal "+" #'magit-status)
  (:keymaps '(magit-status-mode-map
              magit-diff-mode-map
              magit-process-mode-map
              magit-log-mode-map)
            "<escape>" #'magit-mode-bury-buffer))
