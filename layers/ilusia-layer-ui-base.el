;; size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width  . 70))

;; UI elements
(tab-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;; title
(setq-default frame-title-format '("%b"))


;; visible bell
(setq visible-bell t)

;; there can be your code

;; icons
(ilusia-module 'all-the-icons)

;; decorations
(ilusia-module 'hl-todo)
(ilusia-module 'highlight-indent-guides)
(ilusia-module 'highlight-rainbow-delimiters)

;; treesittter
(ilusia-module 'highlight-treesit-auto)

;; column numbers
(column-number-mode)

;; there can be your code

;; there can be your code


(provide 'ilusia-layer-ui-base)
;;; ilusia-layer-ui-base.el ends here
