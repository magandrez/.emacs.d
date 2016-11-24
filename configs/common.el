;; Hook for Robe to play with Enhanced Ruby Mode
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;; Monokai theme
(load-theme 'monokai t)

;; ZSH as shell
(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

;; Enable {}
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Automatically reload a file iff changed
(global-auto-revert-mode 1)

;; Reloads the current buffer without prompting
(defun reload-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

;; Kill-buffer prompt for confirmation disabled
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; Removes confirmation when searching for files or buffers that don't exist.
(setq confirm-nonexistent-file-or-buffer nil)

;; Key bindings

(global-set-key (kbd "C-x r") 'reload-this-buffer)
(global-set-key (kbd "M-o") 'other-window)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 10   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
