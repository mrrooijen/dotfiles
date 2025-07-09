;; -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))
