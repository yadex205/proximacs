;;; 99_javascript.el --- Proximacs configurations for JavaScript/TypeScript environment.
;;
;; Copyright (c) 2017-2018 Kanon Kakuno
;;
;; Author: Kanon Kakuno <yadex205@outlook.jp>
;; URL: https://github.com/yadex205/proximacs

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

(require 'web-mode)
(require 'tide)

(setq flycheck-javascript-eslint-executable "eslint_d")
;;; (setq flycheck-css-stylelint-executable "stylelint_d")
;;; (setq flycheck-scss-stylelint-executable "stylelint_d")

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jake$" . js2-mode))
(add-to-list 'auto-mode-alist '("Jakefile$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx" . web-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(defun setup-tide-integration ()
  "Setup tide integration for JavaScript/TypeScript related modes."
  (tide-setup)
  (tide-hl-identifier-mode t)
  (eldoc-mode t)
  (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition))

(add-hook 'js2-mode-hook
          (lambda ()
            (setup-tide-integration)
            '(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
            (custom-set-variables
             '(js2-basic-offset 2)
             '(js2-strict-missing-semi-warning nil))))

(add-hook 'typescript-mode-hook
          (lambda ()
            (setup-tide-integration)
            (flycheck-add-mode 'javascript-eslint 'typescript-mode)
            (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
            (prettier-js-mode)
            (custom-set-variables
             '(typescript-indent-level 2))))

(add-hook 'web-mode-hook
          (lambda ()
            (when (member (file-name-extension buffer-file-name) '("tsx"))
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (setup-tide-integration)
              (setq-default flycheck-disabled-checkers '(jsx-tide handlebars))
              (flycheck-add-mode 'css-stylelint 'web-mode)
              (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)
              (prettier-js-mode t)
              (custom-set-variables
               '(emmet-expand-jsx-className? t)
               '(web-mode-code-indent-offset 2)))))

;;; 99_javascript.el ends here
