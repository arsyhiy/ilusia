(use-package cape
  :ensure t

  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (add-hook 'completion-at-point-functions #'cape-elisp-symbol)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  (add-hook 'completion-at-point-functions #'cape-abbrev)
  (add-hook 'completion-at-point-functions #'cape-dict)
  (add-hook 'completion-at-point-functions #'cape-history)

  :config
  (setq cape-dabbrev-min-length 3)
  (setq cape-dabbrev-ignore-case t)
  (setq cape-dabbrev-check-other-buffers t)
  (setq cape-dabbrev-buffer-lerit 20))


(provide 'ilusia-module-cape)
;;; ilusia-module-cape.el ends here
