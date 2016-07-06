;;; 40_markdown.el --- My init script for markdown-mode

;;; Commentary:

;;; Code:

(require 'markdown-mode)

;; Set markdown executable
(setq markdown-command "pandoc -f markdown_github -s --self-contained -t html5 -c ~/.pandoc/github.css")
;;; 40_markdown.el ends here
