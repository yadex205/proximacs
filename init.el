;;; init.el -- Proximacs init script

;; Copyright (C) 2017-2022 Kanon Kakuno
;;
;; Author: Kanon Kakuno <yadex205@outlook.jp>
;; URL: https://github.com/yadex205/proximacs

;;; License:
;; The MIT License (MIT)

;;; Commentary:

;;; Code:

;;
;;; Constants

(defvar is-macos (eq system-type 'darwin) "Non-nil means this GNU Emacs is running on a macOS.")
(defvar is-linux (eq system-type 'gnu/linux) "Non-nil means this GNU Emacs is running on a GNU/Linux.")
(defvar is-wsl2 (and is-linux (numberp (string-match-p "WSL2" (shell-command-to-string "uname -r")))) "Non-nil means this GNU Emacs is running on a GNU/Linux under WSL2.")



;;
;;; Performance

(setq gc-cons-threshold (* 1024 1024 10))
(setq read-process-output-max (* 10 1024 1024))



;;
;;; GNU Emacs native behaviors

(setq make-backup-files nil)



;;
;;; Package manager (straight.el)

(custom-set-variables
 '(straight-check-for-modifications nil))
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



;;
;;; Appearance

;; Hide GNU Emacs native UIs
(menu-bar-mode 0)

;; Show match parens
(show-paren-mode t)

;; Show line numbers
(global-display-line-numbers-mode t)

;; Show whitespaces
(custom-set-variables
 '(whitespace-style '(face trailing tabs spaces empty space-mark tab-mark)))
(global-whitespace-mode t)

;; Apply monokai theme
(straight-use-package 'monokai-theme)
(load-theme 'monokai t)
(when (not window-system)
  (set-face-background 'default "unspecified-bg"))

;; Apply Powerline
(straight-use-package 'powerline)
(powerline-center-theme)



;;
;;; Default coding behaviors

(custom-set-variables
 '(indent-tabs-mode nil)
 '(tab-width 2))

;; Avoid opening image files by "display-buffer" on CLI environment
(defun advice-display-buffer-cli-filter (original-display-buffer-function buffer-or-name &optional action frame)
  "Advice function to conditionally override 'display-buffer' for CLI environment."
  (if (not (display-graphic-p))
      (with-current-buffer buffer-or-name
        (if (and (buffer-file-name)
                 (image-type-from-file-name (buffer-file-name)))
            (browse-url (buffer-file-name))
            (message "Opening image is not supported on CLI environment.")
          (funcall original-display-buffer-function buffer-or-name action frame)))
    (funcall original-display-buffer-function buffer-or-name action frame)))

(when (not (display-graphic-p))
  (advice-add 'display-buffer :around #'advice-display-buffer-cli-filter))



;;
;;; Coding experience enhancements

(delete-selection-mode t)

(custom-set-variables
 '(isearch-lazy-count t)
 '(isearch-lazy-highlight t))

;; Share clipboard with system
(defun copy-to-system-clipboard (text &optional push)
  "Send TEXT to system clipboard.  PUSH will not be used."
  (cond (is-macos
         (let ((process-connection-type nil))
           (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
             (process-send-string proc text)
             (process-send-eof proc))))
        (is-wsl2
         (let ((process-connection-type nil))
           (let ((proc (start-process "clip.exe" "*Messages*" "clip.exe")))
             (process-send-string proc text)
             (process-send-eof proc))))))

(defun copy-from-system-clipboard ()
  "Receive text from system clipboard."
  (cond (is-macos (shell-command-to-string "pbpaste"))))

(custom-set-variables
 '(interprogram-cut-function 'copy-to-system-clipboard)
 '(interprogram-paste-function 'copy-from-system-clipboard))

;; Enable mwim
(straight-use-package 'mwim)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)


;; Enable Embark
(straight-use-package 'embark)


;; Enable Vertico
(straight-use-package 'vertico)
(straight-use-package 'vertico-prescient)
(straight-use-package 'embark-consult)
(vertico-mode)
(vertico-prescient-mode)


;; Enable Consult
(straight-use-package 'consult)
(straight-use-package 'consult-ag)
(straight-use-package 'consult-ls-git)

;; Enable shackle
(straight-use-package 'shackle)
(custom-set-variables
 '(shackle-rules
      '(("*Help*" :select t))))
(shackle-mode t)

;; Enable company-mode
(straight-use-package 'company-mode)
(custom-set-variables
 '(company-idle-delay 0.2))

;; Enable flycheck with plugins
(straight-use-package 'flycheck)
(straight-use-package 'flycheck-inline)
(straight-use-package 'flycheck-status-emoji)
(straight-use-package 'consult-flycheck)
(custom-set-variables
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-temp-prefix ".flycheck"))
(add-hook 'flycheck-mode-hook
          (lambda ()
            (flycheck-status-emoji-mode t)
            (flycheck-inline-mode t)))


;; Enable path-headeline-mode
(straight-use-package 'path-headerline-mode)
(path-headerline-mode t)



;;
;;; Integrate with Git (Magit)
(straight-use-package 'magit)



;;
;;; Integrate with LSP (lsp-mode)

(custom-set-variables
 '(lsp-enable-snippet nil)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-lens-enable nil))
(straight-use-package 'lsp-mode)



;;
;;; C/C++/C#/Obj-C

(straight-use-package 'irony)
(straight-use-package 'irony-eldoc)
(straight-use-package 'company-irony)
(straight-use-package 'flycheck-irony)
(straight-use-package 'flycheck-objc-clang)
(custom-set-variables
 '(irony-extra-cmake-args
   (list "-DCMAKE_PREFIX_PATH=/local/usr/opt/llvm/" "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON")))
(add-hook 'irony-mode-hook #'irony-eldoc)
(add-hook 'c-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2)
             '(flycheck-clang-language-standard "c11"))
            (company-mode t)
            (flycheck-mode t)
            (irony-mode t)
            (company-irony-setup-begin-commands)
            (add-to-list 'company-backends 'company-irony)
            (flycheck-irony-setup)
            (irony-cdb-autosetup-compile-options)))
(add-hook 'c++-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2)
             '(flycheck-clang-language-standard "c++14"))
            (company-mode t)
            (flycheck-mode t)
            (irony-mode t)
            (company-irony-setup-begin-commands)
            (add-to-list 'company-backends 'company-irony)
            (flycheck-irony-setup)
            (irony-cdb-autosetup-compile-options)))
(add-hook 'objc-mode-hook
          (lambda ()
            (company-mode t)
            (flycheck-mode t)
            (irony-mode t)
            (company-irony-setup-begin-commands)
            (add-to-list 'company-backends 'company-irony)
            (flycheck-irony-setup)
            (irony-cdb-autosetup-compile-options)))



;;
;;; Elisp

(straight-use-package 'package-lint)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (flycheck-mode t)
            (company-mode t)))



;;
;;; HTML/CSS/JavaScript/TypeScript

(straight-use-package 'scss-mode)

;; Enable emmet
(straight-use-package 'emmet-mode)
(custom-set-variables
 '(emmet-identation 2)
 '(emmet-mode-cursor-between-quotes t)
 '(emmet-self-closing-tag-style " /"))

;; Enable web-mode
(straight-use-package 'web-mode)
(custom-set-variables
 '(web-mode-block-padding 0)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-content-types-alist '(("javascript" . "\\.[cm]?js$")))
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-style-padding 2))
(add-to-list 'auto-mode-alist '("\\.cjs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mjs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(with-eval-after-load 'web-mode
  (set-face-foreground 'web-mode-html-tag-bracket-face monokai-foreground))

;; Integrate with Biome (biomejs-format)
(straight-use-package
 '(biomejs-format :type git :host github :repo "yadex205/emacs-biomejs-format"))

;; Define Stylelint checker for flycheck
(flycheck-define-checker general-stylelint
  "A checker for CSS and related languages using Stylelint"
  :command ("stylelint"
            (eval flycheck-stylelint-args)
            (option-flag "--quiet" flycheck-stylelint-quiet)
            (config-file "--config" flycheck-general-stylelintrc))
  :standard-input t
  :error-parser flycheck-parse-stylelint
  :predicate flycheck-buffer-nonempty-p
  :modes (scss-mode))
(flycheck-def-config-file-var flycheck-general-stylelintrc
    (general-stylelint) nil)
(add-to-list 'flycheck-checkers 'general-stylelint)

;; Setup flycheck
(custom-set-variables
 '(flycheck-javascript-eslint-executable "eslint_d"))

;; Configure for each languages with web-mode
(add-hook 'css-mode-hook
          (lambda ()
            (custom-set-variables
             '(css-indent-offset 2))
            (company-mode t)
            (flycheck-mode t)
            (flycheck-popup-tip-mode t)
            (biomejs-format-mode t)))
(add-hook 'scss-mode-hook
          (lambda ()
            (custom-set-variables
             '(css-indent-offset 2))
            (delete '(".+\\.scss$" flymake-scss-init) flymake-allowed-file-name-masks)
            (flycheck-disable-checker 'scss-stylelint)
            (company-mode t)
            (flycheck-mode t)
            (biomejs-format-mode t)))
(add-hook 'web-mode-hook
          (lambda ()
            (when (member (file-name-extension buffer-file-name) '("html" "js" "cjs" "mjs" "ts" "jsx" "tsx"))
              (lsp-deferred))
            (when (member (file-name-extension buffer-file-name) '("js" "cjs" "mjs" "ts" "jsx" "tsx"))
              (biomejs-format-mode))
            (when (member (file-name-extension buffer-file-name) '("html" "jsx" "tsx"))
              (emmet-mode t))))



;;
;;; GLSL

(straight-use-package 'glsl-mode)
(add-hook 'glsl-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2))))
(add-to-list 'auto-mode-alist '("\\.fs$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert$" . glsl-mode))



;;
;;; Go
(straight-use-package 'go-mode)
(add-hook 'go-mode-hook
          (lambda ()
            (custom-set-variables
             '(lsp-go-use-placeholders nil)
             '(lsp-prefer-flymake nil))
            (lsp-deferred)
            (add-hook 'before-save-hook #'lsp-format-buffer t t)
            (add-hook 'before-save-hook #'lsp-organize-imports t t)))



;;
;;; Java/JVM/Processing PDE
(straight-use-package 'groovy-mode)
(straight-use-package 'kotlin-mode)
(add-hook 'java-mode-hook
          (lambda ()
            (setq c-basic-offset 2)))
(add-hook 'groovy-mode-hook
          (lambda ()
            (custom-set-variables
             '(groovy-indent-offset 2))))
(add-hook 'kotlin-mode-hook
          (lambda ()
            (custom-set-variables
             '(kotlin-tab-width 2))))
(add-to-list 'auto-mode-alist '("\\.pde$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.jenkinsfile$" . groovy-mode))



;;
;;; Markdown
(straight-use-package 'markdown-mode)



;;
;;; Mermaid
(straight-use-package 'mermaid-mode)
(add-to-list 'auto-mode-alist '("\\.mmd$" . mermaid-mode))



;;
;;; restclient.el
(straight-use-package 'restclient)



;;
;;; Ruby
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-hook 'ruby-mode-hook
          (lambda ()
            (custom-set-variables
             '(ruby-align-chained-calls t)
             '(ruby-deep-indent-paren-style nil)) ; @see https://blog.willnet.in/entry/2012/06/16/212313
            (lsp-deferred)))



;;
;;; Rust
(straight-use-package 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (custom-set-variables
             '(rust-format-on-save t)
             '(lsp-prefer-flymake nil))
            (lsp-deferred)))



;;
;;; Shell scripts
(add-hook 'shell-mode-hook
          (lambda ()
            (sh-basic-offset 2)))



;;
;;; Terraform
(straight-use-package 'terraform-mode)



;;
;;; Unix style conf
(add-hook 'conf-mode-hook
          (lambda ()
            (custom-set-variables
             '(tab-width 2))))



;;
;;; Yaml
(straight-use-package 'yaml-mode)



;;
;;; Keybinds

(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x TAB") 'indent-region)

;; mwim
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)

;; Embark
(global-set-key (kbd "C-c +") 'embark-act)

;; Flycheck
(add-hook 'flycheck-mode-hook
          (lambda ()
            (define-key flycheck-mode-map (kbd "C-c ! l") 'consult-flycheck)))

;;; lsp-mode
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook
            (global-set-key (kbd "C-c C-j") 'lsp-find-definition)))

;; Magit
(global-set-key (kbd "C-c C-m C-S") 'magit-status)

;; Mermaid
(with-eval-after-load 'mermaid-mode
  (define-key mermaid-mode-map (kbd "C-c C-c") nil)
  (define-key mermaid-mode-map (kbd "C-c C-f") nil)
  (define-key mermaid-mode-map (kbd "C-c C-b") nil)
  (define-key mermaid-mode-map (kbd "C-c C-r") nil)
  (define-key mermaid-mode-map (kbd "C-c C-o") nil)
  (define-key mermaid-mode-map (kbd "C-c C-d") nil)
  (define-key mermaid-mode-map (kbd "C-c C-d c") 'mermaid-compile))

;; web-mode
(with-eval-after-load 'web-mode
  (define-key web-mode-map (kbd "C-c C-j") nil)
  (define-key web-mode-map (kbd "C-c C-m") nil))

;; Consult
(global-set-key (kbd "C-c s") 'consult-ag)
(global-set-key (kbd "C-c p f") 'consult-ls-git)

;; Xref
(add-hook 'ruby-mode-hook
          (lambda ()
            (global-set-key (kbd "C-c C-j") 'xref-find-definitions)))

;;; init.el ends here
