(require 'frame)


;; (setq default-frame-alist '((font . "Inconsolata Nerd Font Mono:weight=normal")))

(setq default-frame-alist '((font . "Source Code Pro-14")))

;; (setq-default line-spacing 0.2)
;; (set-face-attribute 'default
;; 		    nil
;; 		    :font "Source Code Pro"
;; 		    :height 130
;; 		    :bold nil)


(setq-default display-line-numbers-width 1)
(global-display-line-numbers-mode)

(set-fringe-mode 0)

;; (setq-default cursor-type '(hbar . 3))


(defun set-cursor-hook (frame)
(modify-frame-parameters
  frame (list (cons 'cursor-color "White"))))

(add-hook 'after-make-frame-functions 'set-cursor-hook)
(blink-cursor-mode 0)



(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


(set-window-scroll-bars (minibuffer-window) 0 'none)
