
;; -*- lexical-binding: t; -*-
;;; flycheck.el --- Syntax checking configuration

;;; Commentary:
;;; Sets up flycheck and disables checkdoc for Emacs Lisp.

;;; Code:

(use-package flycheck
  :straight t
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (global-flycheck-mode 0))
