;;; 99_clang.el --- My init script to configure C/C++ coding environment


;;; Commentary:


;;; Code:

(add-hook 'c++-mode-hook
          '(lambda ()
             (setq flycheck-clang-language-standard "c++11")))


;;; 99_clang.el ends here
