;; -*- lexical-binding: t; -*-

(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-nerd-commenter)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)

(evil-mode 1)
(evil-collection-init)

(defun evil-shift-left-visual ()
  "Shifts left while keeping selection."
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  "Shifts right while keeping selection."
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(define-key evil-normal-state-map (kbd "U") #'undo-redo)
(define-key evil-normal-state-map (kbd "Q") #'kmacro-end-and-call-macro)

(define-key evil-visual-state-map (kbd ">") #'evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") #'evil-shift-left-visual)
(define-key evil-visual-state-map (kbd "+") #'align-by-equals-symbol)

(define-key evil-insert-state-map (kbd "§") (lambda () (interactive) (insert "§")))
(define-key evil-insert-state-map (kbd "M-2") (lambda () (interactive) (insert "€")))

(define-key evil-normal-state-map (kbd ", c i") #'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ", c i") #'evilnc-comment-or-uncomment-lines)
