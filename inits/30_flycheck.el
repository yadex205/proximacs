;;; 30_flycheck.el --- My init script for flycheck configuration


;;; Commentary:


;;; Code:

(global-flycheck-mode 1)
(flycheck-status-emoji-mode t)
(flycheck-popup-tip-mode t)
(flycheck-cask-setup)

(custom-set-variables
 '(flycheck-popup-tip-error-prefix "😱 ")
 '(flycheck-display-errors-delay 0.3))

;;; 30_flycheck.el ends here
