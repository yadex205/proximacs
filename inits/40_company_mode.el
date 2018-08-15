;;; 40_company_mode.el --- Configures for company-mode.

;;; Commentary:

;;; Code:

(require 'company)

(global-company-mode)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

(custom-set-variables
 '(company-idle-delay 0))

;;; 40_company_mode.el ends here
