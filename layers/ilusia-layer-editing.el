(use-package elec-pair
  :ensure nil
  :custom
  (electric-pair-pairs
   '((?\( . ?\))
     (?\[ . ?\])
     (?\{ . ?\)))
  :config
  (electric-pair-mode 1)))



(provide 'ilusia-layer-editing)
;;; ilusia-layer-editing.el ends here
