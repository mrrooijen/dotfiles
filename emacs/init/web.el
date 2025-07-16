;; -*- lexical-binding: t; -*-

(straight-use-package 'emmet-mode)
(straight-use-package 'web-mode)
(straight-use-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\.erb\'" . web-mode))
(add-to-list 'auto-mode-alist '("\.css\'" . web-mode))
(add-to-list 'auto-mode-alist '("\.scss\'" . web-mode))
(add-to-list 'auto-mode-alist '("\.sass\'" . web-mode))
(add-to-list 'auto-mode-alist '("\.js\'" . js2-mode))

(add-hook 'sgml-mode-hook #'emmet-mode)
(add-hook 'css-mode-hook #'emmet-mode)

(setq js-indent-level 2)

(with-eval-after-load 'emmet-mode
  (define-key emmet-mode-keymap (kbd "C-<tab>") #'emmet-expand-line))

(with-eval-after-load 'web-mode
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(with-eval-after-load 'js2-mode
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-basic-offset 2))

(with-eval-after-load 'mhtml-mode
  (define-key mhtml-mode-map (kbd "§") nil))
