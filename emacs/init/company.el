;; -*- lexical-binding: t; -*-

(straight-use-package 'company)

(global-company-mode)

(define-key company-active-map (kbd "C-j") #'company-select-next-or-abort)
(define-key company-active-map (kbd "C-k") #'company-select-previous-or-abort)
(define-key company-active-map (kbd "<escape>") #'company-abort)
