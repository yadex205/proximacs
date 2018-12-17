;;; 99_css.el --- Proximacs configurations for CSS/Sass/SCSS/Stylus environment.
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

(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode t)
            (hs-minor-mode 1)
            (custom-set-variables
             '(css-indent-offset 2))))
(add-hook 'sass-mode-hook
          (lambda ()
            (rainbow-mode t)
            (hs-minor-mode 1)
            (custom-set-variables
             '(css-indent-offset 2))))
(add-hook 'scss-mode-hook
          (lambda ()
            (rainbow-mode t)
            (hs-minor-mode 1)
            (delete '(".+\\.scss$" flymake-scss-init) flymake-allowed-file-name-masks)
            (custom-set-variables
             '(css-indent-offset 2))))

;;; 99_css.el ends here
