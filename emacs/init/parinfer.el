;; -*- lexical-binding: t; -*-

(straight-use-package 'parinfer)

(setq parinfer-extensions '(defaults pretty-parens smart-yank evil))

(with-eval-after-load 'parinfer
  (define-key parinfer-mode-map (kbd "<tab>") #'parinfer-smart-tab:dwim-right)
  (define-key parinfer-mode-map (kbd "<backtab>") #'parinfer-smart-tab:dwim-left))

(advice-add 'evilnc-comment-or-uncomment-lines
            :after (lambda (_)
                     (when (bound-and-true-p parinfer-mode)
                       (parinfer-indent-buffer))))
