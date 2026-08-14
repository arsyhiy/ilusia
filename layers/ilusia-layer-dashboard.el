(ilusia-module 'emacs-dashboard)

(setq dashboard-center-content t)
(setq dashboard-set-file-icons t)

(setq dashboard-items
      '((recents  . 5)
        (projects . 5)
        (bookmarks . 5)
        (registers . 5)
        (agenda    . 5)))


(provide 'ilusia-layer-dashboard)
;;; ilusia-layer-dashboard.el ends here
