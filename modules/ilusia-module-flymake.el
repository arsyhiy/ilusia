(use-package flymake
  :ensure nil
  :hook
  (prog-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-show-diagnostics-at-end-of-line t)
  (flymake-margin-indicators-string
   '((error   "✘" flymake-error)
     (warning "▲" flymake-warning)
     (note    "●" flymake-note))))


(provide 'ilusia-module-flymake)
;;; ilusia-module-flymake.el ends here
