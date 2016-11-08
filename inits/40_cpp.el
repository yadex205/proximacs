;;; 40_cpp.el --- My init script for c++

;;; Commentary:

;;; Code:

(require 'flycheck)
(require 'projectile)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-include-path
                  (list
                   (expand-file-name "~/.nvm/versions/node/v6.3.1/include/node/")
                   (expand-file-name "/usr/local/opt/qt5/include")))
            (setq flycheck-clang-language-standard "c++11")))

(defun setup-flycheck-clang-project-path ()
  (let ((root (ignore-errors (projectile-project-root))))
    (when root
      (add-to-list
       (make-variable-buffer-local 'flycheck-clang-include-path)
       root))))

  (add-hook 'c++-mode-hook 'setup-flycheck-clang-project-path)
;;; 40_cpp.el ends here
