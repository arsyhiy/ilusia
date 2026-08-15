
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



(defconst ilusia--config-files
  '("ilusia.org" "config.org")
  "Org files used as Ilusia configuration sources.")

(defconst ilusia--component-directories
  '("core" "layers" "modules" "extensions")
  "Directories containing generated Ilusia components.")

(defun ilusia--config-file (file)
  "Return the absolute path to FILE."
  (if (string= file "ilusia.org")
      (expand-file-name file ilusia-directory)
    (expand-file-name file user-emacs-directory)))



(defun ilusia--clean-generated ()
  "Remove generated Ilusia component files."
  (dolist (directory ilusia--component-directories)
    (let ((directory
           (expand-file-name directory ilusia-directory)))
      (when (file-directory-p directory)
        (dolist (file
                 (directory-files
                  directory
                  t
                  "\\`ilusia-.*\\.el\\'"))
          (when (file-regular-p file)
            (delete-file file)))))))



(defun ilusia--add-provide (file)
  "Add a `provide' form to generated FILE."
  (with-temp-buffer
    (insert-file-contents file)
    (goto-char (point-max))

    (insert
     "\n\n"
     (format
      "(provide '%s)\n"
      (intern
       (file-name-sans-extension
        (file-name-nondirectory file))))
     (format
      ";;; %s ends here\n"
      (file-name-nondirectory file)))

    (write-region nil nil file nil 'silent)))

(defun ilusia--add-provides ()
  "Add `provide' forms to all generated Ilusia components."
  (dolist (directory ilusia--component-directories)
    (let ((directory
           (expand-file-name directory ilusia-directory)))
      (when (file-directory-p directory)
        (dolist (file
                 (directory-files
                  directory
                  t
                  "\\`ilusia-.*\\.el\\'"))
          (when (file-regular-p file)
            (ilusia--add-provide file)))))))



(defun ilusia--tangle ()
  "Tangle Ilusia and user configuration."
  (let ((org-confirm-babel-evaluate nil))
    (dolist (file ilusia--config-files)
      (let ((file (ilusia--config-file file)))
        (when (file-exists-p file)
          (org-babel-tangle-file file))))))



(defun ilusia-sync (&optional quiet)
  "Synchronize generated configuration with Ilusia source files."
  (interactive)

  (let ((start-time (current-time)))
    (message "|ilusia| Synchronizing configuration...")

    ;; Remove previously generated components.
    (ilusia--clean-generated)

    ;; Generate configuration.
    (ilusia--tangle)

    ;; Add `provide' forms to generated components.
    (ilusia--add-provides)

    (unless quiet
      (message
       "|ilusia| Synchronized successfully in %.2fs."
       (float-time
        (time-subtract
         (current-time)
         start-time))))))



(straight-use-package 'no-littering)
(require 'no-littering)



(provide 'ilusia-core-config-management)
;;; ilusia-core-config-management.el ends here
