;; Font

(defvar aesthetics/font-type nil "The currently selected font type.")
(defvar aesthetics/font-size nil "The currently selected font size.")

(defun set-font (type size)
  "Sets the font TYPE and SIZE."
  (interactive)
  (setq aesthetics/font-type type)
  (setq aesthetics/font-size size)
  (set-frame-font (concat aesthetics/font-type " " (number-to-string aesthetics/font-size))))

(defun reset-font ()
  "Resets the aesthetics/font-size to 15."
  (interactive)
  (set-font aesthetics/font-type 15))

(defun increase-font ()
  "Increases the aesthetics/font-size by 1 (max: 30)."
  (interactive)
  (when (< aesthetics/font-size 30)
    (setq aesthetics/font-size (+ aesthetics/font-size 1))
    (set-frame-font (concat aesthetics/font-type " " (number-to-string (+ 1 aesthetics/font-size))))))

(defun decrease-font ()
  "Decreases the aesthetics/font-size by 1 (min: 5)."
  (interactive)
  (when (> aesthetics/font-size 5)
    (setq aesthetics/font-size (- aesthetics/font-size 1))
    (set-frame-font (concat aesthetics/font-type " " (number-to-string (+ 1 aesthetics/font-size))))))

(set-font "Menlo" 15) ; Default


;; Theme

(defvar aesthetics/theme "wombat" "The currently selected theme.")
(defvar aesthetics/themes '(wombat) "The cycleable themes.")
(defvar aesthetics/themes-set nil "Prevents `set-themes` from running twice. `t` if set.")

(defun set-themes (theme-list)
  "Configures the provided THEME-LIST to be cycleable using cycle-themes."
  (when (not aesthetics/themes-set)
    (setq aesthetics/themes-set t)
    (setq aesthetics/themes theme-list)
    (cycle-themes)))

(defun cycle-themes ()
  "Cycles through the themes defined in aesthetics/themes, which was set by set-themes."
  (interactive)
  (let ((theme (pop aesthetics/themes)))
    (setq aesthetics/themes (append aesthetics/themes (list theme)))
    (disable-theme aesthetics/theme)
    (load-theme theme t)
    (message "%s" theme)
    (setq aesthetics/theme theme)
    theme))

(load-theme (elt aesthetics/themes 0) t) ; Default
