(use-package markdown-mode
  :straight nil
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))



(provide 'ilusia-module-markdown)
;;; ilusia-module-markdown.el ends here
