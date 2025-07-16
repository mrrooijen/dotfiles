;; -*- lexical-binding: t; -*-

(straight-use-package 'popwin)
(popwin-mode 1)

(define-key evil-normal-state-map (kbd "M-k") #'popwin:close-popup-window)
(define-key evil-normal-state-map (kbd "M-b") #'popwin:popup-last-buffer)

(push '("*shell*" :height 20 :position bottom :stick t)
      popwin:special-display-config)
(push '("*Async Shell Command*" :height 25 :position bottom :stick t)
      popwin:special-display-config)
(push '(minitest-compilation-mode :width 0.5 :position right :noselect t :stick t)
      popwin:special-display-config)
