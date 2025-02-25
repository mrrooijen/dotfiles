(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :general
  (:states '(normal)
   "§ a" 'aider-transient-menu)
  :config
  (setenv "OPENROUTER_API_KEY"
          (read-op-item "op://Final Creation/OpenRouter/emacs-key"))
  (setenv "AIDER_COMMIT_PROMPT"
          (concat "Request: Write a commit message describing the change(s).\n"
                  "Instructions:"
                  "- Use git message format '<Action> <Description>' (example: 'Refactor diff function to improve readability').\n"
                  "- Don't prefix the commit message using '<action|commit-type>:' such as 'feat:', 'fix:', 'refactor:'.\n"
                  "- Keep the title concise.\n"
                  "- Keep the title sufficiently abstract if the changes don't fit on a single line, and add a body to elaborate.\n"))
  (setq aider-args '("--model" "openrouter/openai/o3-mini-high"
                     "--editor-model" "openrouter/openai/o3-mini-high"
                     "--weak-model" "openrouter/google/gemini-2.0-flash-001"
                     "--no-show-model-warnings")
        aider-popular-models '("openrouter/google/gemini-2.0-flash-001"
                               "openrouter/anthropic/claude-3.7-sonnet"
                               "openrouter/openai/o3-mini"
                               "openrouter/openai/o3-mini-high"
                               "openrouter/deepseek/deepseek-r1"
                               "openrouter/deepseek/deepseek-r1-distill-llama-70b"))
  (defun aider-commit ()
    "Send the '/commit' command to Aider."
    (interactive)
    (aider--send-command "/commit"))
  (with-eval-after-load 'aider
    (transient-append-suffix 'aider-transient-menu "u"
      '("C" "Commit changes" aider-commit))))
