;; -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  :general
  (:states  'normal
   "U"      'undo-redo
   "Q"      'kmacro-end-and-call-macro)
  (:states  'visual
   ">"      'evil-shift-right-visual
   "<"      'evil-shift-left-visual
   "+"      'align-by-equals-symbol)
  (:states  'insert
   "M-§"    'insert-paragraph-symbol
   "M-2"    'insert-euro-symbol))

(use-package evil-collection
  :after evil
  :straight t
  :config
  (evil-collection-init))

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
