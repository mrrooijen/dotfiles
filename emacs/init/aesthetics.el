;; -*- lexical-binding: t; -*-

(use-package visage
  :after (gruvbox-theme evil)
  :demand t
  :config
  (setq visage-default-font-type "SF Mono")
  (setq visage-default-font-size 18)
  (setq visage-themes '(gruvbox-dark-hard gruvbox-light-hard))
  (visage-set-default-font)
  (visage-set-default-theme)
  :general
  (:states 'normal
           "§ t" #'visage-next-theme
           "s-=" #'visage-increase-font
           "s--" #'visage-decrease-font
           "s-0" #'visage-set-default-font))

(use-package gruvbox-theme
  :straight t)

(use-package doom-themes
  :straight t
  :demand t
  :after treemacs
  :config
  (message "doom-themes loaded")
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(use-package nerd-icons
  :straight t
  :demand t
  :config
  (unless (member "Symbols Nerd Font Mono" (font-family-list))
    (nerd-icons-install-fonts t)))

(use-package all-the-icons
  :straight t
  :demand t
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

(use-package doom-modeline
  :straight t
  :demand t
  :config
  (doom-modeline-mode 1))

(use-package anzu
  :straight t
  :demand t
  :config
  (global-anzu-mode 1))

(use-package evil-anzu
  :straight t
  :demand t
  :after (evil anzu))
