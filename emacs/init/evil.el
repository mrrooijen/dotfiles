;; -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :demand t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
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
  (general-define-key
   :states 'normal
   "U" #'undo-redo
   "Q" #'kmacro-end-and-call-macro)
  (general-define-key
   :states 'visual
   ">" #'evil-shift-right-visual
   "<" #'evil-shift-left-visual
   "+" #'align-by-equals-symbol)
  (general-define-key
   :states 'insert
   "§"   (lambda () (interactive) (insert "§"))
   "M-2" (lambda () (interactive) (insert "€"))))

(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :straight t
  :after evil
  :general
  (:states '(normal visual)
           ", c i" #'evilnc-comment-or-uncomment-lines))
