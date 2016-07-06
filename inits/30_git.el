;;; 30_git.el --- My init script for git

;;; Commentary:

;;; Code:

(require 'magit)

;; Set keybinds for magit
(define-key global-map (kbd "C-c C-m C-s") 'magit-status)
(define-key global-map (kbd "C-c C-m C-l") 'magit-log)
(define-key global-map (kbd "C-c C-m C-p") 'magit-push)
(define-key global-map (kbd "C-c C-m C-c") 'magit-checkout)
(define-key global-map (kbd "C-c C-m C-m") 'magit-merge)
(define-key global-map (kbd "C-c C-m C-d") 'magit-diff)
(define-key global-map (kbd "C-c C-m r") 'magit-file-rename)
(define-key global-map (kbd "C-c C-m C-r") 'magit-revert)
(define-key global-map (kbd "C-c C-m M-r") 'magit-rebase)

;;; 30_git.el ends here
