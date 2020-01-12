

;;; package --- Summary


(setq yas-snippet-dirs '("~/leetcode-practice/snippets"))






(setq ;; foreground and background
      ;; monokai-foreground     "#ABB2BF"
      monokai-background     "black"
      )


(load-file "~/.emacs.d/personal_config/auto-save.el")
(load-file "~/.emacs.d/personal_config/mod_pkg.el")
(load-file "~/.emacs.d/personal_config/mod_edit.el")
(load-file "~/.emacs.d/personal_config/cpp.el")
(load-file "~/.emacs.d/personal_config/leetcode.el")
(load-file "~/.emacs.d/personal_config/appearance.el")
(load-file "~/.emacs.d/personal_config/mod_theme.el")
(load-file "~/.emacs.d/personal_config/frame-fns.el")
(load-file "~/.emacs.d/personal_config/frame-cmds.el")
(load-file "~/.emacs.d/personal_config/zoom-frm.el")
(load-file "~/.emacs.d/personal_config/mod_wm.el")
(load-file "~/.emacs.d/personal_config/mod_term.el")
(load-file "~/.emacs.d/personal_config/mod_file.el")
(load-file "~/.emacs.d/personal_config/google-c-style.el")



(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))




(setq confirm-kill-processes nil)

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-lsp lsp-ui lsp-mode monokai-theme yasnippet use-package smex magit eterm-256color eglot counsel-projectile company ace-window)))
 '(safe-local-variable-values
   (quote
    ((eval lsp-ui-mode -)
     (eval eglot-shutdown)
     (eval eglot -1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
