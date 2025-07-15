
;; -*- lexical-binding: t; -*-
;;; mise.el --- Toolchain manager configuration

;;; Commentary:
;;; Enables global mise-mode for toolchain management.

;;; Code:

(use-package mise
  :straight t
  :config
  (global-mise-mode 1))
