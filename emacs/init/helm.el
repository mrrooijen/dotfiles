;; -*- lexical-binding: t; -*-

(use-package helm
  :straight t
  :after evil
  :config
  (helm-mode 1)
  (setq helm-always-two-windows nil)
  (setq helm-display-buffer-default-height 25)
  (setq helm-default-display-buffer-functions '(display-buffer-in-side-window))
  :general
  ("M-x"               #'helm-M-x
   "s-b"               #'helm-buffers-list
   "s-<backspace>"     #'helm-resume
   "§ f f"             #'helm-find-files)
  (:states '(normal visual)
           "_"         #'helm-M-x)
  (:keymaps 'helm-map
            "C-f"      #'helm-next-page
            "C-b"      #'helm-previous-page
            "C-l"      #'helm-next-source
            "C-h"      #'helm-previous-source
            "C-j"      #'helm-next-line
            "C-k"      #'helm-previous-line
            "M-h"      #'backward-word
            "M-l"      #'forward-word
            "<tab>"    #'helm-execute-persistent-action
            "<escape>" #'helm-keyboard-quit))
