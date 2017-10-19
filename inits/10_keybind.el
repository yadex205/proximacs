;;; 10_keybind.el --- My init script defines extra keybindings


;;; Commentary:


;;; Code:

;; Back to previous buffer (reverse version of C-x o)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

;; Page scroll down/up
(define-key esc-map "p" 'scroll-down)
(define-key esc-map "n" 'scroll-up)

;; Indent region
(define-key global-map (kbd "C-x C-i") 'indent-region)

;;; 10_keybind.el ends here
