;;; 99_typescript.el --- Configurations for TypeScript environment.


;;; Commentary:


;;; Code:

(require 'web-mode)
(require 'tide)

;; Register additional extensions
(add-to-list 'auto-mode-alist '("\\.tsx" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (member (file-name-extension buffer-file-name) '("ts" "tsx"))
              (tide-setup)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (flycheck-add-mode 'typescript-tslint 'web-mode)
              (eldoc-mode t))

            (when (member (file-name-extension buffer-file-name) '("tsx"))
              (custom-set-variables
               '(emmet-expand-jsx-className? t)))))

;; Set variables
(custom-set-variables
 ;; for typescript-mode
 '(typescript-indent-level 2))


;;; 99_typescript.el ends here
