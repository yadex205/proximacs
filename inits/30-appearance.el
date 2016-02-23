;;; 30-appearance.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; Disable unused UI
(menu-bar-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Enable useful UI
(column-number-mode t)
(line-number-mode t)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq show-paren-delay 0)
(display-time)
(which-function-mode 1)

;; nlinum
(global-nlinum-mode t)
(add-hook 'nlinum-mode-hook
          (lambda ()
            (unless (boundp 'nlinum--width)
              (setq nlinum--width
                (length (number-to-string
                         (count-lines (point-min) (point-max))))))))


;; Smartparens
(require 'smartparens-config)
(smartparens-global-mode 1)

;;; 30-appearance.el ends here.
