;; -*- lexical-binding: t; -*-

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs startup time: %s seconds"
                     (float-time (time-subtract after-init-time before-init-time)))))

(add-hook 'before-save-hook
          (lambda ()
            (unless (derived-mode-p 'markdown-mode)
              (delete-trailing-whitespace))))
