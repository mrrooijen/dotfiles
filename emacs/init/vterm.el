;; -*- lexical-binding: t; -*-

(straight-use-package 'vterm)
(straight-use-package 'multi-vterm)

(evil-define-key 'normal global-map (kbd "-") #'multi-vterm)

(with-eval-after-load 'vterm
  (setq vterm-keymap-exceptions nil)
  (evil-define-key 'insert vterm-mode-map
    [return]      #'vterm-send-return
    (kbd "C-e")   #'vterm--self-insert
    (kbd "C-f")   #'vterm--self-insert
    (kbd "C-a")   #'vterm--self-insert
    (kbd "C-v")   #'vterm--self-insert
    (kbd "C-b")   #'vterm--self-insert
    (kbd "C-w")   #'vterm--self-insert
    (kbd "C-u")   #'vterm--self-insert
    (kbd "C-d")   #'vterm--self-insert
    (kbd "C-n")   #'vterm--self-insert
    (kbd "C-m")   #'vterm--self-insert
    (kbd "C-p")   #'vterm--self-insert
    (kbd "C-j")   #'vterm--self-insert
    (kbd "C-k")   #'vterm--self-insert
    (kbd "C-r")   #'vterm--self-insert
    (kbd "C-t")   #'vterm--self-insert
    (kbd "C-g")   #'vterm--self-insert
    (kbd "C-c")   #'vterm--self-insert
    (kbd "C-SPC") #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map
    (kbd "C-d")      #'vterm--self-insert
    (kbd "i")        #'evil-insert-resume
    (kbd "o")        #'evil-insert-resume
    (kbd "<return>") #'evil-insert-resume))

(with-eval-after-load 'multi-vterm
  (evil-define-key 'normal global-map (kbd "M--") #'multi-vterm-next)
  (evil-define-key 'insert vterm-mode-map (kbd "M--") #'multi-vterm-next))
