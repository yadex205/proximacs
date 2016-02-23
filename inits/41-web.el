;;; 41-web.el --- My init script for web coding

;;; Commentary:

;;; Code:

(require 'web-mode)
(require 'sgml-mode)
(require 'js2-mode)
(add-hook 'sgml-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'emmet-mode)

(add-hook 'web-mode-hook (lambda ()
                      (setq web-mode-markup-indent-offset 2)))

(setq auto-mode-alist
      (append '(("\\.js$" . js2-mode)
		("\\.json$" . json-mode)) auto-mode-alist))

;;; 41-web.el ends here
