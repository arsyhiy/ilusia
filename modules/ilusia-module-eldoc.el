(use-package eldoc
  :straight t
  :config
  (setq eldoc-idle-delay 0.2)
  (setq eldoc-echo-area-use-multiline-p nil)
  
  (setq eldoc-echo-area-display-truncation-message nil)
  :init
  (global-eldoc-mode))


(use-package eldoc-box
  :straight t
  :hook (eldoc-mode . eldoc-box-hover-mode))


(provide 'ilusia-module-eldoc)
;;; ilusia-module-eldoc.el ends here
