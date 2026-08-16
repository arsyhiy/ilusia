(use-package vterm
  :straight t
  :commands vterm
  :bind
  ("C-c t" . vterm)

  :custom
  (vterm-max-scrollback 10000)
  ;; (vterm-shell "/bin/zsh");; TODO: make a functionalatty that memorise shell to use in future and maybe get to know what shell the system has
  (vterm-shell "/bin/bash");; because we can't know what shell user use, use that 100% people will have in linux

  :config
  ;; close buffer if the terminal process is killed
  (add-hook 'vterm-exit-functions
            (lambda (_buffer _event)
              (kill-buffer))))


(provide 'ilusia-module-vterm)
;;; ilusia-module-vterm.el ends here
