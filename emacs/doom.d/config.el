;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; User =========================================================================

(setq user-full-name "Michael van Rooijen")

(setq user-mail-address "michael@vanrooijen.io")


;; Buffer =======================================================================

(set-themes '(doom-one doom-one-light))

(custom-set-faces
 `(lazy-highlight ((t (:background "#D23782" :foreground "#FFFFFF"))))
 `(evil-ex-search ((t (:background "#D23782" :foreground "#FFFFFF")))))

(setq doom-font (font-spec :family "SF Mono" :size 16))

(setq evil-normal-state-cursor '(box "#D23782")
      evil-insert-state-cursor '(bar "#D23782")
      evil-visual-state-cursor '(box "#D23782"))

(setq display-line-numbers-type t)

(global-visual-line-mode)

(auto-fill-mode)


;; Mappings =====================================================================

(setq doom-leader-key "§")

(setq doom-leader-alt-key "§")

(setq doom-localleader-key ",")

(map! :g "s-q" nil)

(map! :leader :g "tt" 'cycle-themes)

(map! :gn "s-0" 'doom/reset-font-size)

(map! :n "M-<tab>" 'evil-window-next)

(map! :nv ",ci" 'evilnc-comment-or-uncomment-lines)

(map! :i "M-<tab>" 'hippie-expand)

(map! :n "SPC" 'evil-forward-char)

(map! :n "To" '+treemacs/toggle :n "s-b" 'ivy-switch-buffer)

(map! :n "s-<backspace>" 'ivy-resume)

(map! :n "-" 'shell)

(map! :n "_" 'execute-extended-command)

(map! :n "s-F" '+ivy/project-search)

(map! :n "s-f" '+ivy/projectile-find-file)

(map! :n "s-p" 'doom/find-file-in-other-project)

(map! :n "!" 'projectile-run-async-shell-command-in-root)

(map! :n "+" 'magit-status)

(map! :n ",m" '+make/run)

(map! :g "M-f" 'delete-other-windows)

(map! :v "+" (lambda (begin end)
                (interactive "r")
                (align-regexp begin end "\\(\\s-*\\)=" 1 1)))

(map! :map treemacs-mode-map :gn "<escape>" '+treemacs/toggle)

(map! :map treemacs-mode-map :g "M-<tab>" 'evil-window-next)

(map! :map magit-status-mode-map :gn "<escape>" '+magit/quit)

(map! :map magit-status-mode-map :n "M-<tab>" 'evil-window-next)

(map! :map magit-diff-mode-map :g "M-<tab>" 'evil-window-next)

(map! :map magit-process-mode-map :g "M-<tab>" 'evil-window-next)

(map! :map magit-log-mode-map :g "M-<tab>" 'evil-window-next)

(map! :map minitest-mode-map :n ",tt" (lambda ()
                                        (interactive)
                                        (minitest-verify)
                                        (previous-multiframe-window)))

(map! :map minitest-mode-map :n ",ta" (lambda ()
                                        (interactive)
                                        (minitest-verify-all)
                                        (previous-multiframe-window)))

(map! :map clojure-mode-map :localleader :nv "k" 'cider-connect-clj)

(map! :map clojure-mode-map :localleader :nv "=" 'clojure-align)

(map! :map parinfer-mode-map :localleader :prefix "c" :nv "i"
      'evilnc-comment-or-uncomment-lines)


;; Advices =====================================================================

(advice-add 'evilnc-comment-or-uncomment-lines
            :after (lambda (_)
                     (when (bound-and-true-p parinfer-mode)
                       (parinfer-indent-buffer))))


;; Hooks ========================================================================

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'ruby-mode-hook 'chruby-use-corresponding)
