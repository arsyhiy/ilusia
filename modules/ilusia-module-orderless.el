(use-package orderless
  :ensure t

  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion))
          (command (styles orderless))
          (symbol (styles orderless))
          (variable (styles orderless))))

  (setq completion-flex-nospace t))


(provide 'ilusia-module-orderless)
;;; ilusia-module-orderless.el ends here
