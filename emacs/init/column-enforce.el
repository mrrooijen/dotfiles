;; -*- lexical-binding: t; -*-

(use-package column-enforce-mode
  :straight t
  :hook prog-mode
  :general
  (:states '(normal)
   "s-<up>"    'column-enforce-mode
   "s-<down>"  'default-max-column-width
   "s-<right>" 'increase-max-column-width
   "s-<left>"  'decrease-max-column-width)
  :init
  (defvar column-enforce-column-default 100)
  (defvar column-enforce-column column-enforce-column-default)
  :config
  (defun set-max-column-width (width)
    "Set the maximum column width for column-enforce-mode."
    (setq column-enforce-column width)
    (column-enforce-mode 1)
    (message "Max column width: %d" width))

  (defun default-max-column-width ()
    "Reset the column width to the default value."
    (interactive)
    (set-max-column-width column-enforce-column-default))

  (defun increase-max-column-width ()
    "Increase the column width by 10."
    (interactive)
    (set-max-column-width (+ column-enforce-column 10)))

  (defun decrease-max-column-width ()
    "Decrease the column width by 10."
    (interactive)
    (set-max-column-width (- column-enforce-column 10))))
