;;; 10_spellcheck.el -- My init script for spell checking

;;; Commentary:

;;; Code:

;; Setup integration with aspell
;; Reference: http://keisanbutsuriya.hateblo.jp/entry/2015/02/10/152543
(require 'ispell)
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\---=\377]+")))


;;; 10_spellcheck.el ends here
