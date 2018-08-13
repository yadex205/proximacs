;;; 99_typescript.el --- Configurations for TypeScript environment.


;;; Commentary:


;;; Code:

(require 'web-mode)
(require 'tide)

;; Register additional extensions
(add-to-list 'auto-mode-alist '("\\.tsx" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (eldoc-mode t))))

(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Set variables
(custom-set-variables
 ;; for typescript-mode
 '(typescript-indent-level 2))


;;; 99_typescript.el ends here
