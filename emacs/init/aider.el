(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :general
  (:states '(normal)
   "§ a" 'aider-transient-menu)
  :config
  (setenv "OPENROUTER_API_KEY" (read-op-item "op://Final Creation/OpenRouter/emacs-key"))
  (setq aider-args '("--model" "openrouter/google/gemini-2.0-flash-001"
                     "--weak-model" "openrouter/google/gemini-2.0-flash-001"
                     "--no-show-model-warnings")
        aider-popular-models '("openrouter/openai/o3-mini"
                               "openrouter/anthropic/claude-3.5-sonnet"
                               "openrouter/google/gemini-2.0-flash-001"
                               "openrouter/deepseek/deepseek-r1-distill-llama-70b")))
