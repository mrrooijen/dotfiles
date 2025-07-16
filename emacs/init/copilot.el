;; -*- lexical-binding: t; -*-

(use-package copilot
  :straight t
  :after (general evil)
  :config
  (add-to-list 'warning-suppress-types '(copilot))
  :general
  (:states 'normal
           "s-/" #'copilot-mode)
  (:states 'insert
           "s-/"        #'copilot-next-completion
           "s-<return>" #'copilot-accept-completion))
