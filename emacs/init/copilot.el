;; -*- lexical-binding: t; -*-

(straight-use-package
 '(copilot :host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el")))

(if (boundp 'warning-suppress-types)
    (add-to-list 'warning-suppress-types '(copilot))
    (setq warning-suppress-types '(copilot)))

(define-key evil-normal-state-map (kbd "s-/") #'copilot-mode)

(with-eval-after-load 'copilot
  (define-key evil-insert-state-map (kbd "s-/") #'copilot-next-completion)
  (define-key evil-insert-state-map (kbd "s-<return>") #'copilot-accept-completion))
