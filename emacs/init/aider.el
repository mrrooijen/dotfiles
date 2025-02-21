(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :general
  (:states '(normal)
   "§ a" 'aider-transient-menu)
  :config
  (setenv "OPENROUTER_API_KEY" (read-op-item "op://Final Creation/OpenRouter/emacs-key"))
  (setenv "AIDER_COMMIT_PROMPT" "Write a concise commit message describing the changes without using prefixes like 'feat:' or 'fix:'")
  (setq aider-args '("--model" "openrouter/google/gemini-2.0-flash-001"
                     "--weak-model" "openrouter/google/gemini-2.0-flash-001"
                     "--no-show-model-warnings")
        aider-popular-models '("openrouter/openai/o3-mini"
                               "openrouter/anthropic/claude-3.5-sonnet"
                               "openrouter/google/gemini-2.0-flash-001"
                               "openrouter/deepseek/deepseek-r1"
                               "openrouter/deepseek/deepseek-r1-distill-llama-70b"))
  (defun aider-commit ()
    "Send the '/commit' command to the Aider buffer for the current project if it’s running."
    (interactive)
    (condition-case err
        (let* ((buffer-name (aider-buffer-name))
               (aider-buffer (get-buffer buffer-name)))
          (if (and aider-buffer
                   (string= (buffer-local-value 'major-mode aider-buffer) 'comint-mode)
                   (process-live-p (get-buffer-process aider-buffer)))
              (progn
                (with-current-buffer aider-buffer
                  (goto-char (point-max))
                  (insert "/commit")
                  (comint-send-input))
                (message "Sent /commit to Aider"))
            (message "Aider is not running for this project. Start it first.")))
      (error (message "Error finding Aider buffer: %s" (error-message-string err)))))
  (with-eval-after-load 'aider
    (transient-append-suffix 'aider-transient-menu "g"
      '("C" "Commit changes" aider-commit))))
