;; -*- lexical-binding: t; -*-

(use-package gptel
  :straight (:host github :repo "karthink/gptel")
  :after op
  :general
  ("§ g c" 'gptel
   "§ g g" 'gptel-menu
   "§ g a" 'gptel-add
   "§ g f" 'gptel-add-file
   "§ g i" 'gptel-inline
   "§ g p" 'gptel-proofread)
  :config
  (setq gptel-model 'x-ai/grok-3-mini-beta
        gptel-backend (gptel-make-openai "OpenRouter"
                        :host "openrouter.ai"
                        :endpoint "/api/v1/chat/completions"
                        :stream t
                        :key (lambda () (op-read-item "op://Final Creation/OpenRouter/emacs-key"))
                        :models '(openai/o4-mini-high
                                  openai/o4-mini
                                  openai/gpt-4.1
                                  openai/gpt-4.1-mini
                                  openai/gpt-4.1-nano
                                  x-ai/grok-3-beta
                                  x-ai/grok-3-mini-beta
                                  meta-llama/llama-4-scout
                                  meta-llama/llama-4-maverick
                                  deepseek/deepseek-r1
                                  deepseek/deepseek-r1-distill-llama-70b
                                  qwen/qwq-32b
                                  anthropic/claude-3.7-sonnet
                                  google/gemini-2.5-flash-preview
                                  google/gemini-2.5-pro-preview-03-25
                                  google/gemma-3-27b-it
                                  microsoft/phi-4)))

  (defun gptel-send-string (str)
    "Send STR to gptel and insert the response.
If a region is active, insert the response at the end of the highlighted region;
otherwise, at the current cursor position."
    (interactive "sEnter the string to send: ")
    (let ((insert-pos (if (use-region-p)
                          (save-excursion
                            (goto-char (max (region-beginning) (region-end)))
                            (end-of-line)
                            (point))
                        (point))))
      (gptel-request str :buffer (current-buffer) :position insert-pos)))

  (defun gptel-inline (start end prompt)
    "Send the user's prompt prepended to the selected region as context to gptel.
Inserts the response after the region."
    (interactive "r\nsEnter your prompt: ")
    (let* ((context (buffer-substring-no-properties start end))
           (full-prompt (concat prompt "\n\n"
                                "----- Begin Context -----\n\n"
                                context
                                "\n\n----- End Context -----\n")))
      (gptel-send-string full-prompt)))

  (defun gptel-proofread (start end)
    "Proofread the selected region by correcting spelling, grammar,
and improving flow minimally when necessary, while preserving the text's language."
    (interactive "r")
    (let* ((text (buffer-substring-no-properties start end))
           (prompt (concat "Proofread the TEXT using the following instructions:\n"
                           "- Check and correct spelling and grammar.\n"
                           "- Improve flow only minimally if necessary.\n"
                           "- Preserve the TEXT's language.\n"
                           "- Return the corrected TEXT without any additional comments.\n\n"
                           "----- Begin TEXT -----\n\n"
                           text "\n\n"
                           "----- End TEXT -----\n")))
      (let ((original-model gptel-model))
        (unwind-protect
          (progn
            (setq gptel-model 'google/gemini-2.5-flash-preview)
            (gptel-send-string prompt))
          (setq gptel-model original-model))))))

(use-package op)
