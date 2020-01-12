(require 'package)

(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))



;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)

;; (add-to-list 'package-archives
;; 	     '("gnu" . "http://mirrors.163.com/elpa/gnu/") t)
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/")e


					; list the packages you want

(setq package-list
      '(
	use-package
	projectile
	ace-window
	counsel-projectile
	eglot
	smex
	magit
	ivy
	swiper
	ace-window
	counsel
	yasnippet
	org
	company
	monokai-theme
	eterm-256color
	))

;; (setq package-list
;;       '(
	;; use-package
;; 	counsel-projectile
;; 	graphql
;; 	request-deferred
;; 	spinner
;; 	winum
;; 	smex
;; 	auto-complete
;; 	flyspell
;; 	flymake
;; 	flycheck
;; 	neotree
;; 	ivy
;; 	swiper
;; 	counsel
;; 	magit
;; 	yasnippet
;; 	org
;; 	monokai-theme
;; 	company
;; 	js2-mode
;; 	projectile
;; 	spaceline
;; 	doom-modeline
;; 	julia-mode
;; 	julia-repl
;; 	ace-window
;; 	all-the-icons
;; 	spaceline-all-the-icons
;; 	smart-mode-line
;; 	auto-compile
;; 	auctex
;; 	zotelo
;; 	reftex
;; 	cdlatex
;; 	company-auctex
;; 	auto-dictionary
;; 	auctex-latexmk
;; 	solarized-theme
;; 	tuareg
;; 	eterm-256color
;; 	modern-cpp-font-lock
;; 	))


;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)


			   

; activate all the packages


(setq load-prefer-newer t)
(package-initialize)


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

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


























