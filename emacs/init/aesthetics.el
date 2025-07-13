;; -*- lexical-binding: t; -*-

(use-package visage
  :straight (gruvbox-theme)
  :demand t
  :init
  (setq visage-themes '(gruvbox-dark-hard gruvbox-light-hard))
  (setq visage-default-font-type "SF Mono")
  (setq visage-default-font-size 18)
  :config
  (visage-set-default-theme)
  (visage-set-default-font)
  :general
  (:states 'normal
           "§ t" 'visage-next-theme
           "s-=" 'visage-increase-font
           "s--" 'visage-decrease-font
           "s-0" 'visage-set-default-font))

(use-package doom-themes
  :straight t
  :config
  (doom-themes-treemacs-config)
  (setq doom-themes-treemacs-theme "doom-colors"))

(use-package nerd-icons
  :straight t
  :config
  (unless (member "Symbols Nerd Font Mono" (font-family-list))
    (nerd-icons-install-fonts t)))

(use-package all-the-icons
  :straight t
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

(use-package doom-modeline
  :straight t
  :config
  (doom-modeline-mode 1))

(use-package anzu
  :straight t
  :config
  (global-anzu-mode 1))
