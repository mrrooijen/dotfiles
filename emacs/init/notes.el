;; -*- lexical-binding: t; -*-

(defvar notes/file "~/Documents/Notes/emacs.md"
  "Path to the notes file.")

(defun notes/open ()
  "Open the notes file in markdown-mode."
  (interactive)
  (let ((buf (find-file-noselect notes/file)))
    (with-current-buffer buf
      (markdown-mode))
    (switch-to-buffer buf)))

(setq initial-buffer-choice #'notes/open)

(define-key global-map (kbd "§ n") #'notes/open)
