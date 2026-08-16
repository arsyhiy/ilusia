(use-package highlight-indent-guides

  :straight t
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character))


(provide 'ilusia-module-highlight-indent-guides)
;;; ilusia-module-highlight-indent-guides.el ends here
