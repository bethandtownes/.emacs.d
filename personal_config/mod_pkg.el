(require 'package)

(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(setq package-list
      '(
	use-package
	projectile
	ace-window
	counsel-projectile
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
	yasnippet
	lsp-mode
	))



(setq load-prefer-newer t)
(package-initialize)




; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


























