;;; 50-R-language.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; ESS (R language)
(require 'ess-mode)
(setq auto-mode-alist
      (cons (cons "\\.R$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs speaks Statistics mode" t)
(autoload 'R "ess-site" "start R" t)
(when (locate-library "ess-site")
  (setq ess-use-auto-complete t))
(add-hook 'R-mode-hook
	  (lambda ()
	    (setq ess-indent-level 2)
	    (ess-toggle-underscore nil)
	    (define-key ess-mode-map (kbd "M-RET") nil)
	    ;(setq ess-arg-function-offset-new-line (list ess-indent-level))
	    (make-variable-buffer-local 'comment-add)
	    (setq commend-add 0)
	    (setq ess-fancy-comments nil)
	    ))


;;; 50-R-language.el ends here.
