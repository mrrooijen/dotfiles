;; -*- lexical-binding: t; -*-

(use-package hippie-exp
  :straight t
  :after (general evil)
  :general
  (:states 'insert "M-<tab>" #'hippie-expand))
