(defun switch-to-scratch-buffer ()
  "Switch to the scratch buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun cycle-language ()
  "Cycles between American English and Dutch dictionaries."
  (interactive)
  (if (string= "en_US" ispell-current-dictionary)
    (ispell-change-dictionary "nl")
    (ispell-change-dictionary "en_US"))
  (flyspell-buffer))

(defun align-by-equals-symbol (begin end)
  "Vertically aligns `=` signs in the selected region."
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1))

(defun evil-shift-left-visual ()
  "Shifts the selected region to the left while retaining the selection."
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  "Shifts the selected region to the right while retaining the selection."
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun insert-euro-symbol ()
  "Inserts the € symbol at the cursor's position."
  (interactive)
  (insert "€"))

(defun insert-paragraph-symbol ()
  "Inserts the § symbol at the cursor's position."
  (interactive)
  (insert "§"))

(defun upgrade-packages ()
  "Upgrades all packages to their latest version (using Straight.el) and updates the lockfile."
  (interactive)
  (straight-pull-all)
  (straight-freeze-versions))

(defun rollback-packages ()
  "Drops all changes to the lockfile, resulting in a rollback of all packages."
  (interactive)
  (shell-command "git -C $HOME/.dotfiles checkout -- emacs/straight.lock.el"))
