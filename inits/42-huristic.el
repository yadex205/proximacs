;;; 42-huristic.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; Completion/Auto-Complete
(setq completion-ignore-case t)
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'auto-complete-mode-hook
	  (lambda ()
	    (define-key ac-completing-map (kbd "C-n") 'ac-next)
	    (define-key ac-completing-map (kbd "C-p") 'ac-previous)
	    ))

;; Flyckeck global
(require 'flycheck)

;;; 42-huristic.el ends here.
