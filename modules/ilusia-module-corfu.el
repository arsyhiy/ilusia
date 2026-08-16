(use-package corfu
  :straight t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 3)
  (corfu-quit-no-match nil)
  (corfu-scroll-margin 5)
  (corfu-max-width 50)
  (corfu-min-width 50)
  (corfu-popupinfo-delay 0.5)
  :config
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode t))



(provide 'ilusia-module-corfu)
;;; ilusia-module-corfu.el ends here
