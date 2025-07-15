
;; -*- lexical-binding: t; -*-
;;; exec-path-from-shell.el --- Shell environment variable sync

;;; Commentary:
;;; Ensures Emacs inherits shell environment variables.

;;; Code:

(use-package exec-path-from-shell
  :straight t
  :config
  (add-to-list 'exec-path-from-shell-variables "EDITOR")
  (add-to-list 'exec-path-from-shell-variables "SSH_AUTH_SOCK")
  (exec-path-from-shell-initialize))
