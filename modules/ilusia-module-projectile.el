(use-package projectile
  :straight t
  )

(projectile-mode)

;; command map prefix
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)


(provide 'ilusia-module-projectile)
;;; ilusia-module-projectile.el ends here
