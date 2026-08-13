;; doom-modeline
(straight-use-package 'doom-modeline)

;; bar
;;(setq-default doom-modeline-bar-width 0.01)
  (setq-default doom-modeline-height 40)

;; mode line initialization hook
(add-hook 'after-init-hook #'doom-modeline-mode)

(provide 'ilusia-module-doom-modeline)
;;; ilusia-module-doom-modeline.el ends here
