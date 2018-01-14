;;; 99_java.el --- My init script to configure java/jvm integration


;;; Commentary:


;;; Code:

;; Define auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; Define custom variables
(custom-set-variables
 ;; Kotlin indent/padding
 `(kotlin-tab-width 2))


;;; 99_java.el ends here
