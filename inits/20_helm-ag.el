;;; 20_helm-ag.el --- My init script for helm-ag

;;; Commentary:

;; This script is separated from others for environments without Silver Search.

;;; Code:

;; Setup silver search behavior
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogrou")

;; Set keybind for helm-ag
(global-set-key (kbd "C-c s") 'helm-ag)

;;; 20_helm-ag.el ends here
