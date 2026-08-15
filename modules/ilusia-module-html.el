(use-package html-ts-mode
  :ensure nil
  :mode ("\\.html?\\'" . html-ts-mode)

  :custom
  (sgml-basic-offset 2)

  :hook
  (html-ts-mode . (lambda ()
                    (setq-local tab-width 2)
                    (electric-pair-local-mode 1)
                    (display-line-numbers-mode 1))))



(provide 'ilusia-module-html)
;;; ilusia-module-html.el ends here
