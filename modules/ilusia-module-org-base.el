(use-package org
  :straight nil

  :mode ("\\.org\\'" . org-mode)
  :bind
   (("\C-ca" . org-agenda))
  :custom
  (org-startup-folded 'overview))


(provide 'ilusia-module-org-base)
;;; ilusia-module-org-base.el ends here
