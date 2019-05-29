(require 'quelpa)

;; TEMP
(quelpa '(mmm-mode :fetcher github :repo "purcell/mmm-mode"))


;; Config file management
(quelpa 'init-loader)

;; Appearance
(quelpa 'monokai-theme)
(quelpa '(nlinum :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/nlinum/nlinum.el" :fetcher url))
(quelpa 'path-headerline-mode)
(quelpa '(rainbow-mode :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/rainbow-mode/rainbow-mode.el" :fetcher url))
(quelpa 'rainbow-delimiters)
(quelpa 'powerline)
(quelpa 'shackle)


;; Utils
(quelpa 'multi-term)
(quelpa '(dired-hacks :fetcher github :repo "Fuco1/dired-hacks"))
(quelpa 'magit)


;; Editor enhancement
(quelpa 'anzu)
(quelpa 'company)
(quelpa 'flycheck)
(quelpa 'flycheck-status-emoji)
(quelpa 'flycheck-popup-tip)
(quelpa 'helm)
(quelpa 'helm-ag)
(quelpa 'helm-ls-git)
(quelpa 'helm-flycheck)
(quelpa 'mwim)


;; C/C++
(quelpa 'irony)
(quelpa 'irony-eldoc)
(quelpa 'company-irony)
(quelpa 'flycheck-irony)


;;; Objective-C
(quelpa 'flycheck-objc-clang)


;; Ruby
(quelpa 'rspec-mode)
(quelpa 'ruby-end)
(quelpa 'yard-mode)


;; Frontend
(quelpa 'web-mode)
(quelpa 'sass-mode)
(quelpa 'scss-mode)
(quelpa 'stylus-mode)
(quelpa 'emmet-mode)
(quelpa 'company-web)
(quelpa 'js2-mode)
(quelpa 'typescript-mode)
(quelpa 'tide)
(quelpa 'vue-mode)


;; Java
(quelpa 'kotlin-mode)
(quelpa 'groovy-mode)


;; Misc modes for file
(quelpa 'cmake-mode)
(quelpa 'glsl-mode)
(quelpa 'graphviz-dot-mode)
(quelpa 'gitignore-mode)
(quelpa 'json-mode)
(quelpa 'markdown-mode)
(quelpa 'nginx-mode)
(quelpa 'php-mode)
(quelpa 'yaml-mode)
