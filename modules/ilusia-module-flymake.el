;;TODO: design how diagnostic all alike thing work 
(use-package flymake
  :straight nil

  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-show-diagnostics-at-end-of-line nil)
  (flymake-margin-indicators-string
   '((error   "✘" flymake-error)
     (warning "▲" flymake-warning)
     (note    "●" flymake-note))))


(provide 'ilusia-module-flymake)
;;; ilusia-module-flymake.el ends here
