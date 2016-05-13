;;; 20_helm-keybinds.el --- My init script for keybinds of helm

;;; Commentary:

;;; Code:

(require 'helm-mode)

;; Set keybind for show/hide helm-mini
(define-key global-map (kbd "C-h") 'helm-mini)

;; Set keybind for show helm-kill-ring
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;; Set keybind for show helm-version descbinds
(define-key global-map (kbd "C-c h") 'helm-descbinds)

;; Disable helm-select-action
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; Override default emacs actions by helm
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "M-x") 'helm-M-x)

;;; 20_helm-keybinds.el ends here
