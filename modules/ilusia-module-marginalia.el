(use-package marginalia
  :straight t
  :hook (after-init . marginalia-mode)

  :custom
  (marginalia-align 'right)
  (marginalia-align-offset 8)
  (marginalia-max-relative-age 0))


(provide 'ilusia-module-marginalia)
;;; ilusia-module-marginalia.el ends here
