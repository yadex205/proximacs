;;; 40_company_mode.el --- Configures for company-mode.

;;; Commentary:

;;; Code:

(require 'company)
(require 'whitespace)

(global-company-mode)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

(add-hook 'company-completion-started-hook
          (lambda (started-manually)
            (whitespace-mode -1)))

(add-hook 'company-completion-cancelled-hook
          (lambda (cancelled-manually)
            (whitespace-mode t)))

(add-hook 'company-completion-finished-hook
          (lambda (selected-candidate)
            (whitespace-mode t)))


(custom-set-variables
 '(company-idle-delay 0))

;;; 40_company_mode.el ends here
