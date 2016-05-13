;;; 10_environment.el --- My init script for general environment

;;; Commentary:

;;; Code:

;; Remenber places on that files are saved
(require 'saveplace)
(setq-default save-place t)

;; Scrolling
(setq scroll-step 1)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;; Search
(global-anzu-mode t)

;; disable auto backup/save/add-new-line
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq next-line-add-newlines nil)

;; extra keybinds
(define-key esc-map "p" 'scroll-down)
(define-key esc-map "n" 'scroll-up)
(define-key global-map (kbd "C-x C-i") 'indent-region)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)

;; Space
(setq-default tab-width 4  indent-tabs-mode nil)

;;; 10_environment.el ends here
