;; (global-set-key (kbd "<f11>") 'xah-previous-user-buffer)
;; (global-set-key (kbd "<f12>") 'xah-next-user-buffer)
;; (global-set-key (kbd "<S-f11>") 'xah-previous-emacs-buffer)
;; (global-set-key (kbd "<S-f12>") 'xah-next-emacs-buffer)


(bind-key "C-x o" 'ace-window)
(bind-key  "M-o" 'mode-line-other-buffer)
;; helm settings
;; (setq helm-split-window-in-side-p t)







;; delete windows
(defun delete-window-below ()
  "Delete window below"
  (interactive)
  (if (> (count-windows) 1 )  
      (delete-window (window-in-direction 'below))))

(defun delete-window-up ()
  "Delete window up"
  (interactive)
  (if (> (count-windows) 1 )  
      (delete-window (window-in-direction 'up))))

(defun delete-window-right ()
  "Delete window right"
  (interactive)
  (if (> (count-windows) 1 )  
      (delete-window (window-in-direction 'right))))

(defun delete-window-left ()
  "Delete window left"
  (interactive)
  (if (> (count-windows) 1 )  
      (delete-window (window-in-direction 'left))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            WINDMOVE                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-k") 'windmove-down)

(defun ansi-term-char-mode ()
  (if (string= (buffer-name) "*ansi-term*")
    (term-char-mode)))

(defadvice windmove-left (before windmove-left-ansi-term (&optional arg))
  (ansi-term-char-mode))

(defadvice windmove-right (before windmove-right-ansi-term (&optional arg))
  (ansi-term-char-mode))

(defadvice windmove-up (before windmove-up-ansi-term (&optional arg))
  (ansi-term-char-mode))

(defadvice windmove-down (before windmove-down-ansi-term (&optional arg))
  (ansi-term-char-mode))

(add-hook 'term-load-hook
  (lambda ()
    (define-key term-raw-map (kbd "M-j") 'windmove-left)
    (ad-activate 'windmove-left)
    (define-key term-raw-map (kbd "M-l") 'windmove-right)
    (ad-activate 'windmove-right)
    (define-key term-raw-map (kbd "M-i") 'windmove-up)
    (ad-activate 'windmove-up)
    (define-key term-raw-map (kbd "M-k") 'windmove-down)
    (ad-activate 'windmove-down)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  END WINDMOVE                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq winum-keymap
;;     (let ((map (make-sparse-keymap)))
;;       (define-key map (kbd "C-`") 'winum-select-window-by-number)
;;       (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
;;       (define-key map (kbd "M-1") 'winum-select-window-1)
;;       (define-key map (kbd "M-2") 'winum-select-window-2)
;;       (define-key map (kbd "M-3") 'winum-select-window-3)
;;       (define-key map (kbd "M-4") 'winum-select-window-4)
;;       (define-key map (kbd "M-5") 'winum-select-window-5)
;;       (define-key map (kbd "M-6") 'winum-select-window-6)
;;       (define-key map (kbd "M-7") 'winum-select-window-7)
;;       (define-key map (kbd "M-8") 'winum-select-window-8)
;;       map))

;; (require 'winum)

;; (winum-mode)


(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Zoom                                       ;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'zoom-frm)
(global-set-key (kbd "C-=") 'zoom-in)
(global-set-key (kbd "C--") 'zoom-out)
