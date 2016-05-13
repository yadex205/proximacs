;;; 20_helm.el -- My init script for helm/projectile

;;; Commentary:

;;; Code:

(require 'helm-mode)
(require 'helm-config)
(require 'helm-descbinds)

;; Turn on helm-mode/helm-descbinds-mode
(helm-mode +1)
(helm-descbinds-mode +1)

;; Unknown
(setq helm-delete-minibuffer-contents-from-point t)
(setq helm-ff-auto-update-initial-value nil)
(delete '(find-file) helm-completing-read-handlers-alist)
(delete '(execute-extended-command) helm-completing-read-handlers-alist)


;;; 20_helm.el ends here
