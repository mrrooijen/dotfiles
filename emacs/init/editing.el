;; -*- lexical-binding: t; -*-

;; Editing and Navigation Settings
(setq-default indent-tabs-mode nil)             ; Use spaces instead of tabs
(setq-default tab-width 2)                      ; Set tab width to 2 spaces
(setq-default fill-column 100)                  ; Set max line length
(setq sentence-end-double-space nil)            ; No double space after periods
(setopt confirm-nonexistent-file-or-buffer nil) ; Auto-create files/buffers
(auto-fill-mode 1)                              ; Enable auto-fill mode
(global-visual-line-mode 1)                     ; Enable visual line mode for better text wrapping
(add-hook 'before-save-hook                     ; Remove trailing whitespace before saving
          (lambda ()
            (unless (derived-mode-p 'markdown-mode)
              (delete-trailing-whitespace))))

(use-package evil
  :straight t
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
  :general
  (:states  'normal
   "U"      'undo-redo
   "Q"      'kmacro-end-and-call-macro)
  (:states  'visual
   ">"      'evil-shift-right-visual
   "<"      'evil-shift-left-visual
   "+"      'align-by-equals-symbol)
  (:states  'insert
   "§"      (lambda () (interactive) (insert "§"))
   "M-2"    (lambda () (interactive) (insert "€"))))

(use-package evil-collection
  :after evil
  :straight t
  :config
  (evil-collection-init))

(use-package with-editor
  :straight t
  :config
  (add-hook 'with-editor-mode-hook 'evil-insert-state))

(use-package hippie-exp
  :general
  (:states 'insert
   "M-<tab>" 'hippie-expand))

(use-package evil-nerd-commenter
  :straight t
  :after evil
  :general
  (:states '(normal visual)
   ", c i" 'evilnc-comment-or-uncomment-lines))

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

(use-package column-enforce-mode
  :straight t
  :hook prog-mode
  :general
  (:states '(normal)
   "s-<up>"    'column-enforce-mode
   "s-<down>"  'default-max-column-width
   "s-<right>" 'increase-max-column-width
   "s-<left>"  'decrease-max-column-width)
  :init
  (defvar column-enforce-column-default 100)
  (defvar column-enforce-column column-enforce-column-default)
  :config
  (defun set-max-column-width (width)
    (setq column-enforce-column width)
    (column-enforce-mode 1)
    (message "Max column width: %d" width))

  (defun default-max-column-width ()
    (interactive)
    (set-max-column-width column-enforce-column-default))

  (defun increase-max-column-width ()
    (interactive)
    (set-max-column-width (+ column-enforce-column 10)))

  (defun decrease-max-column-width ()
    (interactive)
    (set-max-column-width (- column-enforce-column 10))))
