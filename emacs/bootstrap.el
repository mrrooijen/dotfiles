;; Core =========================================================================

(setq native-comp-deferred-compilation-deny-list nil) ;; fix: https://github.com/raxod502/straight.el/issues/757
(setq gc-cons-threshold (* 1024 1024 100))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq custom-file "~/.emacs.d/custom.el")
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq fill-column 80)
(setq scroll-margin 1)
(setq scroll-conservatively 10000)
(setq scroll-step 1)
(setq auto-window-vscroll nil)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ring-bell-function 'ignore)

(unless (file-exists-p temporary-file-directory)
  (make-directory temporary-file-directory))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 0)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)


;; Native Compilation ===========================================================

(setq comp-speed 2)

(when (boundp 'comp-eln-load-path)
  (setcar comp-eln-load-path
          (expand-file-name "cache/eln-cache/" user-emacs-directory)))


;; Package Management ===========================================================

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(defvar bootstrap-version)

(let ((bootstrap-file "~/.emacs.d/straight/repos/straight.el/bootstrap.el")
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq system-packages-use-sudo nil)

(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))


;; Keybinding System ============================================================

(use-package general
  :straight t
  :config   (general-auto-unbind-keys))

(use-package which-key
  :straight t
  :config   (which-key-mode 1))


;; Misc Packages ================================================================

(use-package restart-emacs :straight t)


;; Reset GC Configuration =======================================================

(setq gc-cons-threshold 800000)
