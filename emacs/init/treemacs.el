;; -*- lexical-binding: t; -*-

(use-package treemacs
  :straight t
  :after (general evil)
  :general
  (:keymaps 'global :states 'normal
            "T o" #'treemacs-add-and-display-current-project)
  (:keymaps 'treemacs-mode-map
            "<escape>"      #'treemacs-quit
            "D"        #'treemacs-remove-project-from-workspace
            "c d"      #'treemacs-create-dir
            "c f"      #'treemacs-create-file
            "m"        #'treemacs-move-file
            "r"        #'treemacs-rename-file
            "d"        #'treemacs-delete-file
            "o"        #'treemacs-RET-action))

(use-package treemacs-evil
  :straight t
  :demand t
  :after treemacs
  :config
  (message "treemacs-evil LOADED"))

(use-package treemacs-projectile
  :straight t
  :demand t
  :after treemacs
  :config
  (message "treemacs-projectile LOADED"))

(use-package treemacs-magit
  :straight t
  :demand t
  :after treemacs
  :config
  (message "treemacs-magit LOADED"))
