;;; 30_git.el --- My init script for git

;;; Commentary:

;;; Code:

(require 'magit)

;; Set keybinds for magit
(define-key global-map (kbd "C-c C-m s") 'magit-status)
(define-key global-map (kbd "C-c C-m l") 'magit-log)
(define-key global-map (kbd "C-c C-m p") 'magit-push)

;;; 30_git.el ends here
