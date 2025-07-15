
;; -*- lexical-binding: t; -*-
;;; go.el --- Go language support

;;; Commentary:
;;; Provides go-mode and automatic formatting on save.

;;; Code:

(use-package go-mode
  :straight t
  :hook (before-save . gofmt-before-save))
