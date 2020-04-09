;; (require 'use-package)


;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install)
;;   (setq-default pdf-view-display-size 'fit-page)
;;   (setq pdf-annot-activate-created-annotations t)
;;   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;;   (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward)
;;   (add-hook 'pdf-view-mode-hook (lambda ()
;; 				  (bms/pdf-midnite-amber))) ; automatically turns on midnight-mode for pdfs
;;   )



;; (defun hack ()
;;   (save-buffer)
;;   )

;; (use-package auctex-latexmk
;;   :ensure t
;;   :config
;;   (auctex-latexmk-setup)
;;   (setq auctex-latexmk-inherit-TeX-PDF-mode t))

;; (use-package reftex
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq reftex-cite-prompt-optional-args t)) ;; Prompt for empty optional arguments in cite

;; (use-package auto-dictionary
;;   :ensure t
;;   :init(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))

;; (use-package company-auctex
;;   :ensure t
;;   :init (company-auctex-init))


;; (use-package tex
;;   :ensure auctex
;;   :mode ("\\.tex\\'" . latex-mode)
;;   ;; :init (bind-key "C-c C-g" 'hack)
;;   :config (progn
;; 	    (setq TeX-source-correlate-mode t)
;; 	    (setq TeX-source-correlate-method 'synctex)
;; 	    (setq TeX-auto-save t)
;; 	    (setq TeX-parse-self t)
;; 	    ;; (setq-default TeX-master "paper.tex")
;; 	    (setq reftex-plug-into-AUCTeX t)
;; 	    (pdf-tools-install)
;; 	    (setq TeX-view-program-selection '((output-pdf "Zathura"))
;; 		  TeX-source-correlate-start-server t)
;; 	    ;; Update PDF buffers after successful LaTeX runs
;; 	    (add-hook 'TeX-after-compilation-finished-functions
;; 		      #'TeX-revert-document-buffer)
;; 	    (add-hook 'LaTeX-mode-hook
;; 		      (lambda ()
;; 			(reftex-mode t)
;; 			(flyspell-mode t)
;; 			))
;; 	    (jason-latex-minor-mode 1)
;; 	    ;; (add-hook 'LateX-mode-hook 'jason-latex-minor-mode)
;; 	    ))





;; (defun quick-compile-latex ()
;;   (interactive)
;;   (save-buffer)
;;   (TeX-command-run-all)
;;   )
  

;; (define-minor-mode jason-latex-minor-mode
;;   "Get your foos in the right places."
;;   :lighter " leetcode"
;;   :keymap (let ((map (make-sparse-keymap)))
;;             (define-key map (kbd "C-c C-g") 'quick-compile-latex)
;;             map)
;;   )



;; (setq TeX-source-correlate-mode t)
;; (setq TeX-source-correlate-method 'synctex)
;; (setq TeX-save-query nil)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; ;; (setq-default TeX-master "paper.tex")
;; (setq reftex-plug-into-AUCTeX t)
;; (pdf-tools-install)
;; (setq TeX-view-program-selection '((output-pdf "Zathura"))
;;       TeX-source-correlate-start-server t)
;; ;; Update PDF buffers after successful LaTeX runs
;; (add-hook 'TeX-after-compilation-finished-functions
;; 	  #'TeX-revert-document-buffer)
;; (add-hook 'LaTeX-mode-hook
;; 	  (lambda ()
;; 	    (reftex-mode t)
;; 	    (flyspell-mode t)
;; 	    ))



;; (defun LaTeX-indent-item ()
;;   "Provide proper indentation for LaTeX \"itemize\",\"enumerate\", and
;; \"description\" environments.

;;   \"\\item\" is indented `LaTeX-indent-level' spaces relative to
;;   the the beginning of the environment.

;;   Continuation lines are indented either twice
;;   `LaTeX-indent-level', or `LaTeX-indent-level-item-continuation'
;;   if the latter is bound."
;;   (save-match-data
;;     (let* ((offset LaTeX-indent-level)
;;            (contin (or (and (boundp 'LaTeX-indent-level-item-continuation)
;;                             LaTeX-indent-level-item-continuation)
;;                        (* 2 LaTeX-indent-level)))
;;            (re-beg "\\\\begin{")
;;            (re-end "\\\\end{")
;;            (re-env "\\(itemize\\|\\enumerate\\|description\\)")
;;            (indent (save-excursion
;;                      (when (looking-at (concat re-beg re-env "}"))
;;                        (end-of-line))
;;                      (LaTeX-find-matching-begin)
;;                      (current-column))))
;;       (cond ((looking-at (concat re-beg re-env "}"))
;;              (or (save-excursion
;;                    (beginning-of-line)
;;                    (ignore-errors
;;                      (LaTeX-find-matching-begin)
;;                      (+ (current-column)
;;                         (if (looking-at (concat re-beg re-env "}"))
;;                             contin
;;                           offset))))
;;                  indent))
;;              ((looking-at (concat re-end re-env "}"))
;;               indent)
;;             ((looking-at "\\\\item")
;;              (+ offset indent))
;;             (t
;;              (+ contin indent))))))

;; (defcustom LaTeX-indent-level-item-continuation 8
;;   "*Indentation of continuation lines for items in itemize-like
;; environments."
;;   :group 'LaTeX-indentation
;;   :type 'integer)

;; (eval-after-load "latex"
;;   '(setq LaTeX-indent-environment-list
;;          (nconc '(("itemize" LaTeX-indent-item)
;;                   ("enumerate" LaTeX-indent-item)
;;                   ("description" LaTeX-indent-item))
;;                 LaTeX-indent-environment-list)))





;; (setq preview-auto-cache-preamble t)
;; (setq preview-scale-function 2.5)
