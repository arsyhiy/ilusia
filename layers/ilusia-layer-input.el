
;; confirmation
(advice-add 'yes-or-no-p :override #'y-or-n-p)

;; advanced commands
(put 'narrow-to-region 'disabled nil)

;; modules
(ilusia-module 'evil)

(ilusia-module 'god-mode)



(provide 'ilusia-layer-input)
;;; ilusia-layer-input.el ends here
