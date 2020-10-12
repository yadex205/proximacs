;;; init.el -- Proximacs main init script.

;; Copyright (C) 2017-2018 Kanon Kakuno
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

;; Disable obstacle functions/properties
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(menu-bar-mode 0)

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; init-file management
(straight-use-package 'init-loader)

;; appearance
(straight-use-package 'monokai-theme)
(straight-use-package 'nlinum)
(straight-use-package 'path-headerline-mode)
(straight-use-package 'rainbow-mode)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'powerline)
(straight-use-package 'shackle)

;; utils
(straight-use-package 'multi-term)
(straight-use-package 'dired-hacks)
(straight-use-package 'magit)
(straight-use-package 'mmm-mode)

;; editor enhancement
(straight-use-package 'anzu)
(straight-use-package 'company)
(straight-use-package 'flycheck)
(straight-use-package 'flycheck-status-emoji)
(straight-use-package 'flycheck-popup-tip)
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(straight-use-package 'helm-ls-git)
(straight-use-package 'helm-flycheck)
(straight-use-package 'mwim)
(straight-use-package 'nhexl-mode)
(straight-use-package 'prettier-js)

;; C/C++
(straight-use-package 'irony)
(straight-use-package 'irony-eldoc)
(straight-use-package 'company-irony)
(straight-use-package 'flycheck-irony)

;; Objective C
(straight-use-package 'flycheck-objc-clang)

;; Ruby
(straight-use-package 'rspec-mode)
(straight-use-package 'ruby-end)
(straight-use-package 'yard-mode)

;; Frontend
(straight-use-package 'web-mode)
(straight-use-package 'sass-mode)
(straight-use-package 'scss-mode)
(straight-use-package 'stylus-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'company-web)
(straight-use-package 'js2-mode)
(straight-use-package 'typescript-mode)
(straight-use-package 'tide)
(straight-use-package 'vue-mode)

;; Java
(straight-use-package 'kotlin-mode)
(straight-use-package 'groovy-mode)

;; languages
(straight-use-package 'cmake-mode)
(straight-use-package 'glsl-mode)
(straight-use-package 'graphviz-dot-mode)
(straight-use-package 'gitignore-mode)
(straight-use-package 'json-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'nginx-mode)
(straight-use-package 'php-mode)
(straight-use-package 'yaml-mode)
;
;; Load external init scripts
(require 'init-loader)
(setq init-loader-show-log-after-init t)
(init-loader-load)


;;; init.el ends here
