;;; 20-keybinds.el -- A part of init script

;; Copyright (C) 2016 Yadex205.
;; Author: Yadex205 <yadex205@outlook.jp>
;; License: The MIT License

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

;; Global
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key esc-map "p" 'scroll-down)
(define-key esc-map "n" 'scroll-up)
(define-key global-map (kbd "C-x C-i") 'indent-region)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

;; iedit-mode
(require 'iedit)
(global-set-key (kbd "C-.") 'iedit-mode)

;; Kill all inactive buffers
;; Reference: http://kotatu.org/blog/2014/02/02/emacs-kill-other-buffers/
(defun my/filter (condp lst)
  (delq nil
	(mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (let* ((no-kill-buffer-names
	  ;; 消さないバッファ名を指定
	  (list (buffer-name (current-buffer))
		"*Messages*" "*Compile-Log*" "*Help*"
		"*init log*" "*Ibuffer*" "*scratch*"
		"*MULTI-TERM-DEDICATED*"))
	 (interested-buffers
	  (my/filter
	   '(lambda (buffer)
	      (and
	       ;; donk kill buffers who has the windows displayed in
	       (not (get-buffer-window (buffer-name buffer)))
	       ;; dont kill hidden buffers (hidden buffers' name starts with SPACE)
	       (not (string-match "^ " (buffer-name buffer)))
	       ;; dont kill buffers who have running processes
	       (let ((proc (get-buffer-process buffer)))
		 (if proc
		     (equal 'exit
			    (process-status
			     (get-buffer-process buffer)))
		   t))))
	   (buffer-list)))
	 (buffers-to-kill
	  (set-difference interested-buffers
			  (mapcar '(lambda (buffer-name)
				     (get-buffer buffer-name))
				  no-kill-buffer-names))))
    (mapc 'kill-buffer buffers-to-kill)))
(global-set-key (kbd "C-c C-b C-b") 'kill-other-buffers)

;;; 20-keybinds.el ends here.
