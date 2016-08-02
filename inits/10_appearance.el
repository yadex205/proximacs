;;; 10_appearance.el -- My init script for appearance

;;; Commentary:

;;; Code:

;; Set color theme as Monokai and makes background to be transparent
(load-theme 'monokai t)
(add-hook 'window-setup-hook
	  (lambda ()
	  (unless (display-graphic-p (selected-frame))
	    (set-face-background 'default "unspecified-bg" (selected-frame)))))

;; Show line numbers on left of buffer(s)
(require 'nlinum)
(global-nlinum-mode t)

;; Emphasis parens
(show-paren-mode t)

;; Simplify startup screen
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Disable waste UIs
(menu-bar-mode 0)

;;; 10_appearance.el ends here
