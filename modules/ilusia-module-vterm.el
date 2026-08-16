

(use-package vterm
  :straight t
  :commands vterm
  :bind
  ("C-c t" . vterm)

  :custom
  (vterm-max-scrollback 10000)
  (vterm-shell "/bin/zsh")

  :config
  ;; Закрывать буфер после завершения процесса
  (add-hook 'vterm-exit-functions
            (lambda (_buffer _event)
              (kill-buffer))))



(provide 'ilusia-module-vterm)
;;; ilusia-module-vterm.el ends here
