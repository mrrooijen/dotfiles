;; -*- lexical-binding: t; -*-

(use-package projectile
  :straight t
  :after (general evil)
  :config
  (projectile-mode 1)
  :general
  (:states 'normal
           "!"   #'projectile-run-async-shell-command-in-root
           "s-r" #'projectile-replace))

(use-package helm-projectile
  :straight t
  :after (general evil)
  :config
  (helm-projectile-on)
  :general
  ("s-F" 'helm-projectile-ag
   "s-f" 'helm-projectile-find-file
   "s-p" 'helm-projectile-switch-project))
