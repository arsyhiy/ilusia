(defun my-js-mode-setup ()
  "Setq-local vars for 'js-mode'."
  (setq-local js-indent-level 2
    tab-width 2
    treesit-font-lock-level 4))

(use-package js
  :mode "\\.js\\'"
  :hook
  ((js-ts-mode . my-js-mode-setup)
    (js-ts-mode . electric-pair-local-mode))
  )


(provide 'ilusia-module-js)
;;; ilusia-module-js.el ends here
