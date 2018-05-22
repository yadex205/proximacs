;;; 10_appearance.el -- My init script for appearance configuration


;;; Commentary:


;;; Code:

;; Set color theme
;;
;; To make default background transparent, call set-face-background
;; after 'window-setup-hook'
(load-theme 'monokai t)
(add-hook 'window-setup-hook
          (lambda ()
            (unless (display-graphic-p (selected-frame))
              (set-face-background 'default "unspecified-bg" (selected-frame)))))

;; Emphasis parens
(show-paren-mode t)

;; Show line numbers
(global-nlinum-mode t)

;; Show fullpath on headerline
(path-headerline-mode +1)

;; Show whitespaces/tabs
(setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
(global-whitespace-mode t)

;; Truncate overflow lines
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)


;;; 10_appearance.el ends here
