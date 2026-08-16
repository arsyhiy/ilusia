(use-package smerge-mode
  :straight nil
  :defer t
  :bind (:map smerge-mode-map
          ("C-c ^ u" . smerge-keep-upper)
          ("C-c ^ l" . smerge-keep-lower)
          ("C-c ^ n" . smerge-next)
          ("C-c ^ p" . smerge-previous)))


(provide 'ilusia-module-smerge)
;;; ilusia-module-smerge.el ends here
