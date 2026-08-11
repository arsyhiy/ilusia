;; utilities

;; magit

(mirage-layer 'version-control)

;; size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width  . 70))

;; tabs
(tab-bar-mode -1)
;; scroll bar
(scroll-bar-mode -1)
;; toolbar
(tool-bar-mode -1)
;; tooltips
(tooltip-mode -1)
;; menu bar
(menu-bar-mode -1)

;; title
(setq-default frame-title-format '("%b"))

(provide 'mirage-core-base-config)
;;; mirage-base-config.el ends here
