;; -*- lexical-binding: t; -*-

(straight-use-package 'treemacs)
(straight-use-package 'treemacs-evil)
(straight-use-package 'treemacs-projectile)
(straight-use-package 'treemacs-magit)

(evil-define-key 'normal global-map
  (kbd "T o") #'treemacs-add-and-display-current-project)

(with-eval-after-load 'treemacs
  (evil-define-key 'normal treemacs-mode-map
    (kbd "<escape>") #'treemacs-quit
    (kbd "D")        #'treemacs-remove-project-from-workspace
    (kbd "c d")      #'treemacs-create-dir
    (kbd "c f")      #'treemacs-create-file
    (kbd "m")        #'treemacs-move-file
    (kbd "r")        #'treemacs-rename-file
    (kbd "d")        #'treemacs-delete-file
    (kbd "o")        #'treemacs-RET-action))
