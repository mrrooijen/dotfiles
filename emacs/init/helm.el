;; -*- lexical-binding: t; -*-

(straight-use-package 'helm)
(straight-use-package 'helm-projectile)

(helm-mode 1)

(setq helm-always-two-windows nil)
(setq helm-display-buffer-default-height 25)
(setq helm-default-display-buffer-functions '(display-buffer-in-side-window))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "s-b") #'helm-buffers-list)
(global-set-key (kbd "s-<backspace>") #'helm-resume)
(global-set-key (kbd "§ f f") #'helm-find-files)

(define-key evil-normal-state-map (kbd "_") #'helm-M-x)
(define-key evil-visual-state-map (kbd "_") #'helm-M-x)

(define-key helm-map (kbd "C-f") #'helm-next-page)
(define-key helm-map (kbd "C-b") #'helm-previous-page)
(define-key helm-map (kbd "C-l") #'helm-next-source)
(define-key helm-map (kbd "C-h") #'helm-previous-source)
(define-key helm-map (kbd "C-j") #'helm-next-line)
(define-key helm-map (kbd "C-k") #'helm-previous-line)
(define-key helm-map (kbd "M-h") #'backward-word)
(define-key helm-map (kbd "M-l") #'forward-word)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<escape>") #'helm-keyboard-quit)
