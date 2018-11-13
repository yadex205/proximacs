;;; 99_ruby.el --- My configures for Ruby environment.
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

;; Define auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))

;; Define autoload
(autoload 'ruby-block-mode "ruby-block" nil t)

(custom-set-variables
 ;; Disable inserting magic comment
 '(ruby-insert-encoding-magic-comment nil)

 ;; Set 'ruby-block' highlight mode to 'overlay
 '(ruby-block-highlight-toggle 'overlay))

(with-eval-after-load 'ruby-mode
  (define-key ruby-mode-map (kbd "C-c r") 'rspec-find-spec-or-target-other-window))

(add-hook 'ruby-mode-hook
          '(lambda nil
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)
             (ruby-block-mode t)
             (ruby-end-mode t)
             (yard-mode t)))

;;; 99_ruby.el ends here
