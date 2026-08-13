(defun ilusia-load-component (type component)
  "Load Ilusia COMPONENT of TYPE."
  (require
   (intern
    (format "ilusia-%s-%s"
            type
            (symbol-name component)))))

(defun ilusia-module (module)
  "Load an Ilusia MODULE by name."
  (ilusia-load-component "module" module))

(defun ilusia-layer (layer)
  "Load an Ilusia LAYER by name."
  (ilusia-load-component "layer" layer))

(defun ilusia-extend (extension)
  "Load an Ilusia EXTENSION by name."
  (ilusia-load-component "extension" extension))

(straight-use-package 'async)
(require 'async)

(defun ilusia/tangle-add-provide ()
  "Add `provide' forms to generated Ilusia components."
  (dolist (type '("core" "layers" "modules" "extensions"))
    (let ((directory
           (expand-file-name type ilusia-directory)))
      (when (file-directory-p directory)
        (dolist (file
                 (directory-files
                  directory
                  t
                  "\\`ilusia-.*\\.el\\'"))
          (with-temp-buffer
            (insert-file-contents file)

            (goto-char (point-max))
            (insert
             "\n"
             (format "(provide '%s)\n"
                     (intern
                      (file-name-sans-extension
                       (file-name-nondirectory file))))
             (format ";;; %s ends here\n"
                     (file-name-nondirectory file)))

            (write-region nil nil file nil 'silent)))))))

(defun ilusia/tangle (&optional quiet)
  "Tangle Ilusia components and user config."
  (interactive)

  (let ((ilusia-org
         (expand-file-name "ilusia.org"
                           ilusia-directory))
        (config-org
         (expand-file-name "config.org"
                           user-emacs-directory))
        (start-time (current-time)))

    ;; Remove generated Ilusia components.
    (dolist (dir '("core" "layers" "modules" "extensions"))
      (let ((directory
             (expand-file-name dir ilusia-directory)))
        (when (file-directory-p directory)
          (dolist (file
                   (directory-files
                    directory
                    t
                    directory-files-no-dot-files-regexp))
            (when (file-regular-p file)
              (delete-file file))))))

    ;; Tangle Ilusia.
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle-file ilusia-org)

      ;; Add `provide' to generated Ilusia components.
      (ilusia/tangle-add-provide)

      ;; Tangle user config.
      (org-babel-tangle-file config-org))

    (unless quiet
      (message
       "|ilusia| Tangled successfully in %.2fs."
       (float-time
        (time-subtract
         (current-time)
         start-time))))))

(defun ilusia/tangle-auto ()
  "Automatically tangle configuration after saving."
  (when buffer-file-name
    (let ((file (file-truename buffer-file-name))
          (ilusia-org
           (file-truename
            (expand-file-name "ilusia.org"
                              ilusia-directory)))
          (config-org
           (file-truename
            (expand-file-name "config.org"
                              user-emacs-directory))))

      (when (or (string-equal file ilusia-org)
                (string-equal file config-org))
        (message "|ilusia| Auto-tangle triggered.")
        (ilusia/tangle)))))

(add-hook 'after-save-hook #'ilusia/tangle-auto)

(straight-use-package 'no-littering)
(require 'no-littering)

(provide 'ilusia-core-config-management)
;;; ilusia-core-config-management.el ends here
