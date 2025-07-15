;; -*- lexical-binding: t; -*-

;; --- Core System ---
(load "~/.dotfiles/emacs/init/options")      ; Base options, paths, UI, and startup
(load "~/.dotfiles/emacs/init/straight")     ; Package manager: straight.el
(load "~/.dotfiles/emacs/init/gcmh")         ; Garbage collection tuning for responsiveness
(load "~/.dotfiles/emacs/init/exec-path-from-shell") ; Synchronize shell environment variables
(load "~/.dotfiles/emacs/init/server")       ; Start Emacs server

;; --- User Interface ---
(load "~/.dotfiles/emacs/init/general")      ; Keybinding system (foundation for UI packages)
(load "~/.dotfiles/emacs/init/evil")         ; Vim emulation
(load "~/.dotfiles/emacs/init/vterm")        ; Terminal integration
(load "~/.dotfiles/emacs/init/aesthetics")   ; Theme, fonts, icons, modeline

;; --- Navigation & Window Management ---
(load "~/.dotfiles/emacs/init/helm")         ; Completion, command palette, navigation
(load "~/.dotfiles/emacs/init/treemacs")     ; Project/file tree sidebar
(load "~/.dotfiles/emacs/init/popwin")       ; Popup window management
(load "~/.dotfiles/emacs/init/projectile")   ; Project detection and commands

;; --- Editing Tools ---
(load "~/.dotfiles/emacs/init/company")      ; Autocompletion
(load "~/.dotfiles/emacs/init/flycheck")     ; Syntax checking
(load "~/.dotfiles/emacs/init/yasnippet")    ; Snippet expansion
(load "~/.dotfiles/emacs/init/parinfer")     ; Smart paren/indent for Lisp
(load "~/.dotfiles/emacs/init/column-enforce") ; Enforce column width

;; --- Language & Filetype Support ---
(load "~/.dotfiles/emacs/init/mise")         ; Toolchain manager
(load "~/.dotfiles/emacs/init/elisp")        ; Emacs Lisp enhancements
(load "~/.dotfiles/emacs/init/sh")           ; Shell script configuration
(load "~/.dotfiles/emacs/init/ruby")         ; Ruby modes and tools
(load "~/.dotfiles/emacs/init/python")       ; Python mode
(load "~/.dotfiles/emacs/init/crystal")      ; Crystal mode
(load "~/.dotfiles/emacs/init/go")           ; Go mode and formatting
(load "~/.dotfiles/emacs/init/rust")         ; Rust mode and formatting
(load "~/.dotfiles/emacs/init/typescript")   ; TypeScript mode and tools
(load "~/.dotfiles/emacs/init/web")          ; HTML, CSS, JS, Emmet
(load "~/.dotfiles/emacs/init/markdown")     ; Markdown mode
(load "~/.dotfiles/emacs/init/yaml")         ; YAML mode
(load "~/.dotfiles/emacs/init/json")         ; JSON mode
(load "~/.dotfiles/emacs/init/docker")       ; Dockerfile mode

;; --- Version Control ---
(load "~/.dotfiles/emacs/init/magit")        ; Git interface (magit)
(load "~/.dotfiles/emacs/init/diff-hl")      ; VCS diff highlighting

;; --- AI & Automation ---
(load "~/.dotfiles/emacs/init/copilot")      ; GitHub Copilot integration
(load "~/.dotfiles/emacs/init/aider")        ; Aider AI assistant
(load "~/.dotfiles/emacs/init/gptel")        ; GPTel LLM interface

;; --- Productivity & Workflow ---
(load "~/.dotfiles/emacs/init/notes")        ; Notes access

;; --- Miscellaneous ---
(load "~/.dotfiles/emacs/init/hooks")        ; Custom hooks (e.g., whitespace)
