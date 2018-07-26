;;; 99_typescript.el --- Configurations for TypeScript environment.


;;; Commentary:


;;; Code:

(require 'typescript-mode)

;; Register additional extensions
(add-to-list 'auto-mode-alist '("\\.tsx" . typescript-mode))

;; Set variables
(custom-set-variables
 ;; for typescript-mode
 '(typescript-indent-level 2))


;;; 99_typescript.el ends here
