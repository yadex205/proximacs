;;; 99_clanguage.el --- Proximacs configurations for C/C++/Obj-C environment.
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

;; The irony-server configurations at here is specialized for macOS with llvm
;; installed with HomeBrew.

;;; Code:

(require 'company)

(defun setup-irony-integration ()
  "Setup irony integration for C/C++/Obj-C related modes."
  (irony-mode t)
  (add-to-list 'company-backends 'company-irony))

(custom-set-variables
 '(irony-extra-cmake-args
   (list "-DCMAKE_PREFIX_PATH=/local/usr/opt/llvm/" "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON")))

(add-hook 'c-mode-hook
          (lambda ()
            (setup-irony-integration)
            (custom-set-variables
             '(c-basic-offset 2)
             '(flycheck-clang-language-standard "c11"))))

(add-hook 'c++-mode-hook
          (lambda ()
            (setup-irony-integration)
            (custom-set-variables
             '(c-basic-offset 2)
             '(flycheck-clang-language-standard "c++14"))))

(add-hook 'objc-mode-hook'
          (lambda ()
            (setup-irony-integration)))

;;; 99_c_language.el ends here
