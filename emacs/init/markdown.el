
;; -*- lexical-binding: t; -*-
;;; markdown.el --- Markdown mode configuration

;;; Commentary:
;;; Sets up markdown-mode and outline hiding for markdown buffers.

;;; Code:

(use-package markdown-mode
  :straight t
  :hook (markdown-mode . (lambda () (outline-hide-body))))
