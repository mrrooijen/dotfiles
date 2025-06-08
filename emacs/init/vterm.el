;; -*- lexical-binding: t; -*-


(defun vterm-launch ()
  "Launch vterm, using projectile-run-vterm if in a projectile project, otherwise regular vterm."
  (interactive)
  (if (and (fboundp 'projectile-project-p) (projectile-project-p))
      (projectile-run-vterm nil)
    (vterm)))

(use-package vterm
  :straight t
  :general
  (:states 'normal
   "-" 'vterm-launch))
