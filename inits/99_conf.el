;;; 99_conf.el --- Configures for conf-mode

;;; Commentary:

;;; Code:

(require 'conf-mode)

(add-hook 'conf-mode-hook
          (lambda ()
            (setq tab-width 2)))

;;; 99_conf.el ends here
