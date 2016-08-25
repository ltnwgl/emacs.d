;;; This file bootstraps my local configuration

;;; for 3rd party .el files
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;;; ws-trim
(require 'ws-trim)
(global-ws-trim-mode t)
(setq-default tab-width 4)
;;; to remove dir
(setq delete-by-moving-to-trash t)

(global-set-key (kbd "C-c z") 'eshell)
(defun eshell/emacs (file)
  (find-file file))

(setq save-interprogram-paste-before-kill nil)

;;; personal working setup for rails
(defun remove-rails-tmp ()
  "remove the dir tmp of current rails project if exist"
  (shell-command (concat "rm -rf " (rinari-root) "/tmp")))

(defun rinari-web-server-jp (&optional edit-cmd-args)
  "Start JP site with EDIT-CMD-ARGS."
  (interactive "P")
  (remove-rails-tmp)
  (rvm-activate-corresponding-ruby )
  (setenv "SITE_REGION" "JP")
  (if (string-match "site-tf" (rinari-root))  (setenv "RAILS_ENV" "staging")  (setenv "RAILS_ENV" "development") )
  (rinari-web-server edit-cmd-args))

(defun rinari-web-server-us (&optional edit-cmd-args)
  "Start US site with EDIT-CMD-ARGS."
  (interactive "P")
  (remove-rails-tmp)
  (rvm-activate-corresponding-ruby )
  (setenv "SITE_REGION" "US")
  (setenv "RAILS_ENV" "development")
  (rinari-web-server edit-cmd-args))

(defun rinari-web-server-normal (&optional edit-cmd-args)
  "Start US site with EDIT-CMD-ARGS."
  (interactive "P")
  (remove-rails-tmp)
  (rvm-activate-corresponding-ruby )
  (rinari-web-server edit-cmd-args))

(global-set-key (kbd "C-c ; j") 'rinari-web-server-jp)
(global-set-key (kbd "C-c ; u") 'rinari-web-server-us)
(global-set-key (kbd "C-c ; w") 'rinari-web-server-normal)

(setq password-cache-expiry nil)
(require 'auto-complete)
(global-auto-complete-mode t)
(rvm-activate-corresponding-ruby )
(provide 'init-local)
