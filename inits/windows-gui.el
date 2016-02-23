;;; windows-gui.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; When window-system enabled
(if window-system
    (progn
      (setq default-directory "~/")
      (setq command-line-default-directory "~/")

      ;; Powerline
      (require 'powerline)
      (add-hook 'after-init-hook 'powerline-center-theme)

      (set-face-attribute 'default        nil :family "Inconsolata Bold")
      (set-face-attribute 'fixed-pitch    nil :family "Inconsolata Bold")
      (set-face-attribute 'variable-pitch nil :family "Inconsolata Bold")
      (add-to-list 'default-frame-alist '(font .      "Inconsolata Bold-10.5"))
      (set-face-font 'font-lock-comment-face          "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-string-face           "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-keyword-face          "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-builtin-face          "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-function-name-face    "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-variable-name-face    "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-type-face             "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-constant-face         "Inconsolata Bold-10.5")
      (set-face-font 'font-lock-warning-face          "Inconsolata Bold-10.5")

      (define-key global-map (kbd "M-RET") 'toggle-frame-fullscreen)

      (scroll-bar-mode -1)
      (load-theme 'monokai t)
      (setq initial-frame-alist
	    (append
	     '((top . 48 ) (width . 140) (height . 60)) initial-frame-alist))
      (set-window-margins (selected-window) 100 0)
      (tool-bar-mode 0)
      (setq frame-title-format (format "%%b - GNU Emacs %s" emacs-major-version))
      
      ;; For Windows NT
      (if system-name 'windows-nt
	
	)
      )
  )

;;; windows-gui.el ends here.
