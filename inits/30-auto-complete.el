;; Completion/Auto-Complete
(setq completion-ignore-case t)
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'auto-complete-mode-hook
	  (lambda ()
	    (define-key ac-completing-map (kbd "C-n") 'ac-next)
	    (define-key ac-completing-map (kbd "C-p") 'ac-previous)
	    ))




