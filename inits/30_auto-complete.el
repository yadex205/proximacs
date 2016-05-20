;;; 30_auto-complete.el -- My init script for auto-complete

;;; Commentary:

;;; Code:

(require 'auto-complete)
(require 'auto-complete-config)

;; Completion/Auto-Complete
(setq completion-ignore-case t)
(ac-config-default)
(add-hook 'auto-complete-mode-hook
	  (lambda ()
	    (define-key ac-completing-map (kbd "C-n") 'ac-next)
	    (define-key ac-completing-map (kbd "C-p") 'ac-previous)
	    ))

;; Use fuzzy matching
(setq ac-fuzzy-enable t)


;;; 30_auto-complete.el ends here
