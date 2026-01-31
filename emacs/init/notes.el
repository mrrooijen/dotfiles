;; -*- lexical-binding: t; -*-

(defvar mr/notes-file "~/Documents/Notes/emacs.md"
  "Default notes file for quick access.")

(setq initial-buffer-choice mr/notes-file)

(general-define-key
 :keymaps 'override
 "§ n" (lambda () (interactive) (find-file mr/notes-file)))
