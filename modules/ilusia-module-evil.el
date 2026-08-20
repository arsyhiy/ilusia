(use-package evil
  :straight t
  :hook (after-init . evil-mode)

  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-u-delete t
        evil-leader/in-all-states t
        evil-want-fine-undo t)

  :config
  ;; States
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-undo-system 'undo-tree)

  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))



  ;;;; file navigation

  (evil-define-key 'normal 'global (kbd "<leader> d d") 'dired)
  (evil-define-key 'normal 'global (kbd "<leader> d f") 'find-file)


  ;;;; buffer

  (evil-define-key 'normal 'global (kbd "<leader> b n") 'switch-to-next-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b p") 'switch-to-prev-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b k") 'kill-current-buffer)


  ;;;; search

  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> c f") 'consult-find)
  (evil-define-key 'normal 'global (kbd "<leader> c g") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> c G") 'consult-git-grep)
  (evil-define-key 'normal 'global (kbd "<leader> c r") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader> c l") 'consult-line)
  (evil-define-key 'normal 'global (kbd "<leader> c i") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> c m") 'consult-flymake)
  (evil-define-key 'normal 'global (kbd "<leader> c p") 'consult-project-buffer)


  ;;;; project

  (evil-define-key 'normal 'global (kbd "<leader> p p") 'project-switch-project)
  (evil-define-key 'normal 'global (kbd "<leader> p f") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader> p g") 'project-find-regexp)
  (evil-define-key 'normal 'global (kbd "<leader> p d") 'project-dired)


  ;;;; version control

  (evil-define-key 'normal 'global (kbd "<leader> g s") 'magit-status)
  (evil-define-key 'normal 'global (kbd "<leader> g d") 'magit-diff-buffer-file)
  (evil-define-key 'normal 'global (kbd "<leader> g l") 'magit-log-current)
  (evil-define-key 'normal 'global (kbd "<leader> g b") 'vc-annotate)
  (evil-define-key 'normal 'global (kbd "<leader> g c") 'magit-commit)
  (evil-define-key 'normal 'global (kbd "<leader> g p") 'magit-push-current-to-pushremote)


  ;;;; language / lsp

  (evil-define-key 'normal 'global (kbd "<leader> l d") 'xref-find-definitions)
  (evil-define-key 'normal 'global (kbd "<leader> l r") 'xref-find-references)
  (evil-define-key 'normal 'global (kbd "<leader> l i") 'xref-find-apropos)
  (evil-define-key 'normal 'global (kbd "<leader> l h") 'lsp-describe-thing-at-point)
  (evil-define-key 'normal 'global (kbd "<leader> l a") 'lsp-execute-code-action)
  (evil-define-key 'normal 'global (kbd "<leader> l R") 'lsp-rename)


  ;;;; diagnostics

  (evil-define-key 'normal 'global (kbd "<leader> f n") 'flymake-goto-next-error)
  (evil-define-key 'normal 'global (kbd "<leader> f p") 'flymake-goto-prev-error)
  (evil-define-key 'normal 'global (kbd "<leader> f d") 'flymake-show-and-sensitize-buffer)


  ;;;; execute

  (evil-define-key 'normal 'global (kbd "<leader> x f") 'format-all-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> x t") 'projectile-test-project)
  (evil-define-key 'normal 'global (kbd "<leader> x r") 'compile)


  ;;;; window

  (evil-define-key 'normal 'global (kbd "<leader> w h") 'windmove-left)
  (evil-define-key 'normal 'global (kbd "<leader> w j") 'windmove-down)
  (evil-define-key 'normal 'global (kbd "<leader> w k") 'windmove-up)
  (evil-define-key 'normal 'global (kbd "<leader> w l") 'windmove-right)

  (evil-define-key 'normal 'global (kbd "<leader> w s") 'split-window-below)
  (evil-define-key 'normal 'global (kbd "<leader> w v") 'split-window-right)
  (evil-define-key 'normal 'global (kbd "<leader> w d") 'delete-window)

  (evil-define-key 'normal 'global (kbd "<leader> w <") 'shrink-window-horizontally)
  (evil-define-key 'normal 'global (kbd "<leader> w >") 'enlarge-window-horizontally)
  (evil-define-key 'normal 'global (kbd "<leader> w -") 'shrink-window)
  (evil-define-key 'normal 'global (kbd "<leader> w +") 'enlarge-window)
  (evil-define-key 'normal 'global (kbd "<leader> w =") 'balance-windows)
  (evil-define-key 'normal 'global (kbd "<leader> w u") 'winner-undo)

  (evil-define-key 'normal 'global (kbd ".") #'repeat)


  ;;;; editing

  (evil-define-key 'normal 'global (kbd "gcc")
    (lambda ()
      (interactive)
      (if (not (use-region-p))
          (comment-or-uncomment-region
           (line-beginning-position)
           (line-end-position)))))

  (evil-define-key 'visual 'global (kbd "gc")
    (lambda ()
      (interactive)
      (if (use-region-p)
          (comment-or-uncomment-region
           (region-beginning)
           (region-end)))))
  )

;; bindings
(global-set-key (kbd "C-<escape>") #'evil-mode)

(use-package evil-collection
  :straight t
  :custom
  (evil-collection-want-find-usages-bindings t)
  :hook
  (evil-mode . evil-collection-init))

(use-package evil-surround
  :straight t
  :after evil-collection
  :config
  (global-evil-surround-mode 1))

(use-package evil-matchit
  :straight t
  :after evil-collection
  :config
  (global-evil-matchit-mode 1))


(provide 'ilusia-module-evil)
;;; ilusia-module-evil.el ends here
