;;; 40-helm.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'helm-config)
(require 'helm-descbinds)
(helm-mode +1)
(helm-descbinds-mode +1)
(setq helm-delete-minibuffer-contents-from-point t)
(setq helm-ff-auto-update-initial-value nil)
(delete '(find-file) helm-completing-read-handlers-alist)
(delete '(execute-extended-command) helm-completing-read-handlers-alist)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-;") 'helm-mini)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(defadvice helm-buffers-sort-transformer (around ignore activate)
  (setq ad-return-value (ad-get-arg 0)))
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

(defvar helm-source-emacs-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Emacs commands history")

(custom-set-variables
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               helm-source-emacs-commands-history
                               helm-source-emacs-commands
                               )))

;; Keybind
(define-key global-map (kbd "C-c h") 'helm-descbinds)

;;; 40-helm.el ends here.
