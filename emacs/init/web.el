;; -*- lexical-binding: t; -*-

(use-package web-mode
  :straight t
  :mode "\\.\\(erb\\|css\\|scss\\|sass\\|html\\.erb\\)\\'"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package js2-mode
  :straight t
  :mode "\\.js\\'"
  :config
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-basic-offset 2))

(use-package emmet-mode
  :straight t
  :after (general evil)
  :hook ((sgml-mode . emmet-mode)
         (css-mode . emmet-mode))
  :general
  (:keymaps 'emmet-mode-map "C-<tab>" #'emmet-expand-line))
