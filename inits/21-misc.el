;;; 21-misc.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:
;; Workspace
(setq scroll-step 1)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;; Search
(global-anzu-mode t)

;; Clipboard
(setq x-select-enable-clipboard t)

;; Record last-editing-place when close
(require 'saveplace)
(setq-default save-place t)

;; Disable auto backup/save/add-new-line
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq next-line-add-newlines nil)

;;; 21-misc.el ends here.
