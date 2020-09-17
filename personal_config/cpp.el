(load "/usr/share/emacs/site-lisp/clang-format-10/clang-format.el")
(bind-key "C-c e f" 'clang-format)


(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'company-mode)



;; (require 'eglot)
;; (setq eglot-ignored-server-capabilites '(:hoverProvider))
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)


(setq lsp-prefer-flymake :none)
(require 'lsp-mode)
(add-hook 'c++-mode-hook #'lsp)
(setq lsp-enable-on-type-formatting nil)
;; (setq lsp-clients-clangd-executable "/opt/local/bin/clangd-mp-10")


(require 'yasnippet)
(yas-reload-all)
(add-hook 'c++-mode-hook 'yas-minor-mode)
;; ;; (add-hook 'yas-minor-mode (lambda () (local-set-key (kbd "C-c i") 'yas-insert-snippet)))
;; (define-key 'c++-mode-map (kbd "C-c i") 'yas-insert-snippet)
(require 'bind-key)
(bind-key "C-c i" 'yas-insert-snippet)


;; (provide 'nocheck-mode)
