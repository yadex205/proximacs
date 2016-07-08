;;; 40_rust.el -- My init script for Rust language

;;; Commentary:

;;; Code:

;; Setup Racer AutoComplete
(require 'ac-racer)
(custom-set-variables
 '(racer-cmd (expand-file-name "~/.cargo/bin/racer"))
 '(racer-rust-src-path (expand-file-name "/usr/local/src/rust/1.10.0/src")))
(add-hook 'rust-mode-hook 'ac-racer-setup)

;; Setup flycheck for rust
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; rust-mode-hook

;;; 40_rust.el ends here
