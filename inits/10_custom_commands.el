;;; 10_custom_commands.el --- My Emacs commands

;;; Commentary:

;;; Code:

(defun reload-emacs ()
  "Reload Emacs with latest configuration."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun open-conf-dir ()
  "Open .emacs.d."
  (interactive)
  (find-file "~/.emacs.d"))

;;; 10_custom_commands.el ends here
