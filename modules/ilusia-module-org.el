(require 'org)

(add-hook 'org-mode-hook #'auto-fill-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (setq-local fill-column 80)))


(provide 'ilusia-module-org)
;;; ilusia-module-org.el ends here
