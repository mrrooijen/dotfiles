;; -*- lexical-binding: t; -*-

(use-package aider
  :straight t
  :after (general evil)
  :config
  (setq aider-args '("--model" "openrouter/openai/o4-mini-high"
                     "--editor-model" "openrouter/openai/o4-mini-high"
                     "--weak-model" "openrouter/openai/o4-mini-high"
                     "--no-show-model-warnings")
        aider-popular-models '("openrouter/openai/o4-mini-high"))
  (setenv "OPENROUTER_API_KEY"
          (op-read-item "op://Final Creation/OpenRouter/emacs-key"))
  (setenv "AIDER_COMMIT_PROMPT"
          (concat "Write a commit message describing the change(s) using the following instructions:\n"
                  "- Use best practices for writing commit messages.\n"
                  "- Use git message format '<Action> <Description>' (e.g. 'Refactor diff function to improve readability').\n"
                  "- Don't prefix the commit message using '<action|commit-type>:' (e.g. 'feat:', 'fix:', 'refactor:').\n"
                  "- Don't wrap the commit message in symbols such as **, --, ```, etc.\n"
                  "- Write a title that accurately describes the change if the change is sufficiently small.\n"
                  "- Write an abstract title if the change can't be summarized in a single line.\n"
                  "- Write a concise body, preferring bullet points, without unnecessary details or assumptions, to elaborate when writing an abstract title.\n"
                  "- Return just the commit message (title and optional body), without any additional comments.\n\n"))
  (transient-append-suffix 'aider-transient-menu "u"
    '("C" "Commit changes" (lambda () (interactive) (aider--send-command "/commit"))))
  :general
  (:states 'normal
           "§ a" #'aider-transient-menu))
