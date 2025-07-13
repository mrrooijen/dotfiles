;; -*- lexical-binding: t; -*-
;;; visage.el --- Unified Emacs aesthetics manager (theme & font)

;;; Commentary:

;; visage.el provides unified management for Emacs appearance.
;;
;; Features:
;; - Theme cycling: Easily switch between a list of preferred themes.
;; - Font management: Change, increase, decrease, and reset font family and size.
;;
;; Usage:
;; 1. Configure your preferred themes and fonts via `visage-themes`, `visage-default-font-type`, and `visage-default-font-size`.
;; 2. Call `visage-set-default-theme` and `visage-set-default-font` to initialize.
;; 3. Use `visage-next-theme`, `visage-increase-font`, `visage-decrease-font`, and `visage-set-font` interactively or bind them to keys.
;;
;; Example config:
;;   (setq visage-themes '(wombat adwaita))
;;   (setq visage-default-font-type "Menlo")
;;   (setq visage-default-font-size 15)
;;   (visage-set-default-theme)
;;   (visage-set-default-font)
;;
;; See source for customization options.

;;; Code:

(defgroup visage nil
  "Unified appearance manager: theme cycling and font control."
  :group 'appearance)

;; -------------------
;; Theme Management
;; -------------------

(defcustom visage-themes '(wombat adwaita)
  "List of themes to cycle through. Defaults to built-in Emacs themes: wombat (dark) and adwaita (light)."
  :type '(repeat symbol)
  :group 'visage)

(defvar visage-current-theme (car visage-themes)
  "Currently enabled theme.")

(defun visage--apply-theme (theme)
  "Disable other themes and load THEME."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(defun visage-set-default-theme ()
  "Set the first theme in `visage-themes` as the default."
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
    (message "Theme switched to: %s" next-theme)))

;; ----------------
;; Font Management
;; ----------------

(defcustom visage-default-font-type "Menlo"
  "Default font family used by visage."
  :type 'string
  :group 'visage)

(defcustom visage-default-font-size 15
  "Default font size used by visage."
  :type 'integer
  :group 'visage)

(defvar visage-current-font-type visage-default-font-type
  "Current font family.")

(defvar visage-current-font-size visage-default-font-size
  "Current font size.")

(defun visage-set-font (type size)
  "Set font TYPE and SIZE for the current frame and remember the values."
  (interactive
   (list (read-string "Font type: " visage-current-font-type)
         (read-number "Font size: " visage-current-font-size)))
  (setq visage-current-font-type type
        visage-current-font-size size)
  (set-face-attribute 'default nil :font (format "%s-%d" type size))
  (message "Font set to: %s %d" type size))

(defun visage-set-default-font ()
  "Set the default font type and size."
  (interactive)
  (visage-set-font visage-default-font-type visage-default-font-size))

(defun visage-increase-font ()
  "Increase font size."
  (interactive)
  (let ((new-size (min 100 (1+ visage-current-font-size))))
    (visage-set-font visage-current-font-type new-size)))

(defun visage-decrease-font ()
  "Decrease font size."
  (interactive)
  (let ((new-size (max 5 (1- visage-current-font-size))))
    (visage-set-font visage-current-font-type new-size)))

(provide 'visage)
