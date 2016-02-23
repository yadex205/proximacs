;;; 20-helm.el -- My init script for helm/projectile

;;; Commentary:

;;; Code:

(require 'helm-mode)
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
(define-key global-map (kbd "C-h") 'helm-mini)
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

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

;; Sr Speedbar
(require 'sr-speedbar)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq speedbar-directory-unshown-regexp "^$")

(define-key global-map (kbd "C-u") 'sr-speedbar-toggle)
;;; 20-helm.el ends here
