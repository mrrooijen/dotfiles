(flycheck-def-config-file-var flycheck-standardrbrc ruby-standardrb ".standard.yml"
  :safe #'stringp)

(flycheck-def-option-var flycheck-standardrb-lint-only nil ruby-standardrb
  "Whether to only report code issues in Standardrb.

When non-nil, only report code issues in Standardrb, via `--lint'.
Otherwise report style issues as well."
  :safe #'booleanp
  :type 'boolean
  :package-version '(flycheck . "0.16"))

(flycheck-define-checker ruby-standardrb
  "A Ruby syntax and style checker using the testdouble/standard gem."
  :command ("standardrb"
            "--display-cop-names"
            "--force-exclusion"
            "--format" "emacs"
            ;; Explicitly disable caching to prevent Rubocop 0.35.1 and earlier
            ;; from caching standard input.  Later versions of Rubocop
            ;; automatically disable caching with --stdin, see
            ;; https://github.com/flycheck/flycheck/issues/844 and
            ;; https://github.com/bbatsov/rubocop/issues/2576
            "--cache" "false"
            (config-file "--config" flycheck-standardrbrc)
            (option-flag "--lint" flycheck-standardrb-lint-only)
            ;; Standardrb takes the original file name as argument when reading
            ;; from standard input
            "--stdin" source-original)
  :standard-input t
  :working-directory flycheck-ruby--find-project-root
  :error-patterns
  ((info line-start (file-name) ":" line ":" column ": C: "
         (optional (id (one-or-more (not (any ":")))) ": ") (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": W: "
            (optional (id (one-or-more (not (any ":")))) ": ") (message)
            line-end)
   (error line-start (file-name) ":" line ":" column ": " (or "E" "F") ": "
          (optional (id (one-or-more (not (any ":")))) ": ") (message)
          line-end))
  :modes (enh-ruby-mode ruby-mode)
  :next-checkers ((warning . ruby-reek)
                  (warning . ruby-rubylint)))

(provide 'flycheck-standardrb)
;;; flycheck-standardrb ends here
