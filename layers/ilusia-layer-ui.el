;; icons
(ilusia-module 'all-the-icons)

(ilusia-module 'hl-todo)
(ilusia-module 'highlight-indent-guides)
(ilusia-module 'highlight-rainbow-delimiters)

;;TODO: найти и добавить что что влияет на буффер внешене

;; ;; centering
;; (mirage-module 'olivetti)

;; ;; line numbers
;; (global-set-key (kbd "C-c l") #'display-line-numbers-mode)

(ilusia-module 'highlight-treesit-auto)

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

;; TODO: понять что я реально считаю нужным добавить союда 
;; ;; fringes
;; (set-fringe-mode nil)

;; ;; balance
;; (global-set-key (kbd "C-x -") #'balance-windows)

;; ;; split threshold
;; (setq split-width-threshold 70)

;; visible bell
(setq visible-bell t)

;;TODO: решить что мне нужно из mode для mode line

;; time
;; (display-time-mode t)

;; column numbers
(column-number-mode)

;; mode display
;; (ilusia-module 'delight)

;; TODO:  написать хотябы один extension для ui
;; extensions
;;(ilusia-extend 'ui)


(provide 'ilusia-layer-ui)
;;; ilusia-layer-ui.el ends here
