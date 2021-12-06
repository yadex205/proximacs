;;; init.el -- Proximacs main init script.

;; Copyright (C) 2017-2021 Kanon Kakuno
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

;; Modify emacs native features
(custom-set-variables
 '(backup-inhibited t)
 '(gc-cons-threshold 100000000)
 '(indent-tabs-mode nil)
 '(isearch-lazy-count t)
 '(make-backup-files nil)
 '(read-process-output-max (* 1024 1024))
 '(tab-width 2)
 '(whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
 )

(delete-selection-mode t)
(global-display-line-numbers-mode t)
(global-whitespace-mode t)
(menu-bar-mode 0)
(show-paren-mode t)

;; Define keybinds with emacs native features
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x TAB") 'indent-region)

;; Integrate with clipboard
(when (eq system-type 'darwin)
  (defun copy-from-macos ()
    (shell-command-to-string "pbpaste"))
  (defun paste-to-macos (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function 'paste-to-macos)
  (setq interprogram-paste-function 'copy-from-macos)
  )

;; straight.el
;; (custom-set-variables
;;  '(straight-check-for-modifications nil))
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

;; Editor appearance
(straight-use-package 'monokai-theme)
(load-theme 'monokai t)
(set-face-background 'default "unspecified-bg")

(straight-use-package 'powerline)
(powerline-center-theme)

;; Editor experience enhancement
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(straight-use-package 'helm-ls-git)
(straight-use-package 'mwim)
(straight-use-package 'path-headerline-mode)
(straight-use-package 'shackle)
(helm-mode t)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c p f") 'helm-ls-git-ls)
(global-set-key (kbd "C-c s") 'helm-do-ag)
(global-set-key (kbd "C-c S") 'helm-do-ag-project-root)
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; https://monolog.linkode.co.jp/articles/kotoh/Emacs%E3%81%A7helm%E3%82%92%E4%BD%BF%E3%81%86
(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
                          :candidates (lambda ()
                                        (let ((cmds))
                                          (mapatoms
                                           (lambda (elt) (when (commandp elt) (push elt cmds))))
                                          cmds))
                          :coerce #'intern-soft
                          :action #'command-execute)
  "Helm sources for Emacs commands.")
(custom-set-variables
 '(helm-find-files-ignore-thing-at-point t)
 '(helm-mini-default-sources
   '(helm-source-buffers-list
     helm-source-recentf
     helm-source-files-in-current-dir
     helm-source-emacs-commands))
 '(shackle-rules
   '(("*Help*" :select t)
     ("\*helm" :regexp t :align bottom)))
 )
(path-headerline-mode t)
(shackle-mode t)

;; Coding experience enhancement
(straight-use-package 'company)
(straight-use-package 'flycheck)
(straight-use-package 'flycheck-popup-tip)
(straight-use-package 'flycheck-status-emoji)
(straight-use-package 'helm-flycheck)
(straight-use-package 'lsp-mode)
(custom-set-variables
 '(company-idle-delay 0.2)
 '(flycheck-disabled-checkers '(handlebars jsx-tide))
 '(flycheck-display-errors-delay 0.3)
 '(flycheck-popup-tip-error-prefix "🖕 ")
 '(flycheck-temp-prefix ".flycheck"))
(with-eval-after-load 'company
  (add-hook 'company-mode-hook
            (lambda ()
              (define-key company-active-map (kbd "C-n") 'company-select-next)
              (define-key company-active-map (kbd "C-p") 'company-select-previous)
              (define-key company-search-map (kbd "C-n") 'company-select-next)
              (define-key company-search-map (kbd "C-p") 'company-select-previous))))
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook
            (lambda ()
              ;; Using flycheck-popup-tip-mode with lsp-mode causes "Flycheck error display error: (error Lisp nesting exceeds ‘max-lisp-eval-depth’)",
              ;; then stop to enable this globally.
              ;; (flycheck-popup-tip-mode t)
              (flycheck-status-emoji-mode t)
              (define-key flycheck-mode-map (kbd "C-c ! l") 'helm-flycheck))))

;; Magit
(straight-use-package 'magit)
(global-set-key (kbd "C-c C-m C-S") 'magit-status)

;; Language/Framework specified configurations (C/C++/C#/Obj-C)
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

;; Language/Framework specified configurations (Elisp)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (flycheck-mode t)
            (flycheck-popup-tip-mode t)
            (company-mode t)))

;; Language/Framework specified configurations (Frontend)
(straight-use-package 'emmet-mode)
(straight-use-package 'prettier-js)
(straight-use-package 'scss-mode)
(straight-use-package 'tide)
(straight-use-package 'web-mode)
(custom-set-variables
 '(emmet-expand-jsx-className? t)
 '(emmet-identation 2)
 '(emmet-mode-cursor-between-quotes t)
 '(emmet-self-closing-tag-style " /")
 '(flycheck-javascript-eslint-executable "eslint_d")
 '(web-mode-block-padding 0)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-style-padding 2))
(add-hook 'css-mode-hook
          (lambda ()
            (custom-set-variables
             '(css-indent-offset 2))
            (company-mode t)
            (flycheck-mode t)
            (flycheck-popup-tip-mode t)
            (prettier-js-mode t)))
(add-hook 'scss-mode-hook
          (lambda ()
            (custom-set-variables
             '(css-indent-offset 2))
            (delete '(".+\\.scss$" flymake-scss-init) flymake-allowed-file-name-masks)
            (company-mode t)
            (flycheck-mode t)
            (prettier-js-mode t)))
(with-eval-after-load 'web-mode
  (add-hook 'web-mode-hook
            (lambda ()
              (define-key web-mode-map (kbd "C-c C-m") nil)
              (set-face-foreground 'web-mode-html-tag-bracket-face monokai-foreground))))
(add-hook 'web-mode-hook
          (lambda ()
            (company-mode t)
            (flycheck-mode t)
            (flycheck-popup-tip-mode t)
            (prettier-js-mode t)
            (when (member (file-name-extension buffer-file-name) '("html"))
              (emmet-mode t)
              )
            (when (member (file-name-extension buffer-file-name) '("js"))
              (tide-setup)
              (tide-hl-identifier-mode t)
              (eldoc-mode t)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (flycheck-add-mode 'javascript-tide 'web-mode)
              (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))
            (when (member (file-name-extension buffer-file-name) '("ts"))
              (tide-setup)
              (tide-hl-identifier-mode t)
              (eldoc-mode t)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (flycheck-add-mode 'typescript-tide 'web-mode)
              (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append))
            (when (member (file-name-extension buffer-file-name) '("tsx"))
              (emmet-mode t)
              (custom-set-variables
               '(emmet-expand-jsx-className? t))
              (tide-setup)
              (tide-hl-identifier-mode t)
              (eldoc-mode t)
              (define-key tide-mode-map (kbd "C-c C-j") 'tide-jump-to-definition)
              (flycheck-add-mode 'javascript-eslint 'web-mode)
              (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append))
            (when (member (file-name-extension buffer-file-name) '("vue"))
              (custom-set-variables
               '(web-mode-script-padding 0)))))
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

;; Language/Framework specified configurations (GLSL)
(straight-use-package 'glsl-mode)
(add-hook 'glsl-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2))))
(add-to-list 'auto-mode-alist '("\\.fs$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert$" . glsl-mode))

;; Language/Framework specified configurations (Golang)
(straight-use-package 'go-mode)
(add-hook 'go-mode-hook
          (lambda ()
            (custom-set-variables
             '(lsp-go-use-placeholders nil)
             '(lsp-prefer-flymake nil))
            (lsp-deferred)
            (add-hook 'before-save-hook #'lsp-format-buffer t t)
            (add-hook 'before-save-hook #'lsp-organize-imports t t)))

;; Language/Framework specified configurations (Java/JVM)
(straight-use-package 'groovy-mode)
(straight-use-package 'kotlin-mode)
(add-hook 'java-mode-hook
          (lambda ()
            (custom-set-variables
             '(c-basic-offset 2))))
(add-hook 'kotlin-mode-hook
          (lambda ()
            (custom-set-variables
             '(kotlin-tab-width 2))))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; Language/Framework specified configurations (Markdown)
(straight-use-package 'markdown-mode)

;; Language/Framework specified configurations (Ruby)
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))

;; Language/Framework specified configurations (Shell script)
(add-hook 'shell-mode-hook
          (lambda ()
            (sh-basic-offset 2)))

;; Language/Framework specified configurations (Unix style conf)
(add-hook 'conf-mode-hook
          (lambda ()
            (custom-set-variables
             '(tab-width 2))))

;; Language/Framework specified configurations (Yaml)
(straight-use-package 'yaml-mode)

;; (straight-use-package 'elixir-mode)
;; (straight-use-package 'alchemist)
;; ;; Frontend
;; (straight-use-package 'vue-mode)
;; 
;; ;; Java
;; 
;; ;; languages
;; (straight-use-package 'cmake-mode)
;; (straight-use-package 'graphviz-dot-mode)
;; (straight-use-package 'nginx-mode)


;;; init.el ends here
