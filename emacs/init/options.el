;; -*- lexical-binding: t; -*-

;;; --- Package and Path Setup ---
(add-to-list 'load-path "~/.dotfiles/emacs/pkg")
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

;;; --- File and Backup Management ---
(make-directory (expand-file-name "~/.emacs.d/tmp") t)
(make-directory (expand-file-name "~/.emacs.d/backups") t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq temporary-file-directory (expand-file-name "~/.emacs.d/tmp"))

;;; --- Compilation ---
(setopt native-comp-async-report-warnings-errors nil) ; Suppress compile warnings

;;; --- Startup Behavior ---
(setopt inhibit-startup-message t)      ; No startup message
(setopt initial-scratch-message nil)    ; Empty scratch buffer

;;; --- Prompt Settings ---
(setopt use-short-answers t)            ; Short yes/no prompts

;;; --- UI Settings ---
(setopt tool-bar-mode nil)              ; Disable toolbar
(setopt menu-bar-mode nil)              ; Disable menu bar
(setopt scroll-bar-mode nil)            ; Disable scroll bar
(setopt column-number-mode t)           ; Show column number
(set-fringe-mode 0)                     ; Remove fringe

;;; --- Scrolling and Bell ---
(setopt ring-bell-function #'ignore)    ; Disable bell
(setopt scroll-margin 1)                ; Minimal scroll margin
(setopt scroll-conservatively 10000)    ; Smooth scrolling
(setopt scroll-step 1)                  ; Line-by-line scroll
(setopt auto-window-vscroll nil)        ; Disable auto vscroll

;;; --- Editing ---
(setq-default indent-tabs-mode nil)     ; Use spaces for indentation
(setq-default tab-width 2)              ; Tab width
(setq-default fill-column 100)          ; Max line length
(setq sentence-end-double-space nil)    ; Single space ends sentence
(setopt confirm-nonexistent-file-or-buffer nil) ; No confirm for new files

;;; --- Modes ---
(auto-fill-mode 1)                      ; Auto line wrap
(global-visual-line-mode 1)             ; Visual line mode
(which-key-mode 1)                      ; Keybinding hints
(which-key-add-key-based-replacements "§ f" "find" "§ q" "quit")
