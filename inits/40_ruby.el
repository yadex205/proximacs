;;; 40_ruby.el --- My init script for ruby

;;; Commentary:

;; Reference:
;; * http://blog.10rane.com/2014/09/01/set-up-ruby-mode-of-emacs/

;;; Code:

(require 'ruby-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))

;; Disable to insert magic comment (utf-8)
(setq ruby-insert-encoding-magic-comment nil)

;; improve ruby-mode indent behavior
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
	indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
	(setq offset (- column (current-column)))
	(when (and (eq (char-after) ?\))
		   (not (zerop (car state))))
	  (goto-char (cadr state))
	  (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; ruby-end
(require 'ruby-end)
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (abbrev-mode 1)
	     (electric-pair-mode t)
	     (electric-indent-mode t)
	     (electric-layout-mode t)))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;;; disable ruby-lint
(require 'flycheck)

(flycheck-define-checker ruby-rubocop-nolint
  "A Ruby syntax and style checker using the RuboCop tool.

You need at least RuboCop 0.34 for this syntax checker.

See URL `http://batsov.com/rubocop/'."
  :command ("rubocop" "--display-cop-names" "--format" "emacs"
            ;; Explicitly disable caching to prevent Rubocop 0.35.1 and earlier
            ;; from caching standard input.  Later versions of Rubocop
            ;; automatically disable caching with --stdin, see
            ;; https://github.com/flycheck/flycheck/issues/844 and
            ;; https://github.com/bbatsov/rubocop/issues/2576
            "--cache" "false"
            (config-file "--config" flycheck-rubocoprc)
            (option-flag "--lint" flycheck-rubocop-lint-only)
            ;; Rubocop takes the original file name as argument when reading
            ;; from standard input
            "--stdin" source-original)
  :standard-input t
  :error-patterns
  ((info line-start (file-name) ":" line ":" column ": C: "
         (optional (id (one-or-more (not (any ":")))) ": ") (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": W: "
            (optional (id (one-or-more (not (any ":")))) ": ") (message)
            line-end)
   (error line-start (file-name) ":" line ":" column ": " (or "E" "F") ": "
          (optional (id (one-or-more (not (any ":")))) ": ") (message)
          line-end))
  :modes (enh-ruby-mode ruby-mode)
  )


(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (setq flycheck-checker 'ruby-rubocop-nolint)
         (yard-mode)
	     ))

;; haml-mode

(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;;; 40_ruby.el ends here
