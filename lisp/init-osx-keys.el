(when *is-a-mac*
                                        ;  (setq mac-command-modifier 'meta)
                                        ;  (setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX")
  (setq-default default-input-method "MacOSX")
  >>>>>>> Use setq-default to set default-input-method, to allow user overrides
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (after-load 'nxml-mode
    (define-key nxml-mode-map (kbd "M-h") nil))
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
  )


(provide 'init-osx-keys)
