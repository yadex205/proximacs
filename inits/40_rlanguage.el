;;; 40_rlanguage.el --- My init script for R languages

;;; Commentary:

;;; Code:

(require 'ess)
(require 'speedbar)

;; Enable auto-complete
(setq ess-use-auto-complete t)

;; Don't show evaluated commands/scripts
(setq ess-eval-visibly nil)

;; Don't ask working directory on starting R session
(setq ess-ask-for-ess-directory nil)

;; Load ESS automatically
;; Reference: http://futurismo.biz/archives/2840
(when (locate-library "ess-site") (require 'ess-site))
(setq auto-mode-alist
      (cons (cons "\\[rR]$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;; Register .r to SpeedBar as supported extension
(speedbar-add-supported-extension ".R")
(speedbar-add-supported-extension ".r")

;;; 40_rlanguage.el ends here
