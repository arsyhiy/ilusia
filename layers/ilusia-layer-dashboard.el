;;; ilusia-dashboard.el --- Dashboard layer -*- lexical-binding: t; -*-

;;; Commentary:
;; Configuration for Emacs Dashboard.

;;; Code:

(ilusia-module 'emacs-dashboard)

(setq dashboard-center-content t)
(setq dashboard-set-file-icons t)

(setq dashboard-items
      '((recents  . 5)
        (projects . 5)
        (bookmarks . 5)
        (registers . 5)
        (agenda    . 5)))

(setq dashboard-banner-logo-title "⚓ Welcome on Board! ⚓")

(provide 'ilusia-layer-dashboard)
;;; ilusia-layer-dashboard.el ends here
