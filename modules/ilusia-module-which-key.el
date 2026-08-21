(use-package which-key
  :straight t
  :hook
  (after-init . which-key-mode)

  :config
  (setq which-key-idle-delay 0.5)

  (which-key-add-key-based-replacements
    "SPC d" "file"
    "SPC b" "buffer"
    "SPC c" "search"
    "SPC p" "project"
    "SPC g" "git"
    "SPC l" "language / lsp"
    "SPC f" "diagnostics"
    "SPC x" "execute"
    "SPC w" "window"))


(provide 'ilusia-module-which-key)
;;; ilusia-module-which-key.el ends here
