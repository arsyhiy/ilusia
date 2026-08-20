(use-package diff-hl
  :straight t
  :hook
  (find-file . (lambda ()
                 (global-diff-hl-mode)
                 (diff-hl-flydiff-mode)
                 (diff-hl-margin-mode)))
  :custom
  (diff-hl-side 'left)
  (diff-hl-margin-symbols-alist '((insert . "┃")
                                   (delete . "-")
                                   (change . "┃")
                                   (unknown . "┆")
                                   (ignored . "i"))))


(provide 'ilusia-module-diff-hl)
;;; ilusia-module-diff-hl.el ends here
