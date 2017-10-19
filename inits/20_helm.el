;;; 20_helm.el --- My init script for helm general configuration


;;; Commentary:


;;; Code:

(require 'helm-config)

;; Enable helm mode
(helm-mode +1)

;; Define keybindings for helm
;; Show helm-mini by C-h
(define-key global-map (kbd "C-h") 'helm-mini)

;; Disable TAB action on helm-mini
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; Override default emacs keybindings
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;; Configure 'helm-ls-git'
(define-key global-map (kbd "C-c p f") 'helm-ls-git-ls)

;; Configure 'helm-ag'
(global-set-key (kbd "C-c s") 'helm-do-ag)
(global-set-key (kbd "C-c S") 'helm-do-ag-project-root)


;;; 20_helm.el ends here
