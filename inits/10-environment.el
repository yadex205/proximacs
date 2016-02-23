;;; 10-environment.el --- My init script configuring environment

;;; Commentary:

;;; Code:

;; remember finish-editing placep
(require 'saveplace)
(setq-default save-place t)

;; behavior
(setq scroll-step 1)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;; search
(global-anzu-mode t)

;; disable auto backup/save/add-new-line
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq next-line-add-newlines nil)

;; disable unused UI
(menu-bar-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; extra keybinds
(define-key esc-map "p" 'scroll-down)
(define-key esc-map "n" 'scroll-up)
(define-key global-map (kbd "C-x C-i") 'indent-region)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)

;; appearance
(require 'nlinum)
(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)
(global-linum-mode t)
(add-hook 'nlinum-mode-hook
	  (lambda ()
	    (unless (boundp 'nlinum-width)
	      (setq nlinum--width
		    (length (number-to-string
			     (count-lines (point-min) (point-max))))))))


;; load theme
(load-theme 'monokai t)
(add-hook 'window-setup-hook
	  (lambda ()
	  (unless (display-graphic-p (selected-frame))
	    (set-face-background 'default "unspecified-bg" (selected-frame)))))

;; Space
(setq-default tab-width 4  indent-tabs-mode nil)

;;; 10-environment.el ends here
