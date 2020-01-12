;;(add-to-list 'load-path )



;; (add-to-list 'load-path "/home/jasonsun0310/.emacs.d/elpa/julia-mode-20190813.1326")
;; (add-to-list 'load-path "/home/jasonsun0310/.emacs.d/elpa/julia-repl-20190420.1455")



(require 'julia-mode)
(require 'julia-repl)

(add-hook 'julia-mode-hook (lambda () (progn
					 (ac-config-default)
					 (setq ess-use-auto-complete t)
					 (company-mode -1)
					 (auto-complete-mode 1)
					 (julia-repl-mode 1))))




(setq julia-repl-executable-records
      '((default "julia")))
