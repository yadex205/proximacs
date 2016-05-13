;;; 20_projectile.el --- My init script for projectile

;;; Commentary:

;;; Code:

;; Apply global projectile mode
(require 'projectile)
(projectile-global-mode)

;; Use helm integration
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Set indexing method as alien, rather than native
(setq projectile-indexing-method 'alien)

;;; 20_projectile.el ends here
