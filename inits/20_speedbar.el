;;; 20_speedbar.el -- My init script for speedbar/sr-speedbar

;;; Commentary:

;;; Code:

(require 'sr-speedbar)
(setq sr-speedbar-auto-refresh nil)
(setq speedbar-use-images nil)

;; Show speedbar buffer on left side
(setq sr-speedbar-right-side nil)

;; Show all files include unknown files for speedbar
(setq speedbar-show-unknown-files t)

;; Custom regexp for show hidden files which name is started from "."
(setq speedbar-directory-unshown-regexp "^$")

;; Define keybind for show/hide speedbar buffer
(define-key global-map (kbd "C-u") 'sr-speedbar-toggle)


;;; 20_speedbar.el ends here
