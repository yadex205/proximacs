;;; 40_web.el --- My init script for web coding

;;; Commentary:

;;; Code:

(require 'web-mode)
(require 'emmet-mode)
(require 'sgml-mode)
(require 'js2-mode)
(require 'tern)
(require 'tern-auto-complete)

;; Start web-mode/emmet-mode when sgmi/html mode started
(add-hook 'sgml-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'emmet-mode)

;; Sass/Scss hook
(add-hook 'css-mode-hook 'emmet-mode)

;; Set Indent for each mode
(add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))

;; Emmet customization
(setq emmet-move-cursor-between-quotes t)

;; Setup tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(tern-ac-setup)

;; Automatical load
(setq auto-mode-alist
      (append '(
                ("\\.js$" . js2-mode)
                ("\\.json$" . json-mode)
                ) auto-mode-alist))

;;; 40_web.el ends here
