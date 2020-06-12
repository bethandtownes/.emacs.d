(defun current-file-name (&optional full-path)
  "return the file name of the current buffer"
  (interactive)
  (let ((buffer (if (minibufferp)
		    (window-buffer (minibuffer-selected-window))
		  (current-buffer))))
    (buffer-file-name buffer)))



(defun leetcode-repl ()
  "My personal term command."
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (progn
	(make-term "leetcode-repl" "/bin/zsh")
	(with-current-buffer "*leetcode-repl*"
	  (term-mode)
	  (term-char-mode))
	)
    (message "leetcode-repl already exists!")
    ))


(defun leetcode-compile-and-run ()
  "run the code"
  (interactive)
  (if (get-buffer "*leetcode-repl*")
      (let ((filename (current-file-name)))
	(with-current-buffer "*leetcode-repl*"
	  (term-send-raw-string (concat "runcpp" " " filename "\n"))))))

(defun leetcode-show ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  (if (get-buffer "*leetcode-repl*")
      (let ((filename (current-file-name)))
	(setq curname (buffer-name (current-buffer)))
	;; (message curname)
	(setq cur (selected-window))
	(delete-window-below)
	(display-buffer
	 "*leetcode-repl*"
	 '((display-buffer-below-selected)))
	(setq w (get-buffer-window "*leetcode-repl*"))
	(select-window w)
	(setq h (window-height w))
	(shrink-window (- h 28))
	(with-current-buffer "*leetcode-repl*"
	  (leetcode-mode 1))
	(if (equal "test.in" curname)
	    (message "no jumping")
	  (select-window cur)
	  )
	)
    )
  )

(defun leetcode-test-input ()
  "run the code"
  (interactive)
  (if (not (get-buffer "test.in"))
      (find-file-noselect "~/leetcode-practice/test.in"))
  (setq cur (selected-window))
  (delete-window-below)
  (display-buffer
   "test.in"
   '((display-buffer-below-selected)))
  (setq w (get-buffer-window "test.in"))
  (select-window w)
  (setq h (window-height w))
  (shrink-window (- h 28))
  (with-current-buffer "test.in"
    (leetcode-mode 1))
  )


(defun leetcode-toggle-test ()
  "Toggle leetcode"
  (interactive)
  (if (not (get-buffer-window "test.in"))
      (leetcode-test-input)
    (delete-windows-on "test.in")
    ))


(defun leetcode-toggle ()
  "Toggle leetcode"
  (interactive)
  (if (not (get-buffer-window "*leetcode-repl*"))
      (leetcode-show)
    (delete-windows-on "*leetcode-repl*")
    ))


;; (require 'bind-key)
;; (bind-key "C-c i" 'yas-insert-snippet)

;; (add-hook 'c++-mode-hook
;; 	  (lambda ()
;; 	    (global-unset-key (kbd "C-c C-l"))
;; 	    ))

;; (global-unset-key (kbd "C-c C-l"))

(defun filename-other-window()
  (interactive)
  (setq cur (selected-window))
  (let ((filename (buffer-file-name (window-buffer (other-window 1)))))
    (progn
      (select-window cur)
      (message filename)
      filename
      ))
  )


(defun buff-name-other-window()
  (interactive)
  (setq cur (selected-window))
  (let ((buffname  (buffer-name (window-buffer (other-window 1)))))
    (progn
      (select-window cur)
      (message buffname)
      buffname
      ))
  )

(defun leetcode-submit-other-file()
  "doc"
  (let ((filename (filename-other-window))
	(buffname (buff-name-other-window)))
    (with-current-buffer buffname
      (save-buffer))
    (message "other buffer saved")
    (sleep-for 0.3)
    (with-current-buffer "*leetcode-repl*"
      (term-send-raw-string (concat "submit" " " filename "\n")))
    )
  )

(defun leetcode-test-other-file()
  "doc"
  (let ((filename (filename-other-window))
	(buffname (buff-name-other-window)))
    (with-current-buffer buffname
      (save-buffer))
    (message "other buffer saved")
    (sleep-for 0.3)
    (with-current-buffer "*leetcode-repl*"
      (term-send-raw-string (concat "lctestcustom" " " filename "\n")))
    )
  )


(defun leetcode-test-current-file ()
  (let ((filename (current-file-name)))
    (save-buffer)
    (message "buffer saved")
    (sleep-for 0.3)
    (with-current-buffer "*leetcode-repl*"
      (term-send-raw-string (concat "lctestcustom" " " filename "\n")))
    ))


(defun leetcode-submit-current-file ()
  (message (expand-file-name (current-file-name)))
  (let ((filename (current-file-name)))
    (save-buffer)
    (message "buffer saved")
    (sleep-for 0.3)
    (with-current-buffer "*leetcode-repl*"
      (term-send-raw-string (concat "submit" " " filename "\n")))
    ))


(defun valid-file-name ()
  "doc"
  (interactive)
  (if (string-match-p (regexp-quote ".cpp") (buffer-name))
      t
    nil))

(defun leetcode-submit-code-silent ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  ;; (if (get-buffer "*leetcode-repl*")
  (if (valid-file-name)
      (leetcode-submit-current-file)
    (leetcode-submit-other-file)
      ;; (let ((filename (current-file-name)))
      ;; 	(save-buffer)
      ;; 	(message "buffer saved")
      ;; 	(sleep-for 0.3)
      ;; 	(with-current-buffer "*leetcode-repl*"
      ;; 	  (term-send-raw-string (concat "submit" " " filename "\n")))
      ;; 	)
    )
  )

(defun leetcode-test-custom-silent ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  ;; (if (get-buffer "*leetcode-repl*")
  (if (valid-file-name)
      (leetcode-test-current-file)
    (leetcode-test-other-file)
      ;; (let ((filename (current-file-name)))
      ;; 	(save-buffer)
      ;; 	(message "buffer saved")
      ;; 	(sleep-for 0.3)
      ;; 	(with-current-buffer "*leetcode-repl*"
      ;; 	  (term-send-raw-string (concat "submit" " " filename "\n")))
      ;; 	)
    )
  )


;; (defun leetcode-test-custom-silent ()
;;   "run the code"
;;   (interactive)
;;   (if (not (get-buffer "*leetcode-repl*"))
;;       (leetcode-repl))
;;   (if (get-buffer "*leetcode-repl*")
;;       (let ((filename (current-file-name)))
;; 	(save-buffer)
;; 	(message "buffer saved")
;; 	(sleep-for 0.3)
;; 	(with-current-buffer "*leetcode-repl*"
;; 	  (term-send-raw-string (concat "lctestcustom" " " filename "\n")))
;; 	)
;;     )
;;   )


(defun leetcode-submit-code ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  (if (get-buffer "*leetcode-repl*")
      (let ((filename (current-file-name)))
	(save-buffer)
	(message "buffer saved")
	(sleep-for 0.3)
	(setq cur (selected-window))
	(delete-window-below)
	(display-buffer
	 "*leetcode-repl*"
	 '((display-buffer-below-selected)))
	(setq w (get-buffer-window "*leetcode-repl*"))
	(select-window w)
	(setq h (window-height w))
	(shrink-window (- h 10))
	(select-window cur)
	(with-current-buffer "*leetcode-repl*"
	  (term-send-raw-string (concat "submit" " " filename "\n")))
	)
    )
  )

(defun leetcode-test-code ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  (if (get-buffer "*leetcode-repl*")
      (let ((filename (current-file-name)))
	(save-buffer)
	(message "buffer saved")
	(sleep-for 0.3)
	(setq cur (selected-window))
	(delete-window-below)
	(display-buffer
	 "*leetcode-repl*"
	 '((display-buffer-below-selected)))
	(setq w (get-buffer-window "*leetcode-repl*"))
	(select-window w)
	(setq h (window-height w))
	(shrink-window (- h 10))
	(select-window cur)
	(with-current-buffer "*leetcode-repl*"
	  (term-send-raw-string (concat "lctest" " " filename "\n")))
	)
    )
  )



(defun leetcode-test-custom ()
  "run the code"
  (interactive)
  (if (not (get-buffer "*leetcode-repl*"))
      (leetcode-repl))
  (if (get-buffer "*leetcode-repl*")
      (let ((filename (current-file-name)))
	(save-buffer)
	(message "buffer saved")
	(sleep-for 0.3)
	(setq cur (selected-window))
	(delete-window-below)
	(display-buffer
	 "*leetcode-repl*"
	 '((display-buffer-below-selected)))
	(setq w (get-buffer-window "*leetcode-repl*"))
	(select-window w)
	(setq h (window-height w))
	(shrink-window (- h 10))
	(select-window cur)
	(with-current-buffer "*leetcode-repl*"
	  (term-send-raw-string (concat "lctestcustom" " " filename "\n")))
	)
    )
  )


(defun leetcode-new-submit ()
  "Submit the code"
  (interactive)
  (setq cur (selected-window))
  (setq w (get-buffer-window "*leetcode-repl*"))
  (select-window w)
  (setq h (window-height w))
  (shrink-window (- h 12))
  (select-window cur))
  

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)


(defun my-compilation-hook ()
  (delete-window-below)
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 10)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)


(defun quick-compile()
  "quick"
  (interactive)
  (compile (concat "g++ -std=c++17 -ldw -g " (buffer-name) " backward.cpp -o main.o && ./main.o")))




(define-minor-mode nocheck-mode
  "Get your foos in the right places."
  :lighter " NoCheck"
  (flycheck-mode 0)
  (flymake-mode 0)
  (company-mode 0)
  )

(define-minor-mode leetcode-mode
  "Get your foos in the right places."
  :lighter " leetcode"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c k") 'leetcode-toggle-test)
	    (define-key map (kbd "C-c C-k") 'leetcode-toggle-test)
	    (define-key map (kbd "C-c l") 'leetcode-toggle)
	    (define-key map (kbd "C-c C-l") 'leetcode-toggle)
	    (define-key map (kbd "M-RET") 'leetcode-test-custom-silent)
	    (define-key map (kbd "C-c <C-return>") 'leetcode-submit-code-silent)
            map)
  (flymake-mode -1)
  (company-mode -1)
  )

;; (add-hook 'c++-mode-hook 'leetcode-mode)

(provide 'leetcode-mode)
