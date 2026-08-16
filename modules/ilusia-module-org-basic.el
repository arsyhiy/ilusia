
(use-package org
  :straight nil

  :mode ("\\.org\\'" . org-mode)
  :bind
   (("\C-ca" . org-agenda))
  :custom
  (org-startup-folded 'overview))



(provide 'ilusia-module-org-basic)
;;; ilusia-module-org-basic.el ends here
