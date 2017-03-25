(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
(local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
(local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
(local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

(auto-complete-mode 1)

(setq gofmt-command "goimports")
