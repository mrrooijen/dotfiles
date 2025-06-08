;; -*- lexical-binding: t; -*-

(defun vterm-send-ctrl-d ()
  "Send C-d to vterm interactively."
  (interactive)
  (vterm-send-key (kbd "C-d")))

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
   "-" 'vterm-launch)
  (:keymaps 'vterm-mode-map
   :states 'normal
   "C-c C-d" 'vterm-send-ctrl-d))
