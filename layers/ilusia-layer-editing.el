(use-package elec-pair
  :straight nil
  :custom
  (electric-pair-pairs
   '((?\( . ?\))
     (?\[ . ?\])
     (?\{ . ?\)))
  :config
  (electric-pair-mode 1)))


(provide 'ilusia-layer-editing)
;;; ilusia-layer-editing.el ends here
