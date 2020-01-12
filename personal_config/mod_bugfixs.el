;; (custom-set-faces
;;  '(term-color-black ((t (:foreground "chartreuse"))))
;;  '(term-color-white ((t (:foreground "#b2b2b2"))))
;;  '(term-default-fg-color ((t (:inherit term-color-white))))
;;  '(term-default-bg-color ((t (:inherit term-color-black))))
;;  )

(add-hook 'term-mode-hook #'eterm-256color-mode)
