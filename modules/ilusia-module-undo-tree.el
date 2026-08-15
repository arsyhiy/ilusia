
(use-package undo-tree
  :ensure t
  :demand t

  :hook
  (prog-mode . undo-tree-mode)

  :custom
  (undo-tree-auto-save-history t)
  (undo-tree-visualizer-timestamps t)
  (undo-tree-visualizer-diff t)
  (undo-tree-history-directory-alist
   `(("." . ,(expand-file-name "undo" user-emacs-directory))))

  (undo-limit 16000000)
  (undo-strong-limit 32000000)
  (undo-outer-limit 128000000)

  :config
  (global-undo-tree-mode 1))



(provide 'ilusia-module-undo-tree)
;;; ilusia-module-undo-tree.el ends here
