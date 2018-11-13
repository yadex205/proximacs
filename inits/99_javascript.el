;;; 99_javascript.el --- My configurations for JavaScript environment.
;;
;; Copyright (c) 2017-2018 Kanon Kakuno
;;
;; Author: Kanon Kakuno <yadex205@outlook.jp>
;; URL: https://github.com/yadex205/.emacs.d

;; This file is not part of GNU Emacs.

;;; License:

;; The MIT License (MIT)
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jake$" . js2-mode))
(add-to-list 'auto-mode-alist '("^Jakefile$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            (tide-setup)
            (tide-hl-identifier-mode t)
            (eldoc-mode t)
            '(define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
            '(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
            (custom-set-variables
             '(js2-basic-offset 2)
             '(js2-strict-missing-semi-warning nil))))

;;; 99_javascript.el ends here
