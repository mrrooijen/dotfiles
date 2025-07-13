;; -*- lexical-binding: t; -*-
;;; op.el --- Simple 1Password CLI integration for Emacs

;;; Commentary:

;; op.el provides a unified interface for reading and caching items from 1Password
;; using the official CLI (`op`).
;;
;; Features:
;; - Read 1Password items by path.
;; - Cache item values for faster repeated access.
;;
;; Usage:
;; 1. Call `op-read-item` with the item path to retrieve its value.
;; 2. The function caches the result, so subsequent calls for the same path are fast.
;;
;; Example:
;;   (op-read-item "op://Personal/github-token")
;;   (op-read-item "op://Work/aws-secret")
;;
;; Error handling:
;; - If the `op` CLI returns an error, the function returns nil.
;; - Cached values are not refreshed unless Emacs is restarted.

;;; Code:

(defgroup op nil
  "Integration with the 1Password CLI."
  :group 'tools)

(defvar op--item-cache nil
  "Cache for 1Password items retrieved via the CLI.")

(defun op-read-item (item-path)
  "Read and cache 1Password ITEM-PATH using the 1Password CLI (`op`).
Return the item's value as a string, or nil if an error occurred."
  (or (cdr (assoc item-path op--item-cache))
      (let ((value (string-trim-right
                    (shell-command-to-string (format "op read '%s'" item-path)))))
        (unless (string-match-p "\\[ERROR\\]" value)
          (push (cons item-path value) op--item-cache)
          value))))

(provide 'op)
