(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :general
  (:states '(normal)
   "§ a" 'aider-transient-menu)
  :config
  (setenv "OPENROUTER_API_KEY"
          (read-op-item "op://Final Creation/OpenRouter/emacs-key"))
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
  (setq aider-args '("--model" "openrouter/deepseek/deepseek-r1-distill-llama-70b"
                     "--editor-model" "openrouter/deepseek/deepseek-r1-distill-llama-70b"
                     "--weak-model" "openrouter/google/gemini-2.0-flash-001"
                     "--no-show-model-warnings")
        aider-popular-models '("openrouter/openai/o3-mini-high"
                               "openrouter/openai/o3-mini"
                               "openrouter/deepseek/deepseek-r1"
                               "openrouter/deepseek/deepseek-r1-distill-llama-70b"
                               "openrouter/qwen/qwq-32b"
                               "openrouter/anthropic/claude-3.7-sonnet"
                               "openrouter/google/gemini-2.0-flash-001"
                               "openrouter/microsoft/phi-4"))

  (defun aider-commit ()
    "Send the '/commit' command to Aider."
    (interactive)
    (aider--send-command "/commit"))
  (with-eval-after-load 'aider
    (transient-append-suffix 'aider-transient-menu "u"
      '("C" "Commit changes" aider-commit))))
