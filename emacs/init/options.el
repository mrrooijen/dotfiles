;; -*- lexical-binding: t; -*-

;; Add local packages directory to load path
(add-to-list 'load-path "~/.dotfiles/emacs/pkg")

;; Create temporary and backup directories if necessary
(make-directory (expand-file-name "~/.emacs.d/tmp") t)
(make-directory (expand-file-name "~/.emacs.d/backups") t)

;; Set backup and temporary file locations
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq temporary-file-directory (expand-file-name "~/.emacs.d/tmp"))

;; Set location for customizations
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

;; Startup behavior
(setopt inhibit-startup-message t)         ; No startup message
(setopt initial-scratch-message nil)       ; Empty scratch buffer

;; Prompt settings
(setopt use-short-answers t)     ; Short yes/no prompts

;; UI settings
(setopt tool-bar-mode nil)       ; Disable toolbar
(setopt menu-bar-mode nil)       ; Disable menu bar
(setopt scroll-bar-mode nil)     ; Disable scroll bar
(setopt column-number-mode t)    ; Show column number
(set-fringe-mode 0)              ; Remove fringe

;; Scrolling and bell behavior
(setopt ring-bell-function #'ignore)      ; Disable bell
(setopt scroll-margin 1)                  ; Margin when scrolling
(setopt scroll-conservatively 10000)      ; Prevent cursor recentering
(setopt scroll-step 1)                    ; Scroll one line at a time
(setopt auto-window-vscroll nil)          ; Disable automatic vertical scroll

;; Native compilation
(setopt native-comp-async-report-warnings-errors nil) ; Suppress compile warnings
