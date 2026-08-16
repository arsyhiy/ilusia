(use-package c-ts-mode
  :straight nil
  :mode
  ("\\.c\\'"   . c-ts-mode)
  ("\\.h\\'"   . c-or-c++-ts-mode)
  ("\\.cpp\\'" . c++-ts-mode)
  ("\\.hpp\\'" . c++-ts-mode))


(provide 'ilusia-module-cc-base)
;;; ilusia-module-cc-base.el ends here
