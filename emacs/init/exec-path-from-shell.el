;; -*- lexical-binding: t; -*-

(straight-use-package 'exec-path-from-shell)
(require 'exec-path-from-shell)

(add-to-list 'exec-path-from-shell-variables "EDITOR")
(add-to-list 'exec-path-from-shell-variables "SSH_AUTH_SOCK")

(exec-path-from-shell-initialize)
