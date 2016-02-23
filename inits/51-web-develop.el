;;; 51-web-develop.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; Web-Mode/Emmet-Mode
(require 'web-mode)
(add-hook 'sgml-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'web-mode)
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 2)
	    (setq web-mode-css-indent-offset 4)
	    (setq web-mode-code-indent-offset 4)
	    ))
(setq emmet-move-cursor-between-quotes t)

;; JS2-Mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; SCSS-Mode
(require 'scss-mode)
(add-hook 'scss-mode-hook
	  (lambda ()
	    (setq scss-compile-at-save nil)
	    ))
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))


;;; 51-web-develop.el ends here.
