
;; -*- lexical-binding: t; -*-
;;; sh.el --- Shell script mode configuration

;;; Commentary:
;;; Sets up sh-script mode and indentation settings.

;;; Code:

(use-package sh-script
  :config
  (setq sh-basic-offset 2)
  (setq sh-indentation 2))
