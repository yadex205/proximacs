;;; 41-project-management.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;;; Git (magit)
(require 'magit)
(setq magit-push-always-verify t)

;;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

;;; 41-project-management.el ends here.
