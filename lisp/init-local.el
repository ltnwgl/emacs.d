;;; This file bootstraps my local configuration

;;; for 3rd party .el files
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;;; ws-trim
(require 'ws-trim)
(global-ws-trim-mode t)

;;; to remove dir
(setq delete-by-moving-to-trash t)

(global-set-key (kbd "C-c z") 'eshell)
(defun eshell/emacs (file)
  (find-file file))

(setq save-interprogram-paste-before-kill nil)

(provide 'init-local)
