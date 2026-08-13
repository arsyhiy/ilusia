;(defun ilusia-load-component (type component)
;  "Load a ilusia COMPONENT of the given TYPE"
;  (let ((component-name (symbol-name component)))
;    (condition-case err
;        (require (intern (concat "ilusia-" type "-" component-name)) (concat user-emacs-directory "ilusia/" type "s" "/ilusia-" component-name ".el"))
;      (error (progn (message "ERROR: ilusia-%s %s load failed" component-name type)
;		    (if debug-on-error
;		        (debug err)))))))
(defun ilusia-load-component (type component)
  "Load Ilusia COMPONENT of TYPE."
  (require
   (intern
    (format "ilusia-%s-%s"
            type
            (symbol-name component)))))

;; ilusia modules
;;(defun ilusia-module (module)
;;  "Load a ilusia MODULE by name"
;;  (ilusia-load-component "module" module))
(defun ilusia-module (module)
  "Load an Ilusia MODULE by name."
  (ilusia-load-component "module" module))

;; ilusia layers
;(defun ilusia-layer (layer)
;  "Load a ilusia LAYER by name"
;  (ilusia-load-component "layer" layer))
(defun ilusia-layer (layer)
  "Load an Ilusia LAYER by name."
  (ilusia-load-component "layer" layer))
;; ilusia extensions
;(defun ilusia-extend (extension)
;  "Load a ilusia EXTENSION by name"
;  (ilusia-load-component "extension" extension))
(defun ilusia-extend (extension)
  "Load an Ilusia EXTENSION by name."
  (ilusia-load-component "extension" extension))

;; ;;;; Load async package
;; (straight-use-package 'async)
;; (require 'async)

;; ;;;; Tangling machinery
;; (defun ilusia/tangle (org-file &optional quiet)
;;   "Asynchronously tangle an org file."
;;   ;; Record initial time, name of current buffer and set async quiet switch
;;   (let ((init-tangle-start-time (current-time))
;; 	(file (buffer-file-name))
;; 	(async-quiet-switch "-q"))
;;     ;;; Async start
;;     (async-start
;;      ;;; Tangling function
;;      `(lambda ()
;;         ;; Delete all pre-existing ilusia components
;;         (dolist (comp-dir (mapcar (lambda (dir) (concat ,user-emacs-directory "ilusia/" dir)) '("core" "layers" "modules" "extensions")))
;;           (dolist (file (directory-files comp-dir t directory-files-no-dot-files-regexp))
;;             (delete-file file)))
;;         ;; Require org-mode
;; 	(require 'org)
;;         ;; Create a new org-mode tangling hook
;; 	(add-hook 'org-babel-post-tangle-hook
;; 		  (lambda ()
;;                     ;; Obtain component and component type from the name of the source file being tangled to
;;                     (if (string-match "\\(^.*/ilusia/\\)\\(.*\\)\\(/ilusia-\\)\\(.*\\)\\(.el\\)" (buffer-file-name))
;; 		        (let ((component (match-string 4 (buffer-file-name)))
;; 			      (comp-type (match-string 2 (buffer-file-name))))
;; 		          (end-of-buffer)
;; 		          (insert (concat
;; 			           "\n"
;; 			           "(provide 'ilusia-" (if (string-match-p "^.*s" comp-type)
;;                                                            (substring comp-type 0 -1)
;;                                                          comp-type)
;;                                    "-" component ")\n"
;; 			           ";;; ilusia-" component ".el ends here"))
;; 		          (save-buffer)))))
;;         ;; Tangle current file
;; 	(org-babel-tangle-file ,org-file))
;;      ;;; Report success and tangling time (or failure)
;;      (unless quiet
;;        `(lambda (result)
;; 	  (if result
;; 	      (message "|ilusia| ilusia components successfully tangled (%.2fs)."
;; 		       (float-time (time-subtract (current-time) ',init-tangle-start-time)))
;; 	    (message "|ilusia| ilusia component tangling failed.")))))))

;; (defun ilusia/tangle-auto ()
;;   "Automatically tangle Org Mode files in the Emacs config directory"
;;   (let* ((file   (expand-file-name buffer-file-name))
;; 	 (config (string-match (concat user-emacs-directory "config.org$") file))
;; 	 (ilusia (string-match (concat user-emacs-directory "ilusia/ilusia.org$") buffer-file-name))
;; 	 (org-confirm-babel-evaluate nil))
;;     (if ilusia (ilusia/tangle file))
;;     (if config (org-babel-tangle))))

;; (add-hook 'after-save-hook #'ilusia/tangle-auto)


;;;; Async tangling

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
  "Tangle ilusia.org."
  (interactive)

  (let ((org-file (expand-file-name "ilusia.org"
                                    ilusia-directory))
        (start-time (current-time)))

    ;; Remove generated components.
    (dolist (dir '("core" "layers" "modules" "extensions"))
      (let ((directory (expand-file-name dir ilusia-directory)))
        (when (file-directory-p directory)
          (dolist (file
                   (directory-files
                    directory
                    t
                    directory-files-no-dot-files-regexp))
            (when (file-regular-p file)
              (delete-file file))))))

    ;; Tangle.
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle-file org-file))

    ;; Add provide forms.
    (ilusia/tangle-add-provide)

    (unless quiet
      (message
       "|ilusia| Tangled successfully in %.2fs."
       (float-time
        (time-subtract
         (current-time)
         start-time))))))

(defun ilusia/tangle-auto ()
  "Automatically tangle ilusia.org after saving."
  (when (and buffer-file-name
             (string-equal
              (file-truename buffer-file-name)
              (file-truename
               (expand-file-name "ilusia.org"
                                 ilusia-directory))))
    (message "|ilusia| Auto-tangle triggered.")
    (ilusia/tangle)))

(add-hook 'after-save-hook #'ilusia/tangle-auto)

;; no-littering
(straight-use-package 'no-littering)
(require 'no-littering)

(provide 'ilusia-core-config-management)
;;; ilusia-core-config-management.el ends here
