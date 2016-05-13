;;; 20_helm.el -- My init script for helm/projectile

;;; Commentary:

;;; Code:

(require 'helm-mode)
(require 'helm-config)
(require 'helm-descbinds)

;; Turn on helm-mode/helm-descbinds-mode
(helm-mode +1)
(helm-descbinds-mode +1)

;; Turn on helm-migemo-mode for incremental search Japanese characrers by roma-ji
(require 'migemo)
(helm-migemo-mode t)

;; Disable helm auto update
(setq helm-ff-auto-update-initial-value nil)

;; Disable helm sorting
;; Reference: http://rubikitch.com/tag/helm-buffers-sort-transformer/
(defadvice helm-buffers-sort-transformer (around ignore activate)
  "Disable helm-buffers-sort-transformer."
  (setq ad-return-value (ad-get-arg 0)))

;; Unknown
(setq helm-delete-minibuffer-contents-from-point t)
(delete '(find-file) helm-completing-read-handlers-alist)
(delete '(execute-extended-command) helm-completing-read-handlers-alist)

;;; 20_helm.el ends here
