;;; 30_flycheck.el --- My init script for flycheck

;;; Commentary:

;;; Code:

;; Flyckeck global
(require 'flycheck)

(add-hook 'after-init-hook ( lambda ()
			     (global-flycheck-mode 1)
			     (flycheck-status-emoji-mode t)
			     ))
(add-hook 'flycheck-mode-hook #'flycheck-cask-setup)
;;; 30_flycheck.el ends here
