;; -*- lexical-binding: t; -*-

(use-package hippie-exp
  :ensure t
  :general
  (:states 'insert
           "<tab>" 'hippie-expand))
