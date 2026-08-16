(use-package emacs-lisp-mode
  :straight nil
  :custom
  (lisp-indent-offset 2)

  :bind
  (:map emacs-lisp-mode-map
        ("C-c C-e" . eval-last-sexp)
        ("C-c C-r" . eval-region)
        ("C-c C-b" . eval-buffer)))


(provide 'ilusia-module-elisp-base)
;;; ilusia-module-elisp-base.el ends here
