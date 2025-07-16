;; -*- lexical-binding: t; -*-

(straight-use-package 'enh-ruby-mode)
(straight-use-package 'yard-mode)
(straight-use-package 'inf-ruby)
(straight-use-package 'robe)
(straight-use-package 'minitest)

(defun enh-ruby-next-method ()
  "Move point to the beginning of the next method in enh-ruby-mode."
  (interactive)
  (when (looking-at "\\s-*def")
    (end-of-line))
  (unless (re-search-forward "\\s-*def" nil t)
    (goto-char (point-min))
    (re-search-forward "\\s-*def" nil t))
  (beginning-of-line))

(defun inf-ruby-console-rails-from-project-root ()
  (interactive)
  (inf-ruby-console-rails (projectile-project-root)))

(defun simplecov-open ()
  (interactive)
  (projectile-run-shell-command-in-root "open coverage/index.html"))

(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook #'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook #'robe-mode)
(add-hook 'enh-ruby-mode-hook #'yard-mode)

(with-eval-after-load 'enh-ruby-mode
  (evil-define-key 'normal enh-ruby-mode-map
    (kbd "<tab>")      #'hs-toggle-hiding
    (kbd "C-<tab>")    #'enh-ruby-next-method
    (kbd "s-<return>") #'robe-jump
    (kbd ", i s")      #'ruby-switch-to-inf
    (kbd ", i i")      #'inf-ruby
    (kbd ", i r")      #'inf-ruby-console-rails-from-project-root
    (kbd ", t t")      #'minitest-verify-single
    (kbd ", t f")      #'minitest-verify
    (kbd ", t a")      #'minitest-verify-all
    (kbd ", t c")      #'simplecov-open))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-robe))
