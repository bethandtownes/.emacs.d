 (setq python-shell-interpreter "~/pyenv/main/bin/python3")


(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp)
