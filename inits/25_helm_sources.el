;;; 25_helm_sources.el --- My init script for helm sources configuration


;;; Commentary:


;;; Code:

;; Define helm source order
(custom-set-variables
 '(helm-mini-default-sources
   '(helm-source-buffers-list
     helm-source-recentf
     helm-source-files-in-current-dir)))


;;; 25_helm_sources.el ends here
