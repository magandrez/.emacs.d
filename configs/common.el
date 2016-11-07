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
