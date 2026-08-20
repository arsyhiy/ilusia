;; confirmation
(advice-add 'yes-or-no-p :override #'y-or-n-p)

;; advanced commands
(put 'narrow-to-region 'disabled nil)

;; modules
(ilusia-module 'evil)

(ilusia-module 'god-mode)

(use-package elec-pair
  :straight nil
  :custom
  (electric-pair-pairs
   '((?\( . ?\))
     (?\[ . ?\])
     (?\{ . ?\)))
  :config
  (electric-pair-mode 1)))


(provide 'ilusia-layer-input-editing)
;;; ilusia-layer-input-editing.el ends here
