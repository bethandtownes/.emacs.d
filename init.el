(setq yas-snippet-dirs '("~/Dropbox/localprojects/just-the-docs/snippets"))
(setq-default mac-option-modifier 'meta)
(setq ring-bell-function 'ignore)




(setq julia-repl-executable-records
      '((default "~/apps/julia/julia"))) ; compiled from the repository
;; (add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode

;; AucTeX settings
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook
(lambda ()
  (push
   '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
     :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(ansi-color-names-vector
   ["black" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "f9aede508e587fe21bcfc0a85e1ec7d27312d9587e686a6f5afdbb0d220eab50" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "88a3c267ce2132defd46f2a4761925983dcbc35b1c3cfff1dded164ce169fed4" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "1c8171893a9a0ce55cb7706766e57707787962e43330d7b0b6b0754ed5283cda" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (julia-repl julia-mode cmake-mode rainbow-mode auctex-latexmk alect-themes yaml-mode lua-mode lsp-java doom-themes company-lsp lsp-mode monokai-theme yasnippet use-package smex magit eterm-256color eglot counsel-projectile company ace-window)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "black")
 '(safe-local-variable-values
   (quote
    ((package-testrunner-path . "~/.julia/dev/MatrixCompletion/test/runtests.jl")
     (eval setq-local lsp-enable-on-type-formatting nil)
     (eval lsp-disconnect)
     (eval lsp-ui-mode -)
     (eval eglot-shutdown)
     (eval eglot -1))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "black" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))




(load-file "~/.emacs.d/personal_config/auto-save.el")
(load-file "~/.emacs.d/personal_config/mod_pkg.el")
(load-file "~/.emacs.d/personal_config/mod_edit.el")
(load-file "~/.emacs.d/personal_config/cpp.el")
(load-file "~/.emacs.d/personal_config/python.el")
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


(setq lsp-signature-auto-activate nil)

(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))




(setq confirm-kill-processes nil)

;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:inherit highlight :background "gray50")))))
