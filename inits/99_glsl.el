;;; 99_glsl.el --- An init script to configure GLSL development environment


;;; Commentary:

;;; Code:

;; Register to auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.fs$"   . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs$"   . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert$" . glsl-mode))

;; Define custom variables
(custom-set-variables
 ;; Set indent width
 '(c-basic-offset 2))

;;; 99_glsl.el ends here
