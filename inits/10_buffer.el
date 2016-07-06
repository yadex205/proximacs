;;; 10_buffer.el -- My init scripts about buffers

;;; Commentary:

;;; Code:

;; Enable popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; Enable whitespace-mode
;; Ref: http://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
(require 'whitespace)
(setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))

(global-whitespace-mode t)

;;; 10_buffer.el ends here
