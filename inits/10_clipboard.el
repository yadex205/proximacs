;;; 10_clipboard.el --- My init script for clipboard sharing

;;; Commentary:

;;; Some codes are quoted from
;;; * http://hakurei-shain.blogspot.jp/2010/05/mac.html
;;; * http://d.hatena.ne.jp/tomoya/20090807/1249601308

;;; Code:

(when (eq system-type 'darwin)
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx)
  )

;;; 10_clipboard.el ends here
