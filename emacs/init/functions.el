;; -*- lexical-binding: t; -*-

(defun kill-other-buffers ()
  "Kills all buffers except the current one."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
