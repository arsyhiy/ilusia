(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode)
  :hook ((python-ts-mode . lsp-deferred)))


(provide 'ilusia-module-python)
;;; ilusia-module-python.el ends here
