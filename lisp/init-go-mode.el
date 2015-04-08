;;; Basic ruby setup
(require-package 'go-mode)

(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/chitu/go/bin:/usr/local/opt/go/libexec/bin")
(setenv "GOPATH" "~/chitu/go")
(add-to-list 'load-path "~/chitu/go/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)
(require 'go-autocomplete)
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(setq exec-path (cons "/usr/local/opt/go/libexec" exec-path))
(add-to-list 'exec-path "/Users/gewang/chitu/go")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(provide 'init-go-mode)
