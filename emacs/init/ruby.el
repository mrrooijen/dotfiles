;; -*- lexical-binding: t; -*-

(use-package enh-ruby-mode
  :straight t
  :after (general evil)
  :init
  (add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\)\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\(Gemfile\\|Rakefile\\|Guardfile\\)\\'" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
  :config
  (defun simplecov-open ()
    (interactive)
    (projectile-run-shell-command-in-root "open coverage/index.html"))
  :general
  (:keymaps 'enh-ruby-mode-map :states 'normal
            "<tab>" #'hs-toggle-hiding
            ", t c" #'simplecov-open))

(use-package inf-ruby
  :straight t
  :after (general evil)
  :hook (enh-ruby-mode . inf-ruby-minor-mode)
  :config
  (defun inf-ruby-console-rails-from-project-root ()
    (interactive)
    (inf-ruby-console-rails (projectile-project-root)))
  :general
  (:keymaps 'enh-ruby-mode-map :states 'normal
            ", i s" #'ruby-switch-to-inf
            ", i i" #'inf-ruby
            ", i r" #'inf-ruby-console-rails-from-project-root))

(use-package yard-mode
  :straight t
  :hook (enh-ruby-mode . yard-mode))

(use-package robe
  :straight t
  :after (general evil company)
  :hook (enh-ruby-mode . robe-mode)
  :config (add-to-list 'company-backends 'company-robe)
  :general (:keymaps 'enh-ruby-mode-map :states 'normal "s-<return>" #'robe-jump))

(use-package minitest
  :straight t
  :after (general evil)
  :hook (enh-ruby-mode . minitest-mode)
  :general
  (:keymaps 'enh-ruby-mode-map :states 'normal
            ", t t" #'minitest-verify-single
            ", t f" #'minitest-verify
            ", t a" #'minitest-verify-all))
