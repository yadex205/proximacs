;;; 30_flycheck.el --- My init script for flycheck configuration


;;; Commentary:


;;; Code:

(global-flycheck-mode 1)
(flycheck-status-emoji-mode t)
(flycheck-popup-tip-mode t)

(flycheck-cask-setup)

;;; 30_flycheck.el ends here
