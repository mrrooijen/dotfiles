;; -*- lexical-binding: t; -*-

(use-package shell
  :general
  (:keymaps 'shell-mode-map
   :states  'normal
   "s-k"    'kill-this-buffer)
  (:keymaps 'shell-mode-map
   :states  '(normal insert)
   "C-k"    'comint-previous-input
   "C-j"    'comint-next-input))

(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))
