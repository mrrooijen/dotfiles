;; Theme Cycler =================================================================
;;
;; Use in config.el by calling `(set-themes '(theme-one theme-two ...))'
;; Call `cycle-themes' to cycle through the configured themes.
;; The first theme in the list is loaded by default.

(setq themes '(doom-one))
(setq themes-set nil)

(defun set-themes (theme-list)
  (when (not themes-set)
    (setq themes-set t)
    (setq themes theme-list)
    (cycle-themes)))

(defun cycle-themes ()
  (interactive)
  (let ((theme (pop themes)))
    (setq themes (append themes (list theme)))
    (disable-theme doom-theme)
    (load-theme theme t)
    theme))
