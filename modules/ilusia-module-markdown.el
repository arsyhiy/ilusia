(use-package markdown-mode
  :defer t
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))


(provide 'ilusia-module-markdown)
;;; ilusia-module-markdown.el ends here
