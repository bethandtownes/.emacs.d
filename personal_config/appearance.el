(require 'frame)
;; (setq default-frame-alist '((font . "Inconsolata Nerd Font Mono:weight=normal")))

;; (set-face-attribute 'default
;; 		    nil
;; 		    :font "Inconsolata-g"
;; 		    :height 160
;; 		    :bold t)


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
