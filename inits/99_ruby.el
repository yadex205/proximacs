;;; 99_ruby.el --- My init script to configure ruby integration


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
