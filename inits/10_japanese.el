;;; 10_japanese.el --- My init script for japanese input

;;; Commentary:

;;; Code:

;; (require 'skk)

;;;; Set default Input method as ssk
;; (setq default-input-method "japanese-skk")

;; Setup migemo
;; Reference: http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51
(require 'migemo nil t)
(when (executable-find "cmigemo")
  (setq migemo-command "cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )

;;; 10_japanese.el ends here
