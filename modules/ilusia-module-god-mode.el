(use-package god-mode
  :straight t

  :config
  (global-set-key (kbd "<escape>") #'god-mode-all)

  (define-key god-local-mode-map (kbd "i") #'god-local-mode)
  (define-key god-local-mode-map (kbd ".") #'repeat)
  (define-key god-local-mode-map (kbd "]") #'forward-paragraph)
  (define-key god-local-mode-map (kbd "[") #'backward-paragraph))


(provide 'ilusia-module-god-mode)
;;; ilusia-module-god-mode.el ends here
