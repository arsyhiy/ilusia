(use-package vertico
  :ensure t
  :hook
  (after-init . vertico-mode)

  :custom
  (vertico-count 10)
  (vertico-resize nil)
  (vertico-cycle nil)
  (vertico-preselect 'directory))


(provide 'ilusia-module-vertico)
;;; ilusia-module-vertico.el ends here
