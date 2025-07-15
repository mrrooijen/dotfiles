;; -*- lexical-binding: t; -*-

(use-package vterm
  :straight t
  :after (evil general)
  :config
  (setq vterm-keymap-exceptions nil)
  :general
  (:keymaps 'vterm-mode-map
            [return] #'vterm-send-return
            :states '(insert)
            "C-e" #'vterm--self-insert
            "C-f" #'vterm--self-insert
            "C-a" #'vterm--self-insert
            "C-v" #'vterm--self-insert
            "C-b" #'vterm--self-insert
            "C-w" #'vterm--self-insert
            "C-u" #'vterm--self-insert
            "C-d" #'vterm--self-insert
            "C-n" #'vterm--self-insert
            "C-m" #'vterm--self-insert
            "C-p" #'vterm--self-insert
            "C-j" #'vterm--self-insert
            "C-k" #'vterm--self-insert
            "C-r" #'vterm--self-insert
            "C-t" #'vterm--self-insert
            "C-g" #'vterm--self-insert
            "C-c" #'vterm--self-insert
            "C-SPC" #'vterm--self-insert)
  (:keymaps 'vterm-mode-map
            :states '(normal)
            "C-d" #'vterm--self-insert
            "i" #'evil-insert-resume
            "o" #'evil-insert-resume
            "<return>" #'evil-insert-resume))

(use-package multi-vterm
  :straight t
  :after (evil general)
  :general
  (:states '(normal)
           :keymaps 'override
           "-" #'multi-vterm
           "M--" #'multi-vterm-next)
  (:states '(insert)
           :keymaps 'vterm-mode-map
           "M--" #'multi-vterm-next))
