;;; 20_shackle.el -- My init script for shackle


;;; Commentary:


;;; Code:

(require 'shackle)
(setq shackle-rules
      '(
        ("*Help*" :select t)
        ("\*helm" :regexp t :align bottom)))
(shackle-mode t)

;;; 20_shackle.el ends here
