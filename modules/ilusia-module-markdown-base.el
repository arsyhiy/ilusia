(use-package markdown-mode
  :straight nil
  :mode ("README\\.md\\'" . gfm-mode);; github flavored markdown
  :hook 
  (markdown-mode . auto-fill-mode)
  :custom
  (fill-column 80)
  :init (setq markdown-command "multimarkdown"))


(provide 'ilusia-module-markdown-base)
;;; ilusia-module-markdown-base.el ends here
