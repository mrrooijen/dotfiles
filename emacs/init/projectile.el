;; -*- lexical-binding: t; -*-

(straight-use-package 'projectile)
(straight-use-package 'helm-projectile)

(projectile-mode 1)
(helm-projectile-on)

(define-key evil-normal-state-map (kbd "!") #'projectile-run-async-shell-command-in-root)
(define-key evil-normal-state-map (kbd "s-r") #'projectile-replace)

(global-set-key (kbd "s-F") #'helm-projectile-ag)
(global-set-key (kbd "s-f") #'helm-projectile-find-file)
(global-set-key (kbd "s-p") #'helm-projectile-switch-project)

