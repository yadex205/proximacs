;;; 25_helm_sources.el --- My init script for helm sources configuration


;;; Commentary:


;;; Code:

;; Define helm source for emacs-commands
;; https://monolog.linkode.co.jp/articles/kotoh/Emacs%E3%81%A7helm%E3%82%92%E4%BD%BF%E3%81%86
(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
    :candidates (lambda ()
                  (let ((cmds))
                    (mapatoms
                     (lambda (elt) (when (commandp elt) (push elt cmds))))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Helm sources for Emacs commands.")

;; Define helm source for emacs-commands-history
;; https://monolog.linkode.co.jp/articles/kotoh/Emacs%E3%81%A7helm%E3%82%92%E4%BD%BF%E3%81%86
(defvar helm-source-emacs-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Helm sources for Emacs commands history.")



;; Define helm source order
(custom-set-variables
 '(helm-mini-default-sources
   '(helm-source-buffers-list
     helm-source-recentf
     helm-source-files-in-current-dir
     helm-source-emacs-commands-history
     helm-source-emacs-commands)))


;;; 25_helm_sources.el ends here
