;;; 99_web_js.el --- Proximacs configurations for files related to web.
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

;; Register to auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.htm$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

;; Register hook
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; Register Flycheck mode
;; @ref http://cortyuming.hateblo.jp/entry/2018/01/10/111244
;; (flycheck-add-mode 'html-tidy 'web-mode)

;; Define custom variables
(custom-set-variables
 ;; Web-mode indent/padding
 '(web-mode-markup-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-style-padding 2)
 '(web-mode-script-padding 2)
 '(web-mode-block-padding 0)

 ;; Web-mode functions
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-enable-current-column-highlight t)

 ;; Emmet-mode indent/padding
 '(emmet-identation 2)

 ;; Emmet-mode functions
 '(emmet-mode-cursor-between-quotes t)
 '(emmet-self-closing-tag-style " /"))

(require 'web-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (define-key web-mode-map (kbd "C-c C-m") nil)
            (set-face-background 'web-mode-current-element-highlight-face "brightblack")

            (when (member (file-name-extension buffer-file-name) '("php"))
              (custom-set-variables
               '(web-mode-block-padding 0)))

            (when (member (file-name-extension buffer-file-name) '("vue"))
              '(flycheck-add-mode 'javascript-eslint 'web-mode)
              (custom-set-variables
               '(web-mode-script-padding 0)))))

;;; 99_web.el ends here
