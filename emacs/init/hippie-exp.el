;; -*- lexical-binding: t; -*-

(straight-use-package 'hippie-exp)

(define-key evil-insert-state-map (kbd "<tab>") #'hippie-expand)
