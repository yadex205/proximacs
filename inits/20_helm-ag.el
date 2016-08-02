;;; 20_helm-ag.el --- My init script for helm-ag

;;; Commentary:

;; This script is separated from others for environments without Silver Search.

;;; Code:

;; Setup silver search behavior

(add-hook 'helm-mode-hook
          (lambda ()
            (setq helm-ag-base-command "ag --nocolor --nogrou")
            ;; Set keybind for helm-ag
            (global-set-key (kbd "C-c s") 'helm-do-ag)
            (global-set-key (kbd "C-c S") 'helm-do-ag-project-root)))

;;; 20_helm-ag.el ends here
