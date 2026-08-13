;; icons
; (ilusia-module 'all-the-icons)

;; highlights
;(ilusia-module 'rainbow-mode)

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

;; time
;; (display-time-mode t)

;; column numbers
(column-number-mode)

;; mode display
;; (ilusia-module 'delight)

;; extensions
;;(ilusia-extend 'ui)

(provide 'ilusia-layer-ui)
;;; ilusia-layer-ui.el ends here
