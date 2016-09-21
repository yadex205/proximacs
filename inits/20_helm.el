;;; 20_helm.el -- My init script for helm/projectile

;;; Commentary:

;;; Code:

(require 'helm-mode)

;; Turn on helm-mode/helm-descbinds-mode
(helm-mode +1)

(add-hook 'helm-mode-hook
          (lambda ()
                 (require 'helm-config)
                 (require 'helm-descbinds)

                 (helm-descbinds-mode +1)

                 ;; Disable helm auto update
                 (setq helm-ff-auto-update-initial-value nil)

                 ;; Unknown
                 (setq helm-delete-minibuffer-contents-from-point t)
                 (delete '(find-file) helm-completing-read-handlers-alist)
                 (delete '(execute-extended-command) helm-completing-read-handlers-alist)
                 ))

;;; 20_helm.el ends here
