;;; 99_markdown.el --- Configures for markdown-mode

;;; Commentary:

;;; Code:

(require 'whitespace)
(require 'markdown-mode)

(add-hook markdown-mode-hook
          (lambda ()
            (setq whitespace-action nil)))

;;; 99_markdown.el ends here
