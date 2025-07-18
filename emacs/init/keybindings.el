;; -*- lexical-binding: t; -*-

(general-define-key
 :keymaps 'global
 "§ q q" #'save-buffers-kill-emacs
 "§ q r" #'restart-emacs
 "§ q k" #'kill-emacs)

(general-define-key
 :keymaps 'global
 "s-q" nil                     ; prevent accidental macOS termination
 "s-w" #'delete-window         ; close current window
 "M-f" #'delete-other-windows  ; keep only current window
 "s-k" #'kill-current-buffer   ; kill current buffer
 "s-K" #'kill-other-buffers)   ; kill all other buffers

(general-define-key :keymaps 'global "M-<tab>" #'other-window)
(general-define-key :keymaps 'override :states 'normal "M-<tab>" #'other-window)

(which-key-mode 1)                                        ; enable which-key
(which-key-add-key-based-replacements
  "§ f" "find"                                            ; show "find" for § f prefix
  "§ q" "quit")                                           ; show "quit" for § q prefix
