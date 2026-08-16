(use-package typescript-mode

  :straight nil
  :init
  (add-to-list 'major-mode-remap-alist
    '(typescript-mode . typescript-ts-mode))
  (add-to-list 'major-mode-remap-alist
    '(js-mode . js-ts-mode)))



(provide 'ilusia-module-typescript)
;;; ilusia-module-typescript.el ends here
