(use-package org
  :straight nil
  :mode ("\\.org\\'" . org-mode)
  :hook 
  (org-mode . auto-fill-mode)
  :custom
  (fill-column 80)
  (org-startup-folded 'overview))


(provide 'ilusia-module-org-base)
;;; ilusia-module-org-base.el ends here
