(eval-after-load 'term
  '(term-set-escape-char ?\C-x))


 (defun my-term-switch-line-char ()
   "Switch `term-in-line-mode' and `term-in-char-mode' in `ansi-term'"
   (interactive)
   (cond
    ((term-in-line-mode)
     (term-char-mode)
     (hl-line-mode -1))
    ((term-in-char-mode)
     (term-line-mode)
     (hl-line-mode 1))))



(add-hook 'term-mode-hook (lambda ()
			    (eterm-256color-mode 1)
			    (yas-minor-mode -1)
			    (setq term-buffer-maximum-size 1000)
			    (define-key term-raw-map (kbd "C-t") 'my-term-switch-line-char)
			    (define-key term-mode-map (kbd "C-t") 'my-term-switch-line-char)
			    (define-key term-raw-map (kbd "M-x") 'execute-extended-command)
			    (define-key term-raw-map (kbd "C-y") 'term-paste)
			    ))
 


;; (defun xah-next-user-buffer ()
;;   "Switch to the next user buffer.
;; “user buffer” is determined by `xah-user-buffer-q'.
;; URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
;; Version 2016-06-19"
;;   (interactive)
;;   (next-buffer)
;;   (let ((i 0))
;;     (while (< i 20)
;;       (if (not (xah-user-buffer-q))
;;           (progn (next-buffer)
;;                  (setq i (1+ i)))
;;         (progn (setq i 100))))))

;; (defun xah-previous-user-buffer ()
;;   "Switch to the previous user buffer.
;; “user buffer” is determined by `xah-user-buffer-q'.
;; URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
;; Version 2016-06-19"
;;   (interactive)
;;   (previous-buffer)
;;   (let ((i 0))
;;     (while (< i 20)
;;       (if (not (xah-user-buffer-q))
;;           (progn (previous-buffer)
;;                  (setq i (1+ i)))
;;         (progn (setq i 100))))))


;; (defun xah-user-buffer-q ()
;;   "Return t if current buffer is a user buffer, else nil.
;; Typically, if buffer name starts with *, it's not considered a user buffer.
;; This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
;; You can override this function to get your idea of “user buffer”.
;; version 2016-06-18"
;;   (interactive)
;;   (if (string-equal "*" (substring (buffer-name) 0 1))
;;       nil
;;     (if (string-equal major-mode "dired-mode")
;;         nil
;;       t
;;       )))


;; (defun xah-next-emacs-buffer ()
;;   "Switch to the next emacs buffer.
;; “emacs buffer” here is buffer whose name starts with *.
;; URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
;; Version 2016-06-19"
;;   (interactive)
;;   (next-buffer)
;;   (let ((i 0))
;;     (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
;;       (setq i (1+ i)) (next-buffer))))

;; (defun xah-previous-emacs-buffer ()
;;   "Switch to the previous emacs buffer.
;; “emacs buffer” here is buffer whose name starts with *.
;; URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
;; Version 2016-06-19"
;;   (interactive)
;;   (previous-buffer)
;;   (let ((i 0))
;;     (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
;;       (setq i (1+ i)) (previous-buffer))))






;; (defun last-term-buffer (l)
;;   "Return most recently used term buffer."
;;   (when l
;;     (if (eq 'term-mode (with-current-buffer (car l) major-mode))
;; 	(car l) (last-term-buffer (cdr l)))))

;; (defun get-term ()
;;   "Switch to the term buffer last used, or create a new one if
;;     none exists, or if the current buffer is already a term."
;;   (interactive)
;;   (let ((b (last-term-buffer (buffer-list))))
;;     (if (or (not b) (eq 'term-mode major-mode))
;; 	(multi-term)
;;       (switch-to-buffer b))))



;; (defun toggle-term ()
;;   "Toggles between terminal and current buffer (creates terminal, if none exists)"
;;   (interactive)
;;   (if (string= (buffer-name) "*ansi-term*")
;;       (switch-to-buffer (other-buffer (current-buffer)))
;;     (if (get-buffer "*ansi-term*")
;;         (switch-to-buffer "*ansi-term*")
;;       (progn
;;         (ansi-term (getenv "SHELL"))
;;         (setq show-trailing-whitespace nil)))))


;; (setq multi-term-dedicated-select-after-open-p t)
;; (setq multi-term-dedicated-close-back-to-open-buffer-p t)
;; (global-set-key (kbd "<f9>") 'multi-term-dedicated-toggle)







;;; term-toggle.el --- Toggle to and from the *terminal* buffer

;; Filename: term-toggle.el
;; Description: Toggle to and from the *terminal* buffer
;; Author: Joseph <jixiuf@gmail.com>
;; Maintainer: Joseph <jixiuf@gmail.com>
;; Copyright (C) 2011~, Joseph, all rights reserved.
;; Created: 2011-03-02
;; Version: 0.1.0
;; URL: http://www.emacswiki.org/term-toggle.el
;; Keywords:  term toggle shell
;; Compatibility: (Test on GNU Emacs 23.2.1).
;;
;;; This file is NOT part of GNU Emacs
;;
;;{{{ License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;}}}

;;; Commentary:
;;  Most of code is got from 
;;  http://user.it.uu.se/~mic/shell-toggle.el
;;  And thanks to the Author:Mikael Sjödin <mic@docs.uu.se>
;;  The only diffenerce to shell-toggle.el
;;  is this will use `term' command instead of `shell'

;;; Installation:
;;;
;;; o Place this file in a directory in your 'load-path.
;;; o Put the following in your .emacs file:
;;;   (autoload 'term-toggle "term-toggle" 
;;;    "Toggles between the *terminal* buffer and whatever buffer you are editing."
;;;    t)
;;;   (autoload 'term-toggle-cd "term-toggle" 
;;;    "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;;;   (global-set-key [M-f1] 'term-toggle)
;;;   (global-set-key [C-f1] 'term-toggle-cd)
;;; o Restart your Emacs.  To use term-toggle just hit M-f1 or C-f1
;;;

;;; Commands:
;;
;; Below are complete command list:
;;
;;  `term-toggle-cd'
;;    Calls `term-toggle' with a prefix argument.  Se command `term-toggle'
;;  `term-toggle'
;;    Toggles between the *terminal* buffer and whatever buffer you are editing.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;


(require 'term)
(defvar term-toggle-goto-eob t
  "*If non-nil `term-toggle' will move point to the end of the shell-buffer
whenever the `term-toggle' switched to the shell-buffer.

When `term-toggle-cd' is called the point is allways moved to the end of the
shell-buffer")

(defvar term-toggle-automatic-cd t
  "*If non-nil `term-toggle-cd' will send the \"cd\" command to the shell.
If nil `term-toggle-cd' will only insert the \"cd\" command in the 
shell-buffer.  Leaving it to the user to press RET to send the command to 
the shell.")

(defun term-toggle-cd ()
  "Calls `term-toggle' with a prefix argument.  Se command `term-toggle'"
  (interactive)
  (term-toggle t))

(defun term-toggle (make-cd)
  "Toggles between the *terminal* buffer and whatever buffer you are editing.
With a prefix ARG also insert a \"cd DIR\" command into the shell, where DIR is
the directory of the current buffer.

Call twice in a row to get a full screen window for the *terminal* buffer.

When called in the *terminal* buffer returns you to the buffer you were editing
before caling the first time.

Options: `term-toggle-goto-eob'"
  (interactive "P")
  ;; Try to descide on one of three possibilities:
  ;; If not in shell-buffer, switch to it.
  ;; If in shell-buffer and called twice in a row, delete other windows
  ;; If in shell-buffer and not called twice in a row, return to state before
  ;;  going to the shell-buffer 
  (if (eq major-mode 'term-mode)
      (if (and (or (eq last-command 'term-toggle)
		   (eq last-command 'term-toggle-cd))
	        (not (eq (count-windows) 1)))
	  (delete-other-windows)
	(term-toggle-buffer-return-from-shell))
    (term-toggle-buffer-goto-shell make-cd)))

;;; ======================================================================
;;; Internal functions and declarations

(defvar term-toggle-pre-shell-win-conf nil
  "Contains the window configuration before the *terminal* buffer was selected")



(defun term-toggle-buffer-return-from-shell ()
  "Restores the window configuration used before switching the *terminal* buffer.
If no configuration has been stored, just burry the *terminal* buffer."
  (if (window-configuration-p term-toggle-pre-shell-win-conf)
      (progn
	(set-window-configuration term-toggle-pre-shell-win-conf)
	(setq term-toggle-pre-shell-win-conf nil)
	(bury-buffer (get-buffer "*terminal*")))
    (bury-buffer))
  )


(defun term-toggle-buffer-goto-shell (make-cd)
  "Switches other window to the *terminal* buffer.  If no *terminal* buffer exists
start a new shell and switch to it in other window.  If argument MAKE-CD is
non-nil, insert a \"cd DIR\" command into the shell, where DIR is the directory
of the current buffer.

Stores the window cofiguration before creating and/or switching window."
  (setq term-toggle-pre-shell-win-conf (current-window-configuration))
  (let ((shell-buffer (get-buffer "*terminal*"))
	(cd-command
	 ;; Find out which directory we are in (the method differs for
	 ;; different buffers)
	 (or (and make-cd 
		  (buffer-file-name)
		  (file-name-directory (buffer-file-name))
		  (concat "cd " (file-name-directory (buffer-file-name))))
	     (and make-cd
		  list-buffers-directory
		  (concat "cd " list-buffers-directory)))))

    ;; Switch to an existin shell if one exists, otherwise switch to another
    ;; window and start a new shell
    (if shell-buffer
	(switch-to-buffer-other-window shell-buffer)
      (term-toggle-buffer-switch-to-other-window)
      ;; Sometimes an error is generated when I call `shell'
      ;; (it has to do with my shell-mode-hook which inserts text into the
      ;; newly created shell-buffer and thats not allways a good idea).
      (condition-case the-error
          (term (getenv "SHELL"))
	(error (switch-to-buffer "*terminal*"))))
    (if (or cd-command term-toggle-goto-eob)
        (term-send-del))
    (if (and cd-command term-toggle-automatic-cd)
          (term-send-raw-string (concat cd-command "\n"))
	  )))

(defun term-toggle-buffer-switch-to-other-window ()
  "Switches to other window.  If the current window is the only window in the
current frame, create a new window and switch to it.

\(This is less intrusive to the current window configuration then 
`switch-buffer-other-window')"
  (let ((this-window (selected-window)))
    (other-window 1)
    ;; If we did not switch window then we only have one window and need to
    ;; create a new one.
    (if (eq this-window (selected-window))
	(progn
	  (split-window-vertically)
          (other-window 1)))))

    
(provide 'term-toggle)

(global-set-key [M-f1] 'term-toggle)
(global-set-key [C-f1] 'term-toggle-cd)
