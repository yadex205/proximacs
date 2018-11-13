;;; 99_typescript.el --- My configurations for TypeScript environment.
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

(require 'web-mode)
(require 'tide)

;; Register additional extensions
(add-to-list 'auto-mode-alist '("\\.tsx" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (member (file-name-extension buffer-file-name) '("ts" "tsx"))
              (tide-setup)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (flycheck-add-mode 'typescript-tslint 'web-mode)
              (eldoc-mode t)
              (custom-set-variables
               '(typescript-indent-level 2)))

            (when (member (file-name-extension buffer-file-name) '("tsx"))
              (custom-set-variables
               '(emmet-expand-jsx-className? t)))))

;;; 99_typescript.el ends here
