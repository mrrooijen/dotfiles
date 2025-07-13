;; -*- lexical-binding: t; -*-

(use-package which-key
  :straight t
  :config
  (which-key-mode 1)
  (which-key-add-key-based-replacements
    "§ f" "find"
    "§ q" "quit"))

(use-package general
  :straight t
  :config
  (general-auto-unbind-keys))

(general-define-key
 "s-w"     'delete-window
 "M-f"     'delete-other-windows

 "s-B"     'previous-buffer
 "s-k"     'kill-this-buffer-unless-scratch
 "s-K"     'kill-other-buffers

 "s-q"     nil
 "§ q q"   'delete-frame
 "§ q k"   'kill-emacs
 "§ q r"   'restart-emacs
 "§ l"     'cycle-language
 "§ L"     'flyspell-buffer)

;; (Attempt to) Force M-<tab> to other-window using a combination of
;; global-set-key and key-translation-map
(general-define-key :keymaps 'override "M-<tab>" 'other-window)
(define-key key-translation-map (kbd "M-<tab>") (kbd "C-x o"))
