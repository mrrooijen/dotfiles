;; -*- lexical-binding: t; -*-
;;; visage.el --- Unified Emacs appearance manager

;;; Commentary:
;;; visage.el manages Emacs themes and fonts.
;;;
;;; Features:
;;; - Cycle through themes.
;;; - Set, increase, decrease, and reset font family and size.
;;; - Adjust line spacing and line height.
;;;
;;; Usage:
;;; 1. Set `visage-themes`, `visage-default-font-type`, and `visage-default-font-size`.
;;; 2. Run `visage-set-default-theme` and `visage-set-default-font`.
;;; 3. Use `visage-next-theme`, `visage-increase-font`, `visage-decrease-font`, and `visage-set-font` interactively or bind them to keys.
;;;
;;; Example:
;;;   (setq visage-themes '(wombat adwaita))
;;;   (setq visage-default-font-type "Menlo")
;;;   (setq visage-default-font-size 15)
;;;   (visage-set-default-theme)
;;;   (visage-set-default-font)

;;; Code:


;;; --- Customization Group ---
(defgroup visage nil
  "Manage Emacs themes and fonts."
  :group 'appearance)


;;; --- Theme Management ---


(defcustom visage-themes '(wombat adwaita)
  "List of themes to cycle through."
  :type '(repeat symbol)
  :group 'visage)


(defvar visage-current-theme (car visage-themes)
  "Currently active theme.")


(defun visage--apply-theme (theme)
  "Disable all enabled themes and load THEME."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))


(defun visage-set-default-theme ()
  "Apply the first theme in `visage-themes`."
  (interactive)
  (setq visage-current-theme (car visage-themes))
  (visage--apply-theme visage-current-theme))


(defun visage-next-theme ()
  "Cycle to the next theme in `visage-themes`."
  (interactive)
  (let* ((themes visage-themes)
         (idx (cl-position visage-current-theme themes))
         (next-idx (mod (1+ (or idx 0)) (length themes)))
         (next-theme (nth next-idx themes)))
    (setq visage-current-theme next-theme)
    (visage--apply-theme next-theme)
    (message "Theme: %s" next-theme)))


;;; --- Font Management ---


(defcustom visage-default-font-type "Menlo"
  "Default font family."
  :type 'string
  :group 'visage)


(defcustom visage-default-font-size 15
  "Default font size."
  :type 'integer
  :group 'visage)


(defcustom visage-default-line-spacing 0.25
  "Default line spacing."
  :type 'number
  :group 'visage)


(defcustom visage-default-line-height 1.25
  "Default line height."
  :type 'number
  :group 'visage)


(defvar visage-current-font-type visage-default-font-type
  "Currently active font family.")

(defvar visage-current-font-size visage-default-font-size
  "Currently active font size.")

(defun visage-set-font (type size)
  "Set font TYPE and SIZE, and adjust line spacing and line height."
  (interactive
   (list (read-string "Font type: " visage-current-font-type)
         (read-number "Font size: " visage-current-font-size)))
  (setq visage-current-font-type type)
  (setq visage-current-font-size size)
  (set-face-attribute 'default nil :font (format "%s-%d" type size))
  (setq-default line-spacing visage-default-line-spacing)
  (setq-default default-text-properties
                `(line-spacing ,visage-default-line-spacing line-height ,visage-default-line-height))
  (message "Font: %s %d | spacing: %.2f | height: %.2f"
           type size visage-default-line-spacing visage-default-line-height))

(defun visage-set-default-font ()
  "Set the default font, line spacing, and line height."
  (interactive)
  (visage-set-font visage-default-font-type visage-default-font-size))

(defun visage-increase-font ()
  "Increase the font size by 1, up to a maximum of 50."
  (interactive)
  (let ((new-size (min 50 (1+ visage-current-font-size))))
    (visage-set-font visage-current-font-type new-size)))

(defun visage-decrease-font ()
  "Decrease the font size by 1, down to a minimum of 10."
  (interactive)
  (let ((new-size (max 10 (1- visage-current-font-size))))
    (visage-set-font visage-current-font-type new-size)))

(provide 'visage)
