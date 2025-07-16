;; -*- lexical-binding: t; -*-

(straight-use-package 'magit)

(define-key evil-normal-state-map (kbd "+") #'magit-status)

(add-hook 'git-commit-mode-hook #'evil-insert-state)

(with-eval-after-load 'magit
  (define-key magit-status-mode-map (kbd "<escape>") #'magit-mode-bury-buffer)
  (define-key magit-diff-mode-map (kbd "<escape>") #'magit-mode-bury-buffer)
  (define-key magit-process-mode-map (kbd "<escape>") #'magit-mode-bury-buffer)
  (define-key magit-log-mode-map (kbd "<escape>") #'magit-mode-bury-buffer))
