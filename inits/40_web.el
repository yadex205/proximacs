;;; 40_web.el --- My init script for web coding

;;; Commentary:

;;; Code:

;; Automatical load

(autoload 'web-mode "web-mode" nil t)
(autoload 'js2-mode "js2-mode" nil t)

;; Start web-mode/emmet-mode when sgmi/html mode started
(add-hook 'sgml-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'emmet-mode)

;; Sass/Scss hook
(add-hook 'css-mode-hook 'emmet-mode)

;; Set Indent for each mode
(add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))
(add-hook 'css-mode-hook (lambda () (setq css-indent-offset 2)))

;; Emmet customization
(setq emmet-move-cursor-between-quotes t)

;; Coffee script setup
(add-hook 'coffee-mode-hook (lambda () (setq coffee-tab-width 2)))

;; Json mode setup
(add-hook 'json-mode-hook (lambda () (setq js-indent-level 4)))


(add-to-list 'auto-mode-alist (append '("\\.js$" . js2-mode)))
(add-to-list 'auto-mode-alist (append '("\\.json$" . json-mode)))
(add-to-list 'auto-mode-alist (append '("\\.ejs$" . html-mode)))
(add-to-list 'auto-mode-alist (append '("\\.coffee$" . coffee-mode)))
(add-to-list 'auto-mode-alist (append '("\\.scss$" . scss-mode)))

;;; 40_web.el ends here
