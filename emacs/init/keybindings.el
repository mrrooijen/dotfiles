;; -*- lexical-binding: t; -*-

(use-package general
  :straight t
  :config
  (general-auto-unbind-keys)
  (general-define-key
   "s-q"     nil ; Prevent accidental quit on MacOS
   "s-w"     'delete-window
   "M-f"     'delete-other-windows
   "s-B"     'previous-buffer
   "s-k"     'kill-current-buffer
   "s-K"     'kill-other-buffers
   "§ q q"   'delete-frame
   "§ q k"   'kill-emacs
   "§ q r"   'restart-emacs
   "§ L"     'flyspell-buffer)
  (general-define-key :keymaps 'override "M-<tab>" 'other-window)
  (define-key key-translation-map (kbd "M-<tab>") (kbd "C-x o")))

(use-package which-key
  :straight t
  :config
  (which-key-mode 1)
  (which-key-add-key-based-replacements
    "§ f" "find"
    "§ q" "quit"))

(defun kill-other-buffers ()
  "Kills all buffers except the current one."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
