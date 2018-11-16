;;; 90_languages.el -- Proximacs configurations for some languages.
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

;; Conf
(add-hook 'conf-mode-hook
          (lambda ()
            (custom-set-variables
             '(tab-width 2))))

;; C++
(add-hook 'c++-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2)
             '(flycheck-clang-language-standard "c++11"))))

;; Java/Kotlin/Groovy
(add-hook 'java-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2))))
(add-hook 'kotlin-mode-hook
          (lambda ()
            (custom-set-variables
             '(kotlin-tab-width 2))))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; GLSL
(add-to-list 'auto-mode-alist '("\\.fs$"   . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs$"   . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert$" . glsl-mode))
(add-hook 'glsl-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2))))

;; Markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (custom-set-variables
             '(whitespace-action nil))))

;; Graphviz Dot
(add-hook 'graphviz-dot-mode-hook
          (lambda ()
            (custom-set-variables
             '(graphviz-dot-indent-width 2)
             '(graphviz-dot-auto-indent-on-semi nil))))

;; JSON
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-hook 'json-mode-hook
          (lambda ()
            (custom-set-variables
             '(js-indent-level 2)
             '(json-reformat:indent-width 2))))

;;; 90_languages.el ends here
