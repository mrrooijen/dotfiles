;; -*- lexical-binding: t; -*-

(use-package projectile
  :straight t
  ;; :demand t
  :after evil
  :config
  (projectile-mode 1)
  (message "projectile loaded")
  :general
  (:states 'normal
           "!"   #'projectile-run-async-shell-command-in-root
           "s-r" #'projectile-replace))

(use-package helm-projectile
  :straight t
  :demand t
  :after evil
  :commands (helm-projectile-switch-project)
  :config
  (message "helm-projectile loaded")
  (helm-projectile-on)
  (message "helm-projectile loaded")
  :general
  ("s-F" 'helm-projectile-ag
   "s-f" 'helm-projectile-find-file
   "s-p" 'helm-projectile-switch-project))
