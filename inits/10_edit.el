;;; 10_edit.el --- Configures behaviors on editing


;;; Commentary:


;;; Code:

;; Indentation
(setq-default tab-width 8 indent-tabs-mode nil)

;; Define scroll step
(setq scroll-step 1)

;; Enable enhanced C-a
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)

;; Enable enhanced search powered by anzu
(global-anzu-mode t)

;; Remove unnecessary spaces on saving
(setq whitespace-action '(auto-cleanup))

;; Add final newline on saving
(setq mode-require-final-newline t)
(setq require-final-newline t)

;; Disable auto backup/save
(setq backup-inhibited t)
(setq make-backup-files nil)


;;; 10_edit.el ends here
