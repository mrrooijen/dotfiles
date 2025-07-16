;; -*- lexical-binding: t; -*-

(use-package company
  :straight t
  :demand t
  :after (general evil)
  :config
  (message "company loaded")
  (global-company-mode)
  :general
  (:keymaps 'company-active-map
            "C-j" #'company-select-next-or-abort
            "C-k" #'company-select-previous-or-abort
            "<escape>" #'company-abort))
