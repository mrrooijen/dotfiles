
;; -*- lexical-binding: t; -*-
;;; hooks.el --- Custom Emacs hooks

;;; Commentary:
;;; Provides custom hooks for whitespace cleanup and other buffer events.

;;; Code:

(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'markdown-mode)
              (delete-trailing-whitespace))))
