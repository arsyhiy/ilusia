(use-package css-ts-mode
  :straight nil
  :ensure nil
  :mode "\\.css\\'"
  :hook
  (css-ts-mode . electric-pair-local-mode)
  (css-ts-mode . (lambda ()
                   (setq-local tab-width 2
                     css-indent-offset 2)))
  :config
  (add-to-list 'major-mode-remap-alist
    '(css-mode . css-ts-mode)))


(provide 'ilusia-module-css)
;;; ilusia-module-css.el ends here
