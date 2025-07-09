;; -*- lexical-binding: t; -*-

(defun open-notes ()
  "Open notes file in markdown mode and return the buffer."
  (interactive)
  (let ((buffer (find-file-noselect "~/Documents/Notes/emacs.md")))
    (with-current-buffer buffer
      (markdown-mode))
    (switch-to-buffer buffer)
    buffer))

(setq remember-data-file "~/Documents/Notes/emacs.md")
(setq initial-buffer-choice #'open-notes)
(general-define-key "§ n" #'open-notes)
