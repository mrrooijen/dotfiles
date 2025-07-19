;; -*- lexical-binding: t; -*-

(use-package parinfer
  :straight t
  :init
  (setq parinfer-extensions '(defaults pretty-parens smart-yank evil))
  :general
  (:keymaps 'parinfer-mode-map
            "<tab>"     #'parinfer-smart-tab:dwim-right
            "<backtab>" #'parinfer-smart-tab:dwim-left)
  :config
  (advice-add 'evilnc-comment-or-uncomment-lines
              :after (lambda (_)
                       (when (bound-and-true-p parinfer-mode)
                         (parinfer-indent-buffer)))))
