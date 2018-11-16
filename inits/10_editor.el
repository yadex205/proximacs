;;; 10_editor.el --- Proximacs configurations for editor behaviors.
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

(setq-default tab-width 2 indent-tabs-mode nil)

;; Ref: https://www.emacswiki.org/emacs/SmoothScrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)

(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-action '(auto-cleanup))
(setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))

(delete-selection-mode t)

(setq mode-require-final-newline t)
(setq require-final-newline t)

(setq backup-inhibited t)
(setq make-backup-files nil)

(setq enable-local-variables :all)

(when (eq system-type 'darwin)
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx)
  )

(require 'mwim)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)

(require 'anzu)
(global-anzu-mode t)

(require 'shackle)
(shackle-mode t)
(setq shackle-rules
      '(("*Help*" :select t)
        ("\*helm" :regexp t :align bottom)))

(require 'flycheck)
(global-flycheck-mode 1)
(flycheck-status-emoji-mode t)
(flycheck-popup-tip-mode t)
(custom-set-variables
 '(flycheck-popup-tip-error-prefix "😱 ")
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-temp-prefix ".flycheck"))

(require 'company)
(global-company-mode t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(custom-set-variables
 '(company-idle-delay 0))

(require 'magit)
(define-key global-map (kbd "C-c C-m C-s") 'magit-status)

;;; 10_editor.el ends here
