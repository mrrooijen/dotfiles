
;; -*- lexical-binding: t; -*-

(use-package parinfer
  :straight t
  :general
  (:keymaps 'parinfer-mode-map
   :states  'insert
   "<tab>"     'parinfer-smart-tab:dwim-right
   "<backtab>" 'parinfer-smart-tab:dwim-left)
  :config
  (setq parinfer-extensions '(defaults pretty-parens smart-yank evil))
  (advice-add 'evilnc-comment-or-uncomment-lines
              :after (lambda (_)
                       (when (bound-and-true-p parinfer-mode)
                         (parinfer-indent-buffer)))))
