;;; 40_latex.el --- My init script for tex writing

;;; Commentary:

;;; Code:

(require 'yatex)

;; Autoload yatex mode for following extensions
(autoload 'yatex-mode "Yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
		("\\.ltx$" . yatex-mode)
		("\\.cls$" . yatex-mode)
		("\\.sty$" . yatex-mode)
		("\\.clo$" . yatex-mode)
		("\\.bbl$" . yatex-mode)) auto-mode-alist))

;; Avoid keybind confliction with tmux
(setq YaTeX-inhibit-prefix-letter t)

;; Define TeX commands
(setq tex-command "ptex2pdf -l -u -ot '-synctex=1'")

;; YaTeX detail configures
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)

;;; 40_latex.el ends here
