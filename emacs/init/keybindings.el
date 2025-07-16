;; -*- lexical-binding: t; -*-

(defvar leader-map (make-sparse-keymap))                  ; leader keymap
(define-key global-map (kbd "§") leader-map)              ; leader key prefix
(define-key leader-map (kbd "q q") 'delete-frame)         ; close frame
(define-key leader-map (kbd "q k") 'kill-emacs)           ; quit Emacs
(define-key leader-map (kbd "q r") 'restart-emacs)        ; restart Emacs

(define-key global-map (kbd "s-q") nil)                   ; prevent accidental macOS termination
(define-key global-map (kbd "s-w") 'delete-window)        ; close current window
(define-key global-map (kbd "M-f") 'delete-other-windows) ; keep only current window
(define-key global-map (kbd "s-B") 'previous-buffer)      ; switch to previous buffer
(define-key global-map (kbd "s-k") 'kill-current-buffer)  ; kill current buffer
(define-key global-map (kbd "s-K") 'kill-other-buffers)   ; kill all other buffers
(define-key global-map (kbd "M-<tab>") 'other-window)     ; move to next window
(define-key key-translation-map (kbd "M-<tab>") (kbd "C-x o")) ; ensure M-<tab> works everywhere

(which-key-mode 1)                                        ; enable which-key
(which-key-add-key-based-replacements
  "§ f" "find"                                            ; show "find" for § f prefix
  "§ q" "quit")                                           ; show "quit" for § q prefix
