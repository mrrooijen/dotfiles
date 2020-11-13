;; Initialize

(load "~/.dotfiles/emacs/bootstrap")
(load "~/.dotfiles/emacs/features")
(load "~/.dotfiles/emacs/functions")


;; System Packages

(system-packages-ensure "aspell")
(system-packages-ensure "gpg")
(system-packages-ensure "git")
(system-packages-ensure "pinentry-mac")


;; Aesthetics

(set-font "SF Mono" 15)

(custom-set-faces
 '(evil-ex-search ((t (:background "#D23782" :foreground "#FFFFFF"))))
 '(lazy-highlight ((t (:background "#D23782" :foreground "#FFFFFF")))))

(use-package all-the-icons :straight t)

(use-package doom-themes
  :straight t
  :config
  (set-themes '(doom-one doom-one-light))
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :straight t
  :config   (doom-modeline-mode 1))

(use-package anzu
  :straight t
  :config   (global-anzu-mode 1))


;; Editing

(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(auto-fill-mode 1)
(global-visual-line-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package column-enforce-mode
  :straight t
  :hook     prog-mode
  :general
  (:states     '(normal)
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

(use-package with-editor
  :straight t
  :config   (add-hook 'with-editor-mode-hook 'evil-insert-state))

(use-package hippie-exp
  :general
  (:states   'insert
   "M-<tab>" 'hippie-expand))

(use-package yasnippet
  :straight t
  :config
  (add-to-list 'load-path "~/.dotfiles/emacs/snippets")
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :straight t)

(use-package evil-nerd-commenter
  :straight t
  :after    evil
  :general
  (:states  '(normal visual)
   ", c i"  'evilnc-comment-or-uncomment-lines))

(use-package flycheck
  :straight t
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (global-flycheck-mode 1))

(use-package company
  :straight   t
  :general
  (:keymaps   'company-active-map
   "C-j"      'company-select-next-or-abort
   "C-k"      'company-select-previous-or-abort
   "<escape>" 'company-abort)
  :init       (add-hook 'after-init-hook 'global-company-mode))

(use-package diff-hl
  :straight t
  :config
  (global-diff-hl-mode 1)
  (diff-hl-margin-mode 1)
  (setq diff-hl-margin-symbols-alist '((insert . "▍") (delete . "▍") (change . "▍") (unknown . "▍") (ignored . "▍")))
  (set-face-attribute 'diff-hl-margin-insert nil :foreground "#9fbd70" :inherit nil)
  (set-face-attribute 'diff-hl-margin-delete nil :foreground "#ee756f" :inherit nil)
  (set-face-attribute 'diff-hl-margin-change nil :foreground "#e5c084" :inherit nil))

(use-package parinfer
  :straight    t
  :general
  (:keymaps    'parinfer-mode-map
   :states     'insert
   "<tab>"     'parinfer-smart-tab:dwim-right
   "<backtab>" 'parinfer-smart-tab:dwim-left)
  :config
  (setq parinfer-extensions '(defaults pretty-parens smart-yank evil))
  (advice-add 'evilnc-comment-or-uncomment-lines
              :after (lambda (_)
                       (when (bound-and-true-p parinfer-mode)
                         (parinfer-indent-buffer)))))


;; Keybindings

(which-key-add-key-based-replacements
  "§ f" "find"
  "§ q" "quit")

(general-define-key
  "s-q"   nil
  "§ q q" 'kill-emacs
  "§ q r" 'restart-emacs
  "§ s"   'switch-to-scratch-buffer
  "§ t"   'cycle-themes
  "§ l"   'cycle-language
  "§ L"   'flyspell-buffer
  "s-k"   'kill-this-buffer-unless-scratch
  "s-="   'increase-font
  "s--"   'decrease-font
  "s-0"   'reset-font
  "s-w"   'delete-window
  "M-f"   'delete-other-windows)

(general-define-key
  :keymaps  '(global-map help-mode-map)
  "M-<tab>" 'other-window)


;; Navigation

(use-package evil
  :straight t
  :general
  (:states  'visual
   ">"      'evil-shift-right-visual
   "<"      'evil-shift-left-visual
   "+"      'align-by-equals-symbol)
  (:states  'insert
   "M-§"    'insert-paragraph-symbol
   "M-2"    'insert-euro-symbol)
  :config
  (evil-mode 1)
  (setq evil-normal-state-cursor '(box "#D23782"))
  (setq evil-visual-state-cursor '(box "#D23782"))
  (setq evil-insert-state-cursor '(bar "#D23782"))
  (advice-add 'evil-ex-search-next :after
              (lambda (&rest _)
                (evil-scroll-line-to-center (line-number-at-pos))))
  (advice-add 'evil-ex-search-previous :after
              (lambda (&rest _)
                (evil-scroll-line-to-center (line-number-at-pos)))))

(use-package projectile
  :straight t
  :after    evil
  :general
  (:states  'normal
   "!"      'projectile-run-async-shell-command-in-root)
  :init     (projectile-mode 1))

(use-package helm
  :straight        t
  :after           evil
  :general
  ("M-x"           'helm-M-x
   "s-b"           'helm-buffers-list
   "s-<backspace>" 'helm-resume
   "§ f f"         'helm-find-files)
  (:keymaps        'evil-normal-state-map
   "_"             'helm-M-x)
  (:keymaps        'evil-visual-state-map
   "_"             'helm-M-x)
  (:keymaps        'helm-map
   "C-f"           'helm-next-page
   "C-b"           'helm-previous-page
   "C-h"           'backward-char
   "C-l"           'forward-char
   "M-h"           'backward-word
   "M-l"           'forward-word
   "C-j"           'helm-next-line
   "C-k"           'helm-previous-line
   "<tab>"         'helm-execute-persistent-action
   "<escape>"      'helm-keyboard-quit)
  :config
  (helm-mode 1)
  (setq helm-always-two-windows nil)
  (setq helm-display-buffer-default-height 25)
  (setq helm-default-display-buffer-functions '(display-buffer-in-side-window)))

(use-package helm-ag
  :straight              t
  :ensure-system-package ag)

(use-package helm-projectile
  :straight t
  :general
  ("s-F"    'helm-projectile-ag
   "s-f"    'helm-projectile-find-file
   "s-p"    'helm-projectile-switch-project)
  :config   (helm-projectile-on))

(use-package treemacs
  :straight   t
  :general
  (:keymaps   'global-map
   :states    'normal
   "T o"      'treemacs-add-and-display-current-project)
  (:keymaps   'treemacs-mode-map
   "M-<tab>"  'other-window
   "<escape>" 'treemacs-quit
   "D"        'treemacs-remove-project-from-workspace
   "c d"      'treemacs-create-dir
   "c f"      'treemacs-create-file
   "m"        'treemacs-move-file
   "r"        'treemacs-rename
   "d"        'treemacs-delete
   "o"        'treemacs-RET-action))

(use-package treemacs-evil :straight t)
(use-package treemacs-projectile :straight t)
(use-package treemacs-magit :straight t)


;; Window Management

(use-package popwin
  :straight t
  :general
  (:states  'normal
   "M-k"    'popwin:close-popup-window
   "M-b"    'popwin:popup-last-buffer)
  :config
  (push '("*shell*" :height 20 :position bottom :stick t) popwin:special-display-config)
  (push '("*Async Shell Command*" :height 20 :position bottom :stick t) popwin:special-display-config)
  (push '(minitest-compilation-mode :height 20 :position bottom :noselect t :stick t) popwin:special-display-config)
  (message "loaded window management")
  :init
  (popwin-mode 1))


;; Scratch Buffer

(use-package persistent-scratch
  :straight t
  :config
  (persistent-scratch-setup-default)
  (with-current-buffer "*scratch*"
    (emacs-lock-mode 'kill)))


;; Shell

(use-package shell
  :general
  (:states  'normal
   "-"      'shell)
  (:keymaps 'shell-mode-map
   :states  'normal
   "s-k"    'kill-this-buffer)
  (:keymaps 'shell-mode-map
   :states  '(normal insert)
   "C-k"    'comint-previous-input
   "C-j"    'comint-next-input))


;; Magit

(use-package magit
  :straight   t
  :general
  (:states    'normal
   "+"        'magit-status)
  (:keymaps   'magit-status-mode-map
   "<escape>" 'magit-mode-bury-buffer)
  (:keymaps   '(magit-status-mode-map magit-process-mode-map magit-log-mode-map magit-diff-mode-map)
   "M-<tab>"  'other-window))

(use-package evil-magit :straight t)


;; Markdown

(use-package markdown-mode :straight t)


;; YAML

(use-package yaml-mode :straight t)


;; JSON

(use-package json-mode :straight t)


;; Docker

(use-package dockerfile-mode :straight t)


;; ELisp

(use-package elisp-mode :config (add-hook 'emacs-lisp-mode-hook 'parinfer-mode))


;; Web (HTML/CSS/JS)

(general-define-key
 :keymaps '(mhtml-mode-map)
 "§" nil)

(use-package emmet-mode
  :straight t
  :general
  (:states   'insert
   "C-<tab>" 'emmet-expand-line)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package web-mode
  :straight t
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package js2-mode
  :straight t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-basic-offset 2))

(use-package sass-mode
  :straight t
  :config
  :general
  (:states 'normal
   "<backspace>" 'evil-backward-char))

(use-package slim-mode
  :straight t)


;; Ruby

(use-package ruby-tools
  :straight t)

(use-package ruby-hash-syntax
  :straight t
  :general
  (:states 'visual
   "C-m"   'ruby-hash-syntax-toggle))

(use-package ruby-electric
  :straight t
  :config
  (eval-after-load "ruby-mode"
    '(add-hook 'ruby-mode-hook 'ruby-electric-mode)))

(use-package chruby
  :straight t
  :config   (add-hook 'ruby-mode-hook 'chruby-use-corresponding))

(use-package minitest
  :straight t
  :general
  (:keymaps 'ruby-mode-map
   :states  'normal
   ", t t"  'minitest-verify
   ", t a"  'minitest-verify-all)
  :config
  (add-hook 'minitest-compilation-mode-hook
    (lambda ()
      (local-set-key (kbd "g g") 'evil-goto-first-line))))


;; Crystal

(use-package crystal-mode :straight t)


;; Clojure

(use-package clojure-mode
  :straight t
  :config
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t)
  (add-hook 'clojure-mode-hook 'parinfer-mode))

(use-package cider
  :straight t
  :general
  (:keymaps 'clojure-mode-map
   :states 'normal
   ", r j" 'cider-jack-in-clj
   ", r c" 'cider-connect-clj)
  (:keymaps 'clojurescript-mode-map
   :states 'normal
   ", c j" 'cider-jack-in-cljs
   ", c c" 'cider-connect-cljs)
  :init
  (add-to-list 'safe-local-variable-values '(cider-default-cljs-repl . shadow))
  (add-to-list 'safe-local-variable-values '(cider-shadow-default-options . "app"))
  :config
  (setq cider-enhanced-cljs-completion-p nil))


;; Go

(use-package go-mode
  :straight t
  :config   (add-hook 'before-save-hook 'gofmt-before-save))


;; Rust

(use-package rust-mode
  :straight t
  :general
  (:keymaps 'rust-mode-map
   :states  'normal
   ", r"    'rust-run
   ", t"    'rust-test
   ", b"    'rust-compile)
  :config   (setq rust-format-on-save t))
