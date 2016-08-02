;;; 20_helm-keybinds.el --- My init script for keybinds of helm

;;; Commentary:

;;; Code:

(add-hook 'helm-mode-hook
          (lambda ()
            ;; Set keybind for show/hide helm-mini
            (define-key global-map (kbd "C-h") 'helm-mini)

            ;; Disable helm-select-action
            (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
            (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

            ;; Override default emacs actions by helm
            (define-key global-map (kbd "C-x C-f") 'helm-find-files)
            (define-key global-map (kbd "M-x") 'helm-M-x)))

;;; 20_helm-keybinds.el ends here
