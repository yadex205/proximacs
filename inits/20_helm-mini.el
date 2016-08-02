;;; 20_helm-mini.el --- My init script for helm-mini

;;; Commentary:

;;; Code:

(add-hook 'helm-mode-hook
          (lambda ()
            (require 'helm-config)

            ;; A helm source for emacs commands
            (defvar helm-source-emacs-commands
              (helm-build-sync-source "Emacs commands"
                :candidates (lambda ()
                              (let ((cmds))
                                (mapatoms
                                 (lambda (elt) (when (commandp elt) (push elt cmds))))
                                cmds))
                :coerce #'intern-soft
                :action #'command-execute)
              "A simple helm source for Emacs commands.")

            ;; A helm source for emacs commands history
            (defvar helm-source-emacs-commands-history
              (helm-build-sync-source "Emacs commands history"
                :candidates (lambda ()
                              (let ((cmds))
                                (dolist (elem extended-command-history)
                                  (push (intern elem) cmds))
                                cmds))
                :coerce #'intern-soft
                :action #'command-execute)
              "A simple helm source for Emacs commands history.")

            ;; Set helm-mini sources
            (custom-set-variables
             '(helm-mini-default-sources
               '(helm-source-buffers-list
                 helm-source-recentf
                 helm-source-files-in-current-dir
                 helm-source-emacs-commands-history
                 helm-source-emacs-commands
                 )))
            ))


;;; 20_helm-mini.el ends here
