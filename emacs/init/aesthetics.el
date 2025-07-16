;; -*- lexical-binding: t; -*-

(require 'visage)
(straight-use-package 'gruvbox-theme)

(setq visage-default-font-type "SF Mono")
(setq visage-default-font-size 18)
(setq visage-themes '(gruvbox-dark-hard gruvbox-light-hard))

(visage-set-default-font)
(visage-set-default-theme)

(straight-use-package 'doom-themes)
(require 'doom-themes)
(doom-themes-treemacs-config)
(setq doom-themes-treemacs-theme "doom-colors")

(straight-use-package 'nerd-icons)
(require 'nerd-icons)
(unless (member "Symbols Nerd Font Mono" (font-family-list))
  (nerd-icons-install-fonts t))

(straight-use-package 'all-the-icons)
(require 'all-the-icons)
(unless (member "all-the-icons" (font-family-list))
  (all-the-icons-install-fonts t))

(straight-use-package 'doom-modeline)
(require 'doom-modeline)
(doom-modeline-mode 1)

(straight-use-package 'anzu)
(require 'anzu)
(global-anzu-mode 1)

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "§ t") #'visage-next-theme)
  (define-key evil-normal-state-map (kbd "s-=") #'visage-increase-font)
  (define-key evil-normal-state-map (kbd "s--") #'visage-decrease-font)
  (define-key evil-normal-state-map (kbd "s-0") #'visage-set-default-font))
