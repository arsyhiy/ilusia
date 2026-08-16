
(setq-default lisp-indent-offset 2)

(with-eval-after-load 'elisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c C-e") #'eval-last-sexp)
  (define-key emacs-lisp-mode-map (kbd "C-c C-r") #'eval-region)
  (define-key emacs-lisp-mode-map (kbd "C-c C-b") #'eval-buffer))



(provide 'ilusia-module-elisp-base)
;;; ilusia-module-elisp-base.el ends here
