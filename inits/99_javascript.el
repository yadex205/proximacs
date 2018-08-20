;;; 99_javascript.el --- Configurations for JavaScript environment.


;;; Commentary:


;;; Code:

(require 'js2-mode)
(require 'tern)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jake" . js2-mode))
(add-to-list 'auto-mode-alist '("Jakefile$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)
            (define-key tern-mode-keymap (kbd "C-c C-j") 'tern-find-definition)
            (eldoc-mode t)))

(add-hook 'web-mode-hook
          (lambda()
            (when (member (file-name-extension buffer-file-name) '("vue"))
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (custom-set-variables
               '(web-mode-code-indent-offset 2)))))

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-strict-missing-semi-warning t))

;;; 99_javascript.el ends here
