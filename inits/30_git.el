;;; 30_git.el --- My init script for git

;;; Commentary:

;;; Code:
(require 'magit)

(define-key global-map (kbd "C-c C-m C-s") 'magit-status)

;;; 30_git.el ends here
